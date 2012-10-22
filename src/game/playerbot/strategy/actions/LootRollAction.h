#pragma once

#include "../Action.h"

namespace ai
{
    class LootRollAction : public Action {
    public:
        LootRollAction(PlayerbotAI* ai) : Action(ai, "loot roll") {}
        virtual bool Execute(Event event);

   
    };

}