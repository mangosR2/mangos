#pragma once
#include "../Value.h"

namespace ai
{
    class MasterTargetValue : public CalculatedValue<Unit*>
	{
	public:
        MasterTargetValue(PlayerbotAI* ai) : CalculatedValue<Unit*>(ai) {}

        virtual Unit* Calculate() { return ai->GetMaster(); }
    };
}
