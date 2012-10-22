#pragma once
#include "../Value.h"

namespace ai
{
    class LineTargetValue : public CalculatedValue<Unit*>
	{
	public:
        LineTargetValue(PlayerbotAI* ai) : CalculatedValue<Unit*>(ai) {}

    public:
        virtual Unit* Calculate();
	};
}
