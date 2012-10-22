#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "ThreatStrategy.h"
#include "../../PlayerbotAIConfig.h"
#include "../actions/GenericSpellActions.h"

using namespace ai;

float ThreatMultiplier::GetValue(Action* action)
{
    if (action == NULL || action->getThreatType() == ACTION_THREAT_NONE)
        return 1.0f;

    uint8 threat = AI_VALUE(uint8, "threat");

    if (threat >= 90)
        return 0.0f;

    if (threat >= 75 && action->getThreatType() == ACTION_THREAT_AOE)
        return 0.0f;

    return 1.0f;
}

void ThreatStrategy::InitMultipliers(std::list<Multiplier*> &multipliers)
{
    multipliers.push_back(new ThreatMultiplier(ai));
}
