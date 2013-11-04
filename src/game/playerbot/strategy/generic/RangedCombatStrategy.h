#include "CombatStrategy.h"
#pragma once

namespace ai
{
    class RangedCombatStrategy : public CombatStrategy
    {
    public:
        RangedCombatStrategy(PlayerbotAI* ai) : CombatStrategy(ai) {}
        virtual void InitTriggers(std::list<TriggerNode*> &triggers);
    };


}
