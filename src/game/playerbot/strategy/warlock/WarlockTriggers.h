#pragma once
#include "../triggers/GenericTriggers.h"

namespace ai
{
	class DemonArmorTrigger : public BuffTrigger
	{
	public:
		DemonArmorTrigger(PlayerbotAI* ai) : BuffTrigger(ai, "demon armor") {}
		virtual bool IsActive();
	};

    class SpellstoneTrigger : public BuffTrigger
    {
    public:
        SpellstoneTrigger(PlayerbotAI* ai) : BuffTrigger(ai, "spellstone") {}
        virtual bool IsActive();
    };

    DEBUFF_TRIGGER(CurseOfAgonyTrigger, "curse of agony", "curse of agony");
    DEBUFF_TRIGGER(CorruptionTrigger, "corruption", "corruption");
    DEBUFF_TRIGGER(ImmolateTrigger, "immolate", "immolate");

    class ShadowTranceTrigger : public HasAuraTrigger
    {
    public:
        ShadowTranceTrigger(PlayerbotAI* ai) : HasAuraTrigger(ai, "shadow trance") {}
    };

    class BacklashTrigger : public HasAuraTrigger
    {
    public:
        BacklashTrigger(PlayerbotAI* ai) : HasAuraTrigger(ai, "backlash") {}
    };

    class BanishTrigger : public HasCcTargetTrigger
    {
    public:
        BanishTrigger(PlayerbotAI* ai) : HasCcTargetTrigger(ai, "banish") {}
    };

    class HasSpellstoneTrigger : public ItemCountTrigger
    {
    public:
        HasSpellstoneTrigger(PlayerbotAI* ai) : ItemCountTrigger(ai, "spellstone", 1) {}
    };

    class HasFirestoneTrigger : public ItemCountTrigger
    {
    public:
        HasFirestoneTrigger(PlayerbotAI* ai) : ItemCountTrigger(ai, "firestone", 1) {}
    };

    class HasHealthstoneTrigger : public ItemCountTrigger
    {
    public:
        HasHealthstoneTrigger(PlayerbotAI* ai) : ItemCountTrigger(ai, "healthstone", 1) {}
    };

    class FearTrigger : public HasCcTargetTrigger
    {
    public:
        FearTrigger(PlayerbotAI* ai) : HasCcTargetTrigger(ai, "fear") {}
    };

}
