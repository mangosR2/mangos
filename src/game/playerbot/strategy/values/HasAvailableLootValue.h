#pragma once
#include "../Value.h"
#include "../../PlayerbotAIConfig.h"

namespace ai
{
    class HasAvailableLootValue : public CalculatedValue<bool>
	{
	public:
        HasAvailableLootValue(PlayerbotAI* ai) : CalculatedValue<bool>(ai) {}

    public:
        virtual bool Calculate()
        {
            return !AI_VALUE(bool, "can loot") &&
                    AI_VALUE(LootObjectStack*, "available loot")->CanLoot(sPlayerbotAIConfig.lootDistance) &&
                    !bot->IsMounted();
        }
    };
}
