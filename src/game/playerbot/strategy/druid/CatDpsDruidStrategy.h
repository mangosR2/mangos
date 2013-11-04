#pragma once

#include "FeralDruidStrategy.h"
#include "../generic/CombatStrategy.h"

namespace ai
{
    class CatDpsDruidStrategy : public FeralDruidStrategy
    {
    public:
        CatDpsDruidStrategy(PlayerbotAI* ai);

    public:
        virtual void InitTriggers(std::list<TriggerNode*> &triggers);
        virtual string getName() { return "cat"; }
        virtual NextAction** getDefaultActions();
    };

    class CatAoeDruidStrategy : public CombatStrategy
    {
    public:
        CatAoeDruidStrategy(PlayerbotAI* ai) : CombatStrategy(ai) {}

    public:
        virtual void InitTriggers(std::list<TriggerNode*> &triggers);
        virtual string getName() { return "cat aoe"; }
    };
}
