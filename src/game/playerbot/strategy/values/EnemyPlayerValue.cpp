#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "EnemyPlayerValue.h"
#include "TargetValue.h"

using namespace ai;
using namespace std;

class FindEnemyPlayerStrategy : public FindTargetStrategy
{
public:
    FindEnemyPlayerStrategy(PlayerbotAI* ai) : FindTargetStrategy(ai)
    {
    }

protected:
    virtual void CheckAttacker(Player* player, Unit* attacker, ThreatManager* threatManager)
    {
        if (!result || attacker->GetObjectGuid().IsPlayer())
        {
            Player* player = dynamic_cast<Player*>(attacker);
            if (player && ai->IsOpposing(player))
                result = attacker;
        }
    }

};


Unit* EnemyPlayerValue::Calculate()
{
    FindEnemyPlayerStrategy strategy(ai);
    return FindTarget(&strategy);
}
