#pragma once;

#include "Category.h"
#include "ItemBag.h"
#include "../playerbot/PlayerbotAIBase.h"
#include "../AuctionHouseMgr.h"
#include "../ObjectGuid.h"
#include "../WorldSession.h"

#define MAX_AUCTIONS 3
#define AHBOT_WON_EXPIRE 0
#define AHBOT_WON_PLAYER 1
#define AHBOT_WON_SELF 2

namespace ahbot
{
    using namespace std;

    class AhBot
    {
    public:
        AhBot() : nextAICheckTime(0), player(NULL) {}
        virtual ~AhBot();

    public:
        ObjectGuid GetAHBplayerGUID();
        void Init();
        void Update();
        void ForceUpdate();
        void HandleCommand(string command);
        void Won(AuctionEntry* entry) { AddToHistory(entry); }
        void Expired(AuctionEntry* entry) { /* do nothing */ }
        double GetCategoryMultiplier(string category) { return categoryMultipliers[category]; }
        int32 GetSellPrice(ItemPrototype const* proto);

    private:
        void Update(int auction, ItemBag* inAuction);
        void Update(int auction, Category* category, ItemBag* inAuctionItems);
        void Answer(int auction, Category* category, ItemBag* inAuctionItems);
        void AddAuctions(int auction, Category* category, ItemBag* inAuctionItems);
        void AddAuction(int auction, Category* category, ItemPrototype const* proto);
        void Expire(int auction);
        void AddToHistory(AuctionEntry* entry);
        void CleanupHistory();
        uint32 GetAvailableMoney(uint32 auctionHouse);
        void CheckCategoryMultipliers();
        void updateMarketPrice(uint32 itemId, double price, uint32 auctionHouse);
        bool IsBotAuction(uint32 bidder);
        uint32 GetRandomBidder(uint32 auctionHouse);
        void LoadRandomBots();

    private:
        AvailableItemsBag availableItems;
        static uint32 auctionIds[MAX_AUCTIONS];
        WorldSession* session;
        Player* player;
        time_t nextAICheckTime;
        map<string, double> categoryMultipliers;
        map<string, uint64> categoryMultiplierExpireTimes;
        map<uint32, vector<uint32> > bidders;
        set<uint32> allBidders;
    };
};

#define auctionbot MaNGOS::Singleton<ahbot::AhBot>::Instance()
