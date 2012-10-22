#pragma once
#include "../Value.h"
#include "../../LootObjectStack.h"

namespace ai
{
   
    class AvailableLootValue : public ManualSetValue<LootObjectStack*>
	{
	public:
        AvailableLootValue(PlayerbotAI* ai) : ManualSetValue<LootObjectStack*>(ai, NULL) 
        {
            value = new LootObjectStack(ai->GetBot());
        }

        virtual ~AvailableLootValue()
        {
            if (value) 
                delete value;
        }
    };

    class LootTargetValue : public ManualSetValue<LootObject>
    {
    public:
        LootTargetValue(PlayerbotAI* ai) : ManualSetValue<LootObject>(ai, LootObject()) {}
    };

    class CanLootValue : public CalculatedValue<bool>
    {
    public:
        CanLootValue(PlayerbotAI* ai) : CalculatedValue<bool>(ai) {}

        virtual bool Calculate()
        {
            LootObject loot = AI_VALUE(LootObject, "loot target");
            return !loot.IsEmpty() && loot.GetWorldObject(bot) && AI_VALUE2(float, "distance", "loot target") <= INTERACTION_DISTANCE;
        }
    };
}
