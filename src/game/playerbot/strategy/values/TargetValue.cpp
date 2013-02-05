#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "TargetValue.h"
#include "../Unit.h"

using namespace ai;

Unit* TargetValue::FindTarget(FindTargetStrategy* strategy)
{

    Group* group = bot->GetGroup();
    if (!group)
    {
        strategy->CheckAttackers(bot);
        return strategy->GetResult();
    }

    for (GroupReference *gref = group->GetFirstMember(); gref; gref = gref->next())
    {
        Player* member = gref->getSource();
        if (!member || !member->isAlive() || !member->IsWithinLOSInMap(member))
            continue;

        strategy->CheckAttackers(member);
    }

    return strategy->GetResult();
}


void FindTargetStrategy::CheckAttackers(Player* player)
{
    Player* bot = ai->GetBot();
    for (HostileReference* ref = player->getHostileRefManager().getFirst(); ref; ref = ref->next())
    {
        ThreatManager* threatManager = ref->getSource();
        Unit *attacker = threatManager->getOwner();
        if (attacker && alreadyChecked.find(attacker) == alreadyChecked.end() &&
            !attacker->isDead() &&
            !attacker->IsPolymorphed() &&
            !attacker->isFrozen() &&
            !attacker->isCharmed() &&
            !attacker->isFeared() &&
            !attacker->hasUnitState(UNIT_STAT_ISOLATED) &&
            !attacker->IsFriendlyTo(bot) &&
            bot->IsWithinLOSInMap(attacker))
        {
            CheckAttacker(player, attacker, threatManager);
            alreadyChecked.insert(attacker);
        }
    }
}

void FindTargetStrategy::GetPlayerCount(Unit* creature, int* tankCount, int* dpsCount)
{
    Player* bot = ai->GetBot();
    if (tankCountCache.find(creature) != tankCountCache.end())
    {
        *tankCount = tankCountCache[creature];
        *dpsCount = dpsCountCache[creature];
        return;
    }

    *tankCount = 0;
    *dpsCount = 0;

    GuidSet attackers = creature->GetMap()->GetAttackersFor(bot->GetObjectGuid());
    for (GuidSet::const_iterator i = attackers.begin(); i != attackers.end(); i++)
    {
        ObjectGuid guid = *i;
        if (!guid.IsPlayer())
            continue;

        Player* attacker = sObjectMgr.GetPlayer(guid, true);
        if (!attacker || !attacker->isAlive() || attacker == bot)
            continue;

        if (ai->IsTank(attacker))
            (*tankCount)++;
        else
            (*dpsCount)++;
    }

    tankCountCache[creature] = *tankCount;
    dpsCountCache[creature] = *dpsCount;
}
