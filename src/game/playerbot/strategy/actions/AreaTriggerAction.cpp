#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "AreaTriggerAction.h"
#include "../../PlayerbotAIConfig.h"


using namespace ai;

bool ReachAreaTriggerAction::Execute(Event event)
{
    uint32 triggerId;
    WorldPacket p(event.getPacket());
    p.rpos(0);
    p >> triggerId;

    AreaTriggerEntry const* atEntry = sAreaTriggerStore.LookupEntry(triggerId);
    if(!atEntry)
        return false;

    AreaTrigger const* at = sObjectMgr.GetAreaTrigger(triggerId);
    if (!at)
    {
        WorldPacket p1(CMSG_AREATRIGGER);
        p1 << triggerId;
        p1.rpos(0);
        bot->GetSession()->HandleAreaTriggerOpcode(p1);

        return true;
    }

    if (bot->GetMapId() != atEntry->mapid || bot->GetDistance(atEntry->x, atEntry->y, atEntry->z) > sPlayerbotAIConfig.sightDistance)
    {
        ai->TellMaster("I will not follow you - too far away");
        return true;
    }

    ai->ChangeStrategy("-follow,+stay", BOT_STATE_NON_COMBAT);

    MotionMaster &mm = *bot->GetMotionMaster();
    mm.Clear();
	mm.MovePoint(atEntry->mapid, atEntry->x, atEntry->y, atEntry->z);
    ai->SetNextCheckDelay(sPlayerbotAIConfig.teleportDelay);

    ostringstream out; out << "I will follow you in " << sPlayerbotAIConfig.teleportDelay / 1000 << " seconds";
    ai->TellMaster(out);

    context->GetValue<LastMovement&>("last movement")->Get().lastAreaTrigger = triggerId;

    return true;
}



bool AreaTriggerAction::Execute(Event event)
{
    LastMovement& movement = context->GetValue<LastMovement&>("last movement")->Get();

    uint32 triggerId = movement.lastAreaTrigger;
    movement.lastAreaTrigger = 0;

    AreaTriggerEntry const* atEntry = sAreaTriggerStore.LookupEntry(triggerId);
    if(!atEntry)
        return false;

    AreaTrigger const* at = sObjectMgr.GetAreaTrigger(triggerId);
    if (!at)
        return true;

    ai->ChangeStrategy("-follow,+stay", BOT_STATE_NON_COMBAT);

    MotionMaster &mm = *bot->GetMotionMaster();
    mm.Clear();

    WorldPacket p(CMSG_AREATRIGGER);
    p << triggerId;
    p.rpos(0);
    bot->GetSession()->HandleAreaTriggerOpcode(p);

    return true;
}
