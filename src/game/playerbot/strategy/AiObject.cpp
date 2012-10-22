#include "../../pchdef.h"
#include "../playerbot.h"
#include "AiObject.h"

AiObject::AiObject(PlayerbotAI* ai) : 
    PlayerbotAIAware(ai), 
    bot(ai->GetBot()), 
    master(ai->GetMaster()), 
    context(ai->GetAiObjectContext()),
    chat(ai->GetChatHelper())
{
}


