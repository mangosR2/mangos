#pragma once
#include "../Value.h"

namespace ai
{
    class IsBehindValue : public CalculatedValue<bool>, public Qualified
	{
	public:
        IsBehindValue(PlayerbotAI* ai) : CalculatedValue<bool>(ai) {}

        virtual bool Calculate() 
        {
            Unit* target = AI_VALUE(Unit*, qualifier);
            if (!target)
                return false;

            
            float targetOrientation = target->GetOrientation();
            float orientation = bot->GetOrientation();
            float distance = bot->GetDistance(target);

            return distance <= ATTACK_DISTANCE && abs(targetOrientation - orientation) < M_PI / 2;
        }
    };
}
