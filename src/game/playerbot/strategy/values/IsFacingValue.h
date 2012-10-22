#pragma once
#include "../Value.h"

namespace ai
{
    class IsFacingValue : public CalculatedValue<bool>, public Qualified
	{
	public:
        IsFacingValue(PlayerbotAI* ai) : CalculatedValue<bool>(ai) {}

        virtual bool Calculate() 
        {
            Unit* target = AI_VALUE(Unit*, qualifier);
            if (!target)
                return false;

            return bot->isInFront(target, sPlayerbotAIConfig.reactDistance);
        }
    };
}
