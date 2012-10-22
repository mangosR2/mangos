#pragma once

#include "../Action.h"

namespace ai
{
    class TellTargetAction : public Action {
    public:
        TellTargetAction(PlayerbotAI* ai) : Action(ai, "tell target") {}
        virtual bool Execute(Event event);

    private:

    };

}
