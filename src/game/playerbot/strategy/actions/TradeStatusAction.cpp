#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "TradeStatusAction.h"

#include "../ItemVisitors.h"
#include "../../PlayerbotAIConfig.h"
#include "../../../ahbot/AhBot.h"
#include "../../RandomPlayerbotMgr.h"

using namespace ai;



bool TradeStatusAction::Execute(Event event)
{
    Player* trader = bot->GetTrader();
    if (!trader)
        return false;

    if (trader != master)
    {
        WorldPacket data(SMSG_MESSAGECHAT, 1024);
        bot->BuildPlayerChat(&data, CHAT_MSG_WHISPER, "I'm kind of busy now", LANG_UNIVERSAL);
        trader->GetSession()->SendPacket(&data);
    }

    if (trader != master || !ai->GetSecurity()->CheckLevelFor(PLAYERBOT_SECURITY_ALLOW_ALL, true, master))
    {
        WorldPacket p;
        uint32 status = 0;
        p << status;
        bot->GetSession()->HandleCancelTradeOpcode(p);
        return false;
    }

    WorldPacket p(event.getPacket());
    p.rpos(0);
    uint32 status;
    p >> status;

    if (status == TRADE_STATUS_TRADE_ACCEPT)
    {
        WorldPacket p;
        uint32 status = 0;
        p << status;

        if (CheckTrade())
        {
            bot->GetSession()->HandleAcceptTradeOpcode(p);
            return true;
        }
    }
    else if (status == TRADE_STATUS_BEGIN_TRADE)
    {
        if (!bot->isInFront(trader, sPlayerbotAIConfig.spellDistance, M_PI / 2))
            bot->SetFacingToObject(trader);
        BeginTrade();
        return true;
    }

    return false;
}


void TradeStatusAction::BeginTrade()
{
    WorldPacket p;
    bot->GetSession()->HandleBeginTradeOpcode(p);

    ListItemsVisitor visitor;
    IterateItems(&visitor);

    ai->TellMaster("=== Trade ===");
    TellItems(visitor.items);
}

bool TradeStatusAction::CheckTrade()
{
    if (!sRandomPlayerbotMgr.IsRandomBot(bot))
        return true;

    if (!bot->GetTradeData() || !master->GetTradeData())
        return false;

    for (uint32 slot = 0; slot < TRADE_SLOT_TRADED_COUNT; ++slot)
    {
        Item* item = bot->GetTradeData()->GetItem((TradeSlots)slot);
        if (item && !auctionbot.GetSellPrice(item->GetProto()))
        {
            ostringstream out;
            out << chat->formatItem(item->GetProto()) << " - This is not for sale";
            ai->TellMaster(out);
            return false;
        }

        item = master->GetTradeData()->GetItem((TradeSlots)slot);
        if (item && !auctionbot.GetSellPrice(item->GetProto()))
        {
            ostringstream out;
            out << chat->formatItem(item->GetProto()) << " - I don't need this";
            ai->TellMaster(out);
            return false;
        }
    }

    int32 botMoney = CalculateCost(bot->GetTradeData());
    int32 playerMoney = CalculateCost(master->GetTradeData());

    if (playerMoney >= botMoney)
        return true;

    ostringstream out;
    out << "I want " << chat->formatMoney(botMoney - playerMoney) << " for this";
    ai->TellMaster(out);
    return false;
}

int32 TradeStatusAction::CalculateCost(TradeData* data)
{
    if (!data)
        return 0;

    uint32 sum = data->GetMoney();
    for (uint32 slot = 0; slot < TRADE_SLOT_TRADED_COUNT; ++slot)
    {
        Item* item = data->GetItem((TradeSlots)slot);
        if (!item)
            continue;

        sum += item->GetCount() * auctionbot.GetSellPrice(item->GetProto());
    }

    return sum;
}
