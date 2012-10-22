#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "LootTriggers.h"

using namespace ai;

bool LootAvailableTrigger::IsActive()
{
    return AI_VALUE(bool, "has available loot");
}

bool FarFromCurrentLootTrigger::IsActive()
{
    return AI_VALUE2(float, "distance", "loot target") > INTERACTION_DISTANCE;
}

bool CanLootTrigger::IsActive()
{
    return AI_VALUE(bool, "can loot");
}
