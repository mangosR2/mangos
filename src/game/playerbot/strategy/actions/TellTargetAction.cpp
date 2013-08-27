#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "TellTargetAction.h"


using namespace ai;

bool TellTargetAction::Execute(Event event)
{
    Unit* target = context->GetValue<Unit*>("current target")->Get();
    if (target)
    {
        ostringstream out;
		out << "Attacking " << target->GetName();
        ai->TellMaster(out);

        context->GetValue<Unit*>("old target")->Set(target);
    }
    return true;
}

bool TellAttackersAction::Execute(Event event)
{
    ai->TellMaster("--- Attackers ---");

    list<ObjectGuid> attackers = context->GetValue<list<ObjectGuid> >("attackers")->Get();
    for (list<ObjectGuid>::iterator i = attackers.begin(); i != attackers.end(); i++)
    {
        Unit* unit = ai->GetUnit(*i);
        if (!unit || !unit->isAlive())
            continue;

        ai->TellMaster(unit->GetName());
    }
    return true;
}
