#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "ChatShortcutActions.h"
#include "../../PlayerbotAIConfig.h"

using namespace ai;

bool FollowChatShortcutAction::Execute(Event event)
{
    ai->Reset();
    ai->ChangeStrategy("+follow master,-passive", BOT_STATE_NON_COMBAT);
    ai->ChangeStrategy("-follow master,-passive", BOT_STATE_COMBAT);
    if (bot->GetMapId() != master->GetMapId() || bot->GetDistance(master) > sPlayerbotAIConfig.sightDistance)
    {
        ai->TellMaster("I will not follow you - too far away");
        return true;
    }
    ai->TellMaster("Following");
    return true;
}

bool StayChatShortcutAction::Execute(Event event)
{
    ai->Reset();
    ai->ChangeStrategy("+stay,-passive", BOT_STATE_NON_COMBAT);
    ai->ChangeStrategy("-follow master,-passive", BOT_STATE_COMBAT);
    ai->TellMaster("Staying");
    return true;
}

bool FleeChatShortcutAction::Execute(Event event)
{
    ai->Reset();
    ai->ChangeStrategy("+follow master,+passive", BOT_STATE_NON_COMBAT);
    ai->ChangeStrategy("+follow master,+passive", BOT_STATE_COMBAT);
    if (bot->GetMapId() != master->GetMapId() || bot->GetDistance(master) > sPlayerbotAIConfig.sightDistance)
    {
        ai->TellMaster("I will not flee with you - too far away");
        return true;
    }
    ai->TellMaster("Fleeing");
    return true;
}

bool GoawayChatShortcutAction::Execute(Event event)
{
    ai->Reset();
    ai->ChangeStrategy("+runaway", BOT_STATE_NON_COMBAT);
    ai->ChangeStrategy("+runaway", BOT_STATE_COMBAT);
    ai->TellMaster("Running away");
    return true;
}

bool GrindChatShortcutAction::Execute(Event event)
{
    ai->Reset();
    ai->ChangeStrategy("+grind,-passive", BOT_STATE_NON_COMBAT);
    ai->TellMaster("Grinding");
    return true;
}
