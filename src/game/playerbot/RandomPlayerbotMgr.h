#ifndef _RandomPlayerbotMgr_H
#define _RandomPlayerbotMgr_H

#include "Common.h"
#include "PlayerbotAIBase.h"

class WorldPacket;
class Player;
class Unit;
class Object;
class Item;

using namespace std;

class MANGOS_DLL_SPEC RandomPlayerbotMgr : public PlayerbotAIBase
{
    public:
        RandomPlayerbotMgr(Player* const master);
        virtual ~RandomPlayerbotMgr();

        virtual void UpdateAIInternal(uint32 elapsed);

	public:
        bool IsRandomBot(Player* bot);
        bool IsRandomBot(uint32 bot);
        void DoPvpAttack(Player* bot);
        void Randomize(Player* bot);
        void RandomizeFirst(Player* bot);
        void IncreaseLevel(Player* bot);
        void ScheduleTeleport(uint32 bot);

    private:
        uint32 GetEventValue(uint32 bot, string event);
        uint32 SetEventValue(uint32 bot, string event, uint32 value, uint32 validIn);
        list<uint32> GetBots();
        vector<uint32> GetFreeBots(bool opposing);
        uint32 AddRandomBot(bool opposing);
        bool ProcessBot(uint32 bot);
        void ScheduleRandomize(uint32 bot, uint32 time);
        void RandomTeleport(Player* bot, uint32 mapId, float teleX, float teleY, float teleZ);
        void RandomTeleportForLevel(Player* bot);
        void RandomTeleport(Player* bot, vector<WorldLocation> &locs);
        void Refresh(Player* bot);
        uint32 GetZoneLevel(uint32 mapId, float teleX, float teleY, float teleZ);

    private:
        Player* const master;
        uint32 account;
};

#endif
