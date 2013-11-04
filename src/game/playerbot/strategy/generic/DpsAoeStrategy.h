#include "../generic/NonCombatStrategy.h"
#pragma once

namespace ai
{
    class DpsAoeStrategy : public NonCombatStrategy
    {
    public:
        DpsAoeStrategy(PlayerbotAI* ai) : NonCombatStrategy(ai) {}
        virtual string getName() { return "dps aoe"; }
        virtual StrategyType GetType() { return STRATEGY_TYPE_DPS; }

    public:
        virtual void InitTriggers(std::list<TriggerNode*> &triggers);
    };


}
