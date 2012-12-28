#include "Category.h"
#include "ItemBag.h"
#include "AhBot.h"
#include "../World.h"
#include "Policies/SingletonImp.h"
#include "Config/Config.h"
#include "../Chat.h"
#include "AhBotConfig.h"
#include "../AuctionHouseMgr.h"
#include "../WorldSession.h"
#include "../../game/Player.h"
#include "../ObjectAccessor.h"
#include "../ObjectGuid.h"
#include "../ObjectMgr.h"
#include "../playerbot/PlayerbotAIConfig.h"
#include "../AccountMgr.h"
#include "../playerbot/playerbot.h"
#include "../Player.h"

using namespace ahbot;

bool Player::MinimalLoadFromDB( QueryResult *result, uint32 guid )
{
    bool delete_result = true;
    if (!result)
    {
        //                                        0     1           2           3           4    5          6          7
        result = CharacterDatabase.PQuery("SELECT name, position_x, position_y, position_z, map, totaltime, leveltime, at_login FROM characters WHERE guid = '%u'",guid);
        if (!result)
            return false;
    }
    else
        delete_result = false;

    Field *fields = result->Fetch();

    // overwrite possible wrong/corrupted guid
    Object::_Create( guid, 0, HIGHGUID_PLAYER );

    m_name = fields[0].GetCppString();

    Relocate(fields[1].GetFloat(),fields[2].GetFloat(),fields[3].GetFloat());
    SetLocationMapId(fields[4].GetUInt32());

    m_Played_time[PLAYED_TIME_TOTAL] = fields[5].GetUInt32();
    m_Played_time[PLAYED_TIME_LEVEL] = fields[6].GetUInt32();

    m_atLoginFlags = fields[7].GetUInt32();

    if (delete_result)
        delete result;

    for (int i = 0; i < PLAYER_SLOTS_COUNT; ++i)
        m_items[i] = NULL;

    if (HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_GHOST))
        m_deathState = DEAD;

    return true;
}

bool ChatHandler::HandleAhBotCommand(char* args)
{
    auctionbot.HandleCommand(args);
    return true;
}

INSTANTIATE_SINGLETON_1( ahbot::AhBot );

uint32 AhBot::auctionIds[MAX_AUCTIONS] = {2, 6, 7};

void AhBot::Init()
{
    sLog.outString("Initializing AhBot by ike3");

    if (!sAhBotConfig.Initialize())
        return;

    session = new WorldSession(sAhBotConfig.account, NULL, SEC_PLAYER, true, 0, LOCALE_enUS);
    player = new Player(session);
    if (!player->MinimalLoadFromDB(NULL, GetAHBplayerGUID()))
    {
        sLog.outString("AhBot character [account=%d, guid=%d] not found. AhBot is disabled.",
                sAhBotConfig.account, sAhBotConfig.guid);
        delete player;
        delete session;
        player = NULL;
        session = NULL;
        return;
    }

    ObjectAccessor::Instance().AddObject(player);

    availableItems.Init();

    sLog.outString("AhBot loaded");
}

AhBot::~AhBot()
{
    if (player)
    {
        ObjectAccessor::Instance().RemoveObject(player);
        delete player;
        delete session;
    }
}

ObjectGuid AhBot::GetAHBplayerGUID()
{
    return ObjectGuid(sAhBotConfig.guid);
}

void AhBot::Update()
{
    time_t now = time(0);

    if (now < nextAICheckTime)
        return;

    nextAICheckTime = time(0) + sAhBotConfig.updateInterval;

    ForceUpdate();
}

void AhBot::ForceUpdate()
{
    if (!player)
        return;

    sLog.outString("AhBot is now checking auctions");

    if (!allBidders.size())
        LoadRandomBots();

    CheckCategoryMultipliers();

    for (int i = 0; i < MAX_AUCTIONS; i++)
    {
        InAuctionItemsBag inAuctionItems(auctionIds[i]);
        Update(i, &inAuctionItems);
    }

    sLog.outString("AhBot auction check finished. Next check in %d seconds", sAhBotConfig.updateInterval);
}

void AhBot::Update(int auction, ItemBag* inAuctionItems)
{
    inAuctionItems->Init(true);

    for (int i = 0; i < CategoryList::instance.size(); i++)
        Update(auction, CategoryList::instance[i], inAuctionItems);

    CleanupHistory();
}

void AhBot::Update(int auction, Category* category, ItemBag* inAuctionItems)
{
    Answer(auction, category, inAuctionItems);
    AddAuctions(auction, category, inAuctionItems);
}

void AhBot::Answer(int auction, Category* category, ItemBag* inAuctionItems)
{
    AuctionHouseEntry const* ahEntry = sAuctionHouseStore.LookupEntry(auctionIds[auction]);
    if(!ahEntry)
        return;

    AuctionHouseObject* auctionHouse = sAuctionMgr.GetAuctionsMap(ahEntry);
    AuctionHouseObject::AuctionEntryMap const& auctionEntryMap = auctionHouse->GetAuctions();

    int64 availableMoney = GetAvailableMoney(auctionIds[auction]);

    vector<AuctionEntry*> entries;
    for (AuctionHouseObject::AuctionEntryMap::const_iterator itr = auctionEntryMap.begin(); itr != auctionEntryMap.end(); ++itr)
        entries.push_back(itr->second);

    Shuffle(entries);

    for (vector<AuctionEntry*>::iterator itr = entries.begin(); itr != entries.end(); ++itr)
    {
        AuctionEntry *entry = *itr;
        if (IsBotAuction(entry->owner) || IsBotAuction(entry->bidder))
            continue;

        if (urand(0, 100) > sAhBotConfig.buyProbability * 100)
            continue;

        Item *item = sAuctionMgr.GetAItem(entry->itemGuidLow);
        if (!item)
            continue;

        uint32 price = category->GetPricingStrategy()->GetBuyPrice(item->GetProto(), auctionIds[auction]);
        if (!price || !item->GetCount())
            continue;

        uint32 bidPrice = item->GetCount() * price;
        uint32 buyoutPrice = item->GetCount() * urand(price, 4 * price / 3);

        uint32 curPrice = entry->bid;
        if (!curPrice) curPrice = entry->startbid;
        if (!curPrice) curPrice = entry->buyout;

        if (curPrice > buyoutPrice)
            continue;

        if (availableMoney < curPrice)
            continue;

        if (entry->bidder && !IsBotAuction(entry->bidder))
            player->GetSession()->SendAuctionOutbiddedMail(entry);

        uint32 bidder = GetRandomBidder(auctionIds[auction]);
        entry->bidder = bidder;
        entry->bid = curPrice + urand(1, 1 + bidPrice / 10);
        availableMoney -= curPrice;

        updateMarketPrice(item->GetProto()->ItemId, entry->buyout / item->GetCount(), auctionIds[auction]);

        if (entry->buyout && (entry->bid >= entry->buyout || 100 * (entry->buyout - entry->bid) / price < 25))
        {
            sLog.outDetail("AhBot %d won %s in auction %d for %d", bidder, item->GetProto()->Name1, auctionIds[auction], entry->buyout);

            entry->bid = entry->buyout;
            entry->AuctionBidWinning(NULL);
        }
        else
        {
            sLog.outDetail("AhBot %d placed bid %d for %s in auction %d", bidder, entry->bid, item->GetProto()->Name1, auctionIds[auction]);

            CharacterDatabase.PExecute("UPDATE auction SET buyguid = '%u',lastbid = '%u' WHERE id = '%u'",
                entry->bidder, entry->bid, entry->Id);
        }
   }
}

void AhBot::AddAuctions(int auction, Category* category, ItemBag* inAuctionItems)
{
    vector<uint32>& inAuction = inAuctionItems->Get(category);

    int32 maxAllowedAuctionCount = category->GetMaxAllowedAuctionCount();
    if (inAuctionItems->GetCount(category) >= maxAllowedAuctionCount / 2)
        return;

    maxAllowedAuctionCount = urand(1 + maxAllowedAuctionCount / 2, maxAllowedAuctionCount);

    vector<uint32> available = availableItems.Get(category);
    Shuffle(available);

    for (vector<uint32>::iterator i = available.begin(); i != available.end(); i++)
    {
        if (inAuctionItems->GetCount(category) >= maxAllowedAuctionCount)
            break;

        if (urand(0, 100) > sAhBotConfig.sellProbability * 100)
            continue;

        ItemPrototype const* proto = sObjectMgr.GetItemPrototype(*i);
        if (!proto)
            continue;

        int32 maxAllowedItems = category->GetMaxAllowedItemAuctionCount(proto);
        if (maxAllowedItems && inAuctionItems->GetCount(category, proto->ItemId) >= maxAllowedItems)
            continue;

        inAuctionItems->Add(proto);
        AddAuction(auction, category, proto);
    }
}

void AhBot::AddAuction(int auction, Category* category, ItemPrototype const* proto)
{
    Item* item = Item::CreateItem(proto->ItemId, 1, NULL);
    if (!item)
        return;

    uint32 randomPropertyId = Item::GenerateItemRandomPropertyId(proto->ItemId);
    if (randomPropertyId)
        item->SetItemRandomProperties(randomPropertyId);

    uint32 price = category->GetPricingStrategy()->GetSellPrice(proto, auctionIds[auction]);

    sLog.outDebug("AddAuction: market price adjust");
    updateMarketPrice(proto->ItemId, price, auctionIds[auction]);

    price = category->GetPricingStrategy()->GetBuyPrice(proto, auctionIds[auction]);

    uint32 stackCount = category->GetStackCount(proto);
    if (!price || !stackCount)
        return;

    if (urand(0, 100) <= sAhBotConfig.underPriceProbability * 100)
        price = price * 100 / urand(150, 500);

    uint32 bidPrice = stackCount * price;
    uint32 buyoutPrice = stackCount * urand(price, 4 * price / 3);
    item->SetCount(stackCount);

    AuctionHouseEntry const* ahEntry = sAuctionHouseStore.LookupEntry(auctionIds[auction]);
    if(!ahEntry)
        return;

    AuctionHouseObject* auctionHouse = sAuctionMgr.GetAuctionsMap(ahEntry);

    uint32 owner = GetRandomBidder(auctionIds[auction]);
    AuctionEntry* auctionEntry = new AuctionEntry;
    auctionEntry->Id = sObjectMgr.GenerateAuctionID();
    auctionEntry->itemGuidLow = item->GetGUIDLow();
    auctionEntry->itemTemplate = item->GetEntry();
    auctionEntry->owner = owner;
    auctionEntry->startbid = bidPrice;
    auctionEntry->buyout = buyoutPrice;
    auctionEntry->bidder = 0;
    auctionEntry->bid = 0;
    auctionEntry->deposit = 0;
    auctionEntry->expireTime = (time_t) (urand(8, 24) * 60 * 60 + time(NULL));
    auctionEntry->moneyDeliveryTime = 0;
    auctionEntry->auctionHouseEntry = ahEntry;
    item->SaveToDB();

    sAuctionMgr.AddAItem(item);

    auctionHouse->AddAuction(auctionEntry);
    auctionEntry->SaveToDB();

    sLog.outDetail("AhBot %d added %d of %s to auction %d for %d..%d", owner, stackCount, proto->Name1, auctionIds[auction], bidPrice, buyoutPrice);
}

void AhBot::HandleCommand(string command)
{
    if (!player)
        return;

    if (command == "expire")
    {
        for (int i = 0; i < MAX_AUCTIONS; i++)
            Expire(i);

        return;
    }

    if (command == "update")
    {
        ForceUpdate();
        return;
    }

    uint32 itemId = atoi(command.c_str());
    if (!itemId)
    {
        sLog.outString("ahbot expire - expire all auctions");
        sLog.outString("ahbot update - update all auctions");
        sLog.outString("ahbot <itemId> - show item price");
        return;
    }

    ItemPrototype const* proto = sObjectMgr.GetItemPrototype(itemId);
    if (!proto)
        return;

    for (int i=0; i<CategoryList::instance.size(); i++)
    {
        Category* category = CategoryList::instance[i];
        if (category->Contains(proto))
        {
            ostringstream out;
            out << proto->Name1 << " (" << category->GetDisplayName() << ")"
                << "\n";
            for (int auction = 0; auction < MAX_AUCTIONS; auction++)
            {
                out << "--- auction house " << auctionIds[auction] <<  "(money: "
                    << GetAvailableMoney(auctionIds[auction])
                    << ") ---\n";

                out << "sell: " << category->GetPricingStrategy()->GetSellPrice(proto, auctionIds[auction])
                    << " ("  << category->GetPricingStrategy()->ExplainSellPrice(proto, auctionIds[auction]) << ")"
                    << "\n";

                out << "buy: " << category->GetPricingStrategy()->GetBuyPrice(proto, auctionIds[auction])
                    << " ("  << category->GetPricingStrategy()->ExplainBuyPrice(proto, auctionIds[auction]) << ")"
                    << "\n";
            }
            sLog.outString(out.str().c_str());
            break;
        }
    }
}

void AhBot::Expire(int auction)
{
    if (!player)
        return;

    AuctionHouseEntry const* ahEntry = sAuctionHouseStore.LookupEntry(auctionIds[auction]);
    if(!ahEntry)
        return;

    AuctionHouseObject* auctionHouse = sAuctionMgr.GetAuctionsMap(ahEntry);

    AuctionHouseObject::AuctionEntryMap const& auctions = auctionHouse->GetAuctions();
    AuctionHouseObject::AuctionEntryMap::const_iterator itr = auctions.begin();

    int count = 0;
    while (itr != auctions.end())
    {
        if (IsBotAuction(itr->second->owner))
        {
            itr->second->expireTime = sWorld.GetGameTime();
            count++;
        }

        ++itr;
    }

    CharacterDatabase.PExecute("DELETE FROM ahbot_category");
    sLog.outString("%d auctions marked as expired in auction %d", count, auctionIds[auction]);
}

void AhBot::AddToHistory(AuctionEntry* entry)
{
    if (!player || !entry)
        return;

    if (!IsBotAuction(entry->owner) && !IsBotAuction(entry->bidder))
        return;

    ItemPrototype const* proto = sObjectMgr.GetItemPrototype(entry->itemTemplate);
    if (!proto)
        return;

    string category = "";
    for (int i = 0; i < CategoryList::instance.size(); i++)
    {
        if (CategoryList::instance[i]->Contains(proto))
        {
            category = CategoryList::instance[i]->GetName();
            break;
        }
    }

    uint32 won = AHBOT_WON_PLAYER;
    if (IsBotAuction(entry->bidder))
        won = AHBOT_WON_SELF;

    sLog.outDebug("AddToHistory: market price adjust");
    int count = entry->itemCount ? entry->itemCount : 1;
    updateMarketPrice(proto->ItemId, entry->buyout / count, entry->auctionHouseEntry->houseId);

    uint32 now = time(0);
    CharacterDatabase.PExecute("INSERT INTO ahbot_history (buytime, item, bid, buyout, category, won, auction_house) "
        "VALUES ('%u', '%u', '%u', '%u', '%s', '%u', '%u')",
        now, entry->itemTemplate, entry->bid ? entry->bid : entry->startbid, entry->buyout,
        category.c_str(), won, entry->auctionHouseEntry->houseId);
}


void AhBot::CleanupHistory()
{
    uint32 when = time(0) - 3600 * 24 * sAhBotConfig.historyDays;
    CharacterDatabase.PExecute("DELETE FROM ahbot_history WHERE buytime < '%u'", when);
}

uint32 AhBot::GetAvailableMoney(uint32 auctionHouse)
{
    int64 result = sAhBotConfig.alwaysAvailableMoney;

    map<uint32, uint32> data;
    data[AHBOT_WON_PLAYER] = 0;
    data[AHBOT_WON_SELF] = 0;

    QueryResult* results = CharacterDatabase.PQuery(
        "SELECT won, SUM(bid) FROM ahbot_history WHERE auction_house = '%u' GROUP BY won HAVING won > 0 ORDER BY won",
        auctionHouse);
    if (results)
    {
        do
        {
            Field* fields = results->Fetch();
            data[fields[0].GetUInt32()] = fields[1].GetUInt32();

        } while (results->NextRow());

        delete results;
    }

    results = CharacterDatabase.PQuery(
        "SELECT max(buytime) FROM ahbot_history WHERE auction_house = '%u' AND won = '2'",
        auctionHouse);
    if (results)
    {
        Field* fields = results->Fetch();
        uint32 lastBuyTime = fields[0].GetUInt32();
        uint32 now = time(0);
        if (lastBuyTime && now > lastBuyTime)
        result += (now - lastBuyTime) / 3600 / 24 * sAhBotConfig.alwaysAvailableMoney;

        delete results;
    }

    AuctionHouseEntry const* ahEntry = sAuctionHouseStore.LookupEntry(auctionHouse);
    if(!ahEntry)
        return result;

    AuctionHouseObject::AuctionEntryMap const& auctionEntryMap = sAuctionMgr.GetAuctionsMap(ahEntry)->GetAuctions();
    for (AuctionHouseObject::AuctionEntryMap::const_iterator itr = auctionEntryMap.begin(); itr != auctionEntryMap.end(); ++itr)
    {
        AuctionEntry *entry = itr->second;
        if (!IsBotAuction(entry->bidder))
            continue;

        result -= entry->bid;
    }

    result += (data[AHBOT_WON_PLAYER] - data[AHBOT_WON_SELF]);
    return result < 0 ? 0 : (uint32)result;
}

void AhBot::CheckCategoryMultipliers()
{
    QueryResult* results = CharacterDatabase.PQuery("SELECT category, multiplier, expire_time FROM ahbot_category");
    if (results)
    {
        do
        {
            Field* fields = results->Fetch();
            categoryMultipliers[fields[0].GetCppString()] = fields[1].GetFloat();
            categoryMultiplierExpireTimes[fields[0].GetCppString()] = fields[2].GetUInt64();

        } while (results->NextRow());

        delete results;
    }

    CharacterDatabase.PExecute("DELETE FROM ahbot_category");

    for (int i = 0; i < CategoryList::instance.size(); i++)
    {
        string name = CategoryList::instance[i]->GetName();
        if (categoryMultiplierExpireTimes[name] <= time(0) || categoryMultipliers[name] <= 0)
        {
            categoryMultipliers[name] = (double)urand(20, 100) / 20.0;
            categoryMultiplierExpireTimes[name] = time(0) + urand(4, 7) * 3600 * 24;
        }

        CharacterDatabase.PExecute("INSERT INTO ahbot_category (category, multiplier, expire_time) VALUES ('%s','%f','%u')",
                name.c_str(), categoryMultipliers[name], categoryMultiplierExpireTimes[name]);
    }
}


void AhBot::updateMarketPrice(uint32 itemId, double price, uint32 auctionHouse)
{
    double marketPrice = 0;

    QueryResult* results = CharacterDatabase.PQuery("SELECT price FROM ahbot_price WHERE item = '%u' AND auction_house = '%u'", itemId, auctionHouse);
    if (results)
    {
        marketPrice = results->Fetch()[0].GetFloat();
        delete results;
    }

    if (marketPrice > 0)
        marketPrice = (marketPrice + price) / 2;
    else
        marketPrice = price;

    CharacterDatabase.PExecute("DELETE FROM ahbot_price WHERE item = '%u' AND auction_house = '%u'", itemId, auctionHouse);
    CharacterDatabase.PExecute("INSERT INTO ahbot_price (item, price, auction_house) VALUES ('%u', '%lf', '%u')", itemId, marketPrice, auctionHouse);
}

bool AhBot::IsBotAuction(uint32 bidder)
{
    return bidder == player->GetGUIDLow() || allBidders.find(bidder) != allBidders.end();
}

uint32 AhBot::GetRandomBidder(uint32 auctionHouse)
{
    vector<uint32> guids = bidders[auctionHouse];
    int index = urand(0, guids.size() - 1);
    if (guids.size() <= index)
        return player->GetGUIDLow();

    return guids[index];
}

void AhBot::LoadRandomBots()
{
    for (list<uint32>::iterator i = sPlayerbotAIConfig.randomBotAccounts.begin(); i != sPlayerbotAIConfig.randomBotAccounts.end(); i++)
    {
        uint32 accountId = *i;
        if (!sAccountMgr.GetCharactersCount(accountId))
            continue;

        QueryResult *result = CharacterDatabase.PQuery("SELECT guid, race FROM characters WHERE account = '%u'", accountId);
        if (!result)
            continue;

        do
        {
            Field* fields = result->Fetch();
            uint32 guid = fields[0].GetUInt32();
            uint32 race = fields[1].GetUInt32();
            uint32 auctionHouse = PlayerbotAI::IsOpposing(race, RACE_HUMAN) ? 6 : 2;
            bidders[auctionHouse].push_back(guid);
            bidders[7].push_back(guid);
            allBidders.insert(guid);
        } while (result->NextRow());
        delete result;
    }

    sLog.outDetail("{2=%d,6=%d,7=%d} bidders loaded", bidders[2].size(), bidders[6].size(), bidders[7].size());
}
