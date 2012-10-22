#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "ChangeStrategyAction.h"

using namespace ai;

bool ChangeCombatStrategyAction::Execute(Event event)
{
    string text = event.getParam();
    ai->ChangeStrategy(text.empty() ? getName() : text, BOT_STATE_COMBAT);
    return true;
}

bool ChangeNonCombatStrategyAction::Execute(Event event)
{
    string text = event.getParam();
    ai->ChangeStrategy(text, BOT_STATE_NON_COMBAT);
    return true;
}

bool ChangeDeadStrategyAction::Execute(Event event)
{
    string text = event.getParam();
    ai->ChangeStrategy(text, BOT_STATE_DEAD);
    return true;
}
