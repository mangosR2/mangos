#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "LootRollAction.h"


using namespace ai;

bool LootRollAction::Execute(Event event)
{
    Player *bot = ai->GetBot();

    WorldPacket p(event.getPacket()); //WorldPacket packet for CMSG_LOOT_ROLL, (8+4+1)
    ObjectGuid Guid;
    uint32 NumberOfPlayers;
    uint8 rollType;
    p.rpos(0); //reset packet pointer
    p >> Guid; //guid of the item rolled
    p >> NumberOfPlayers; //number of players invited to roll
    p >> rollType; //need,greed or pass on roll


    uint32 choice = urand(0,2); //returns 0,1,or 2

    Group* group = bot->GetGroup();
    if(!group)
        return false;

    switch (group->GetLootMethod())
    {
    case GROUP_LOOT:
        // bot random roll
        group->CountRollVote(bot, Guid, NumberOfPlayers, ROLL_NEED);
        break;
    case NEED_BEFORE_GREED:
        choice = 1;
        // bot need roll
        group->CountRollVote(bot, Guid, NumberOfPlayers, ROLL_NEED);
        break;
    case MASTER_LOOT:
        choice = 0;
        // bot pass on roll
        group->CountRollVote(bot, Guid, NumberOfPlayers, ROLL_PASS);
        break;
    default:
        break;
    }

    switch (rollType)
    {
    case ROLL_NEED:
        bot->GetAchievementMgr().UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_ROLL_NEED, 1);
        break;
    case ROLL_GREED:
        bot->GetAchievementMgr().UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_ROLL_GREED, 1);
        break;
    }
    

    return true;
}
