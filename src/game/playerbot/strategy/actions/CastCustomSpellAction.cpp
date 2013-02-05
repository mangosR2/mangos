#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "CastCustomSpellAction.h"

using namespace ai;

bool CastCustomSpellAction::Execute(Event event)
{
    Unit* target = NULL;

    Player* master = GetMaster();
    if (master && master->GetSelectionGuid())
        target = ai->GetUnit(master->GetSelectionGuid());

    if (!target)
        target = bot;

    string text = event.getParam();

    ostringstream msg; msg << "Casting " << text << " on " << target->GetName();
    ai->TellMaster(msg);
    uint32 spell = chat->parseSpell(text);

    if (spell)
        return ai->CastSpell(spell, target);

    return ai->CastSpell(text, target);
}
