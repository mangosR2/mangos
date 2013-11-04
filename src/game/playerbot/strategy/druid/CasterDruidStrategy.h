#pragma once

#include "GenericDruidStrategy.h"
#include "../generic/CombatStrategy.h"

namespace ai
{
    class CasterDruidStrategy : public GenericDruidStrategy
    {
    public:
        CasterDruidStrategy(PlayerbotAI* ai);

    public:
        virtual void InitTriggers(std::list<TriggerNode*> &triggers);
        virtual string getName() { return "caster"; }
        virtual NextAction** getDefaultActions();
    };

    class CasterDruidAoeStrategy : public CombatStrategy
    {
    public:
        CasterDruidAoeStrategy(PlayerbotAI* ai) : CombatStrategy(ai) {}

    public:
        virtual void InitTriggers(std::list<TriggerNode*> &triggers);
        virtual string getName() { return "caster aoe"; }
    };

    class CasterDruidDebuffStrategy : public CombatStrategy
    {
    public:
        CasterDruidDebuffStrategy(PlayerbotAI* ai) : CombatStrategy(ai) {}

    public:
        virtual void InitTriggers(std::list<TriggerNode*> &triggers);
        virtual string getName() { return "caster debuff"; }
    };
}
