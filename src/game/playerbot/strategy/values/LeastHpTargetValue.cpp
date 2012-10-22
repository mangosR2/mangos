#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "LeastHpTargetValue.h"
#include "TargetValue.h"

using namespace ai;
using namespace std;

class FindLeastHpTargetStrategy : public FindTargetStrategy
{
public:
    FindLeastHpTargetStrategy(PlayerbotAI* ai) : FindTargetStrategy(ai)
    {
        minHealth = 0;
    }

protected:
    virtual void CheckAttacker(Player* bot, Player* player, ThreatManager* threatManager)
    {
        Unit* creature = threatManager->getOwner();
        if (!creature)
            return;

        if (!result || result->GetHealth() > creature->GetHealth())
            result = creature;
    }

protected:
    float minHealth;
};


Unit* LeastHpTargetValue::Calculate()
{
    FindLeastHpTargetStrategy strategy(ai);
    return FindTarget(&strategy);
}
