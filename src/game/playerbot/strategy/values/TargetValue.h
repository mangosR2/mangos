#pragma once
#include "../Value.h"

namespace ai
{
    class FindTargetStrategy
    {
    public:
        FindTargetStrategy(PlayerbotAI* ai)
        {
            result = NULL;
            this->ai = ai;
        }

    public:
        void CheckAttackers(Player* player);
        Unit* GetResult() { return result; }

    protected:
        virtual void CheckAttacker(Player* player, Unit* attacker, ThreatManager* threatManager) = 0;
        void GetPlayerCount(Unit* creature, int* tankCount, int* dpsCount);

    protected:
        Unit* result;
        PlayerbotAI* ai;

    protected:
        map<Unit*, int> tankCountCache;
        map<Unit*, int> dpsCountCache;
        set<Unit*> alreadyChecked;
    };

    class TargetValue : public UnitCalculatedValue
	{
	public:
        TargetValue(PlayerbotAI* ai) : UnitCalculatedValue(ai) {}

    protected:
        Unit* FindTarget(FindTargetStrategy* strategy);
    };
}
