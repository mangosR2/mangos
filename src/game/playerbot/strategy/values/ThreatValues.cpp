#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "ThreatValues.h"
#include "../../../ThreatManager.h"

using namespace ai;

uint8 ThreatValue::Calculate()
{
    Unit* target = AI_VALUE(Unit*, "current target");
    if (!target)
        return 0;

    if (target->GetObjectGuid().IsPlayer())
        return 0;

    Group* group = master->GetGroup();
    if (!group)
        return 0;

    float botThreat = target->getThreatManager().getThreat(bot);
    float maxThreat = 0;

	Group::MemberSlotList const& groupSlot = group->GetMemberSlots();
	for (Group::member_citerator itr = groupSlot.begin(); itr != groupSlot.end(); itr++)
	{
		Player *player = sObjectMgr.GetPlayer(itr->guid);
		if( !player || !player->isAlive() || player == bot)
			continue;

	    float threat = target->getThreatManager().getThreat(player);
	    if (maxThreat < threat)
	        maxThreat = threat;
	}

	if (maxThreat <= 0)
	    return 0;

	return botThreat * 100 / maxThreat;
}

