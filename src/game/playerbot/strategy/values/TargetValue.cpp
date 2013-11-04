#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "TargetValue.h"
#include "../Unit.h"

using namespace ai;

Unit* TargetValue::FindTarget(FindTargetStrategy* strategy)
{
    list<ObjectGuid> attackers = ai->GetAiObjectContext()->GetValue<list<ObjectGuid> >("attackers")->Get();
    for (list<ObjectGuid>::iterator i = attackers.begin(); i != attackers.end(); ++i)
    {
        Unit* unit = ai->GetUnit(*i);
        if (!unit)
            continue;

        ThreatManager &threatManager = unit->getThreatManager();
        strategy->CheckAttacker(unit, &threatManager);
    }

    return strategy->GetResult();
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
