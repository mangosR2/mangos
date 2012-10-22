#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "DropQuestAction.h"


using namespace ai;

bool DropQuestAction::Execute(Event event)
{
    
    
    string link = event.getParam();
    
    ObjectGuid oldSelection = master->GetSelectionGuid();
    master->SetSelectionGuid(bot->GetObjectGuid());

    PlayerbotChatHandler ch(bot);
    if (!ch.dropQuest(link))
    {
        ostringstream out; out << "Could not drop quest: " << link;
        ai->TellMaster(out);
        return false;
    }

    master->SetSelectionGuid(oldSelection);
    ai->TellMaster("Quest removed");
    return true;
}
