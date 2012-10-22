#pragma once
#include "../Value.h"

namespace ai
{
    class SelfTargetValue : public CalculatedValue<Unit*>
	{
	public:
        SelfTargetValue(PlayerbotAI* ai) : CalculatedValue<Unit*>(ai) {}

        virtual Unit* Calculate() { return ai->GetBot(); }
    };
}
