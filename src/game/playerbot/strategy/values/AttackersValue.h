#pragma once
#include "../Value.h"
#include "TargetValue.h"
#include "NearestUnitsValue.h"

namespace ai
{
    class AttackersValue : public CalculatedValue<list<ObjectGuid> >
	{
	public:
        AttackersValue(PlayerbotAI* ai) : CalculatedValue<list<ObjectGuid> >(ai) {}
        list<ObjectGuid> Calculate();

	private:
        void AddAttackersOf(Group* group, set<Unit*>& targets);
        void AddAttackersOf(Player* player, set<Unit*>& targets);
		void RemoveNonThreating(set<Unit*>& targets);
		bool hasRealThreat(Unit* attacker);
    };
}
