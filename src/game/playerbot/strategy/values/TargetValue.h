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
        void CheckAttackers(Player* bot, Player* player);
        Unit* GetResult() { return result; }

    protected:
        virtual void CheckAttacker(Player* bot, Player* player, ThreatManager* threatManager) = 0;
        void GetPlayerCount(Player* bot, Unit* creature, int* tankCount, int* dpsCount);

    protected:
        Unit* result;
        PlayerbotAI* ai;

    protected:
        map<Unit*, int> tankCountCache;
        map<Unit*, int> dpsCountCache;
        set<Unit*> alreadyChecked;
    };

    class TargetValue : public CalculatedValue<Unit*>
	{
	public:
        TargetValue(PlayerbotAI* ai) : CalculatedValue<Unit*>(ai) {}

    protected:
        Unit* FindTarget(FindTargetStrategy* strategy);
    };
}
