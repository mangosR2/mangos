#pragma once

namespace ai
{
    class NonCombatStrategy : public Strategy
    {
    public:
        NonCombatStrategy(PlayerbotAI* ai) : Strategy(ai) {}
		virtual StrategyType GetType() { return STRATEGY_TYPE_NONCOMBAT; }
    };
}
