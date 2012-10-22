#pragma once

#include "../Action.h"

namespace ai
{
    class SetHomeAction : public Action {
    public:
        SetHomeAction(PlayerbotAI* ai) : Action(ai, "home") {}
        virtual bool Execute(Event event);
    };
}