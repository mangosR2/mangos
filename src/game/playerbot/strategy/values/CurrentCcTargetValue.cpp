#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "CurrentCcTargetValue.h"

using namespace ai;

class FindCurrentCcTargetStrategy : public FindTargetStrategy
{
public:
    FindCurrentCcTargetStrategy(PlayerbotAI* ai, string spell) : FindTargetStrategy(ai)
    {
        this->spell = spell;
    }

protected:
    virtual void CheckAttacker(Player* bot, Player* player, ThreatManager* threatManager)
    {
        float threat = threatManager->getThreat(bot);
        Unit* creature = threatManager->getOwner();
        if (ai->HasAura(spell, creature))
            result = creature;
    }

private:
    string spell;
};


Unit* CurrentCcTargetValue::Calculate()
{
    FindCurrentCcTargetStrategy strategy(ai, qualifier);
    return FindTarget(&strategy);
}