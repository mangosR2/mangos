#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "SuggestWhatToDoAction.h"
#include "../../../ahbot/AhBot.h"

using namespace ai;

SuggestWhatToDoAction::SuggestWhatToDoAction(PlayerbotAI* ai) : InventoryAction(ai, "suggest what to do"), suggested(false)
{
    suggestions.push_back(&SuggestWhatToDoAction::instance);
    suggestions.push_back(&SuggestWhatToDoAction::specificQuest);
    suggestions.push_back(&SuggestWhatToDoAction::newQuest);
    suggestions.push_back(&SuggestWhatToDoAction::grindMaterials);
    suggestions.push_back(&SuggestWhatToDoAction::trade);
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
        ai->TellMaster("I would like to do an instance. Would you like to join me?", PLAYERBOT_SECURITY_INVITE);
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
    ai->TellMaster(out, PLAYERBOT_SECURITY_INVITE);
}

void SuggestWhatToDoAction::newQuest()
{
    vector<uint32> quests = GetIncompletedQuests();
    if (quests.size() < MAX_QUEST_LOG_SIZE - 5)
        ai->TellMaster("I would like to pick up and do a new quest. Would you like to join me?", PLAYERBOT_SECURITY_INVITE);
}

void SuggestWhatToDoAction::grindMaterials()
{
    if (bot->getLevel() > 5)
        ai->TellMaster("I think we should grind some materials for our group tradeskill", PLAYERBOT_SECURITY_TALK);
}

void SuggestWhatToDoAction::grindReputation()
{
    if (bot->getLevel() > 50)
        ai->TellMaster("I think we should do something to improve our reputation", PLAYERBOT_SECURITY_TALK);
}

void SuggestWhatToDoAction::nothing()
{
    ai->TellMaster("I don't want to do anything", PLAYERBOT_SECURITY_TALK);
}

void SuggestWhatToDoAction::relax()
{
    ai->TellMaster("It is so boring... We could relax a bit", PLAYERBOT_SECURITY_TALK);
}

void SuggestWhatToDoAction::achievement()
{
    if (bot->getLevel() > 15)
        ai->TellMaster("I would like to do some achievement. Would you like to join me?", PLAYERBOT_SECURITY_INVITE);
}

class FindTradeItemsVisitor : public IterateItemsVisitor
{
public:
    FindTradeItemsVisitor() : IterateItemsVisitor() {}

    virtual bool Visit(Item* item)
    {
        if (item->GetProto()->Class == ITEM_CLASS_TRADE_GOODS && item->GetProto()->Bonding == NO_BIND)
            items.push_back(item);

        return true;
    }

    vector<Item*> items;
};


void SuggestWhatToDoAction::trade()
{
    if (!master->GetRandomPlayerbotMgr()->IsRandomBot(bot))
        return;

    FindTradeItemsVisitor visitor;
    IterateItems(&visitor);
    if (visitor.items.empty())
        return;

    int index = urand(0, visitor.items.size() - 1);
    Item* item = visitor.items[index];
    if (!item)
        return;

    uint32 price = auctionbot.GetSellPrice(item->GetProto());
    if (!price)
        return;

    ostringstream out; out << "Selling " << chat->formatItem(item->GetProto(), item->GetCount()) << " for " << chat->formatMoney(price);
    ai->TellMaster(out, PLAYERBOT_SECURITY_INVITE);
}
