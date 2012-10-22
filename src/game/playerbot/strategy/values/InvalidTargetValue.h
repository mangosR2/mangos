#pragma once
#include "../Value.h"

namespace ai
{
    class InvalidTargetValue : public CalculatedValue<bool>, public Qualified
	{
	public:
        InvalidTargetValue(PlayerbotAI* ai) : CalculatedValue<bool>(ai) {}

	public:
        virtual bool Calculate();
    };
}
