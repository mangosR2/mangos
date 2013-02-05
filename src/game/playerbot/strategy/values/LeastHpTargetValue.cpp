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
    virtual void CheckAttacker(Player* player, Unit* attacker, ThreatManager* threatManager)
    {
        if (!result || result->GetHealth() > attacker->GetHealth())
            result = attacker;
    }

protected:
    float minHealth;
};


Unit* LeastHpTargetValue::Calculate()
{
    FindLeastHpTargetStrategy strategy(ai);
    return FindTarget(&strategy);
}
