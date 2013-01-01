#pragma once

#include "../Action.h"
#include "MovementActions.h"

namespace ai
{
	class AttackAction : public MovementAction
	{
	public:
		AttackAction(PlayerbotAI* ai, string name) : MovementAction(ai, name) {}

    public:
        virtual bool Execute(Event event);
        virtual bool isPossible()
        {
            return GetTarget() &&
                    AI_VALUE2(uint8, "health", "self target") > sPlayerbotAIConfig.lowHealth &&
                    AI_VALUE2(uint8, "mana", "self target") > sPlayerbotAIConfig.lowMana;
        }

    protected:
        bool Attack(Unit* target);
    };

    class AttackMyTargetAction : public AttackAction
    {
    public:
        AttackMyTargetAction(PlayerbotAI* ai, string name = "attack my target") : AttackAction(ai, name) {}

    public:
        virtual bool Execute(Event event);
    };

    class AttackDuelOpponentAction : public AttackAction
    {
    public:
        AttackDuelOpponentAction(PlayerbotAI* ai, string name = "attack duel opponent") : AttackAction(ai, name) {}

    public:
        virtual bool Execute(Event event);
        virtual bool isUseful();
    };
}
