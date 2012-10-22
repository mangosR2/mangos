#pragma once

#include "../Action.h"

namespace ai
{
    class UseMeetingStoneAction : public Action
    {
    public:
        UseMeetingStoneAction(PlayerbotAI* ai) : Action(ai, "use meeting stone") {}

        virtual bool Execute(Event event);
    };

    class SummonAction : public Action
    {
    public:
        SummonAction(PlayerbotAI* ai) : Action(ai, "summon") {}

        virtual bool Execute(Event event);
    };

}
