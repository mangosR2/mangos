#pragma once
#include "PassTroughStrategy.h"
#include "../generic/NonCombatStrategy.h"

namespace ai
{
    class StayLineStrategy : public NonCombatStrategy
    {
    public:
        StayLineStrategy(PlayerbotAI* ai) : NonCombatStrategy(ai) {}
        virtual string getName() { return "stay line"; }
        virtual NextAction** getDefaultActions();
    };
}
