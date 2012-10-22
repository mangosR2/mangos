#pragma once
#include "../Value.h"

namespace ai
{
    class PetTargetValue : public CalculatedValue<Unit*>
	{
	public:
        PetTargetValue(PlayerbotAI* ai) : CalculatedValue<Unit*>(ai) {}

        virtual Unit* Calculate() { return ai->GetBot()->GetPet(); }
    };
}
