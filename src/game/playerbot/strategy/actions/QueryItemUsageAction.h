#pragma once

#include "../Action.h"

namespace ai
{
    class QueryItemUsageAction : public Action {
    public:
        QueryItemUsageAction(PlayerbotAI* ai, string name = "query item usage") : Action(ai, name) {}
        virtual bool Execute(Event event);

    protected:
        void QueryItemsUsage(ItemIds items);
        bool QueryItemUsage(ItemPrototype const *item);
        void QueryItemPrice(ItemPrototype const *item);
        void QueryQuestItem(uint32 itemId, const Quest *questTemplate, const QuestStatusData *questStatus);
        void QueryQuestItem(uint32 itemId);

    private:
        ostringstream out;

    };
}
