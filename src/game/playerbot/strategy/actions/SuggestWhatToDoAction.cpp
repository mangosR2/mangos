#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "SuggestWhatToDoAction.h"

using namespace ai;

SuggestWhatToDoAction::SuggestWhatToDoAction(PlayerbotAI* ai) : Action(ai, "suggest what to do"), suggested(false)
{
    suggestions.push_back(&SuggestWhatToDoAction::instance);
    suggestions.push_back(&SuggestWhatToDoAction::specificQuest);
    suggestions.push_back(&SuggestWhatToDoAction::newQuest);
    suggestions.push_back(&SuggestWhatToDoAction::grindMaterials);
    suggestions.push_back(&SuggestWhatToDoAction::grindReputation);
    suggestions.push_back(&SuggestWhatToDoAction::nothing);
    suggestions.push_back(&SuggestWhatToDoAction::relax);
    suggestions.push_back(&SuggestWhatToDoAction::achievement);
}

bool SuggestWhatToDoAction::Execute(Event event)
{
    if (bot->GetInstanceId() || suggested)
        return false;

    int index = rand() % suggestions.size();
    (this->*suggestions[index])();

    return suggested = true;
}

void SuggestWhatToDoAction::instance()
{
    if (bot->getLevel() > 15)
        ai->TellMaster("I would like to do an instance");
}

vector<uint32> SuggestWhatToDoAction::GetIncompletedQuests()
{
    vector<uint32> result;

    for (uint16 slot = 0; slot < MAX_QUEST_LOG_SIZE; ++slot)
    {
        uint32 questId = bot->GetQuestSlotQuestId(slot);
        if (!questId)
            continue;

        QuestStatus status = bot->GetQuestStatus(questId);
        if (status == QUEST_STATUS_INCOMPLETE || status == QUEST_STATUS_NONE)
            result.push_back(questId);
    }

    return result;
}

void SuggestWhatToDoAction::specificQuest()
{
    vector<uint32> quests = GetIncompletedQuests();
    if (quests.empty())
        return;

    int index = rand() % quests.size();

    Quest const* quest = sObjectMgr.GetQuestTemplate(quests[index]);
    ostringstream out; out << "We could do some quest, for instance " << chat->formatQuest(quest);
    ai->TellMaster(out);
}

void SuggestWhatToDoAction::newQuest()
{
    vector<uint32> quests = GetIncompletedQuests();
    if (quests.size() < MAX_QUEST_LOG_SIZE - 5)
        ai->TellMaster("I would like to pick up and do a new quest");
}

void SuggestWhatToDoAction::grindMaterials()
{
    if (bot->getLevel() > 5)
        ai->TellMaster("I think we could grind some materials for our group tradeskill");
}

void SuggestWhatToDoAction::grindReputation()
{
    if (bot->getLevel() > 50)
        ai->TellMaster("I think we should do something to improve our reputation with several factions");
}

void SuggestWhatToDoAction::nothing()
{
    ai->TellMaster("I don't want to do anything. Can I log off?");
}

void SuggestWhatToDoAction::relax()
{
    ai->TellMaster("It is so boring... We could have some relaxing...");
}

void SuggestWhatToDoAction::achievement()
{
    if (bot->getLevel() > 15)
        ai->TellMaster("I would like to do some achievement");
}
