#pragma once

#include "../actions/GenericActions.h"

namespace ai
{
    class CastLesserHealingWaveAction : public CastHealingSpellAction {
    public:
        CastLesserHealingWaveAction(PlayerbotAI* ai) : CastHealingSpellAction(ai, "lesser healing wave") {}
    };

    class CastLesserHealingWaveOnPartyAction : public HealPartyMemberAction
    {
    public:
        CastLesserHealingWaveOnPartyAction(PlayerbotAI* ai) : HealPartyMemberAction(ai, "lesser healing wave") {}
    };


    class CastHealingWaveAction : public CastHealingSpellAction {
    public:
        CastHealingWaveAction(PlayerbotAI* ai) : CastHealingSpellAction(ai, "healing wave") {}
    };

    class CastHealingWaveOnPartyAction : public HealPartyMemberAction
    {
    public:
        CastHealingWaveOnPartyAction(PlayerbotAI* ai) : HealPartyMemberAction(ai, "healing wave") {}
    };

    class CastChainHealAction : public CastAoeHealSpellAction {
    public:
        CastChainHealAction(PlayerbotAI* ai) : CastAoeHealSpellAction(ai, "chain heal") {}
    };

    class CastRiptideAction : public CastHealingSpellAction {
    public:
        CastRiptideAction(PlayerbotAI* ai) : CastHealingSpellAction(ai, "riptide") {}
    };

    class CastRiptideOnPartyAction : public HealPartyMemberAction
    {
    public:
        CastRiptideOnPartyAction(PlayerbotAI* ai) : HealPartyMemberAction(ai, "riptide") {}
    };


    class CastEarthShieldAction : public CastBuffSpellAction {
    public:
        CastEarthShieldAction(PlayerbotAI* ai) : CastBuffSpellAction(ai, "earth shield") {}
    };

    class CastEarthShieldOnPartyAction : public BuffOnPartyAction
    {
    public:
        CastEarthShieldOnPartyAction(PlayerbotAI* ai) : BuffOnPartyAction(ai, "earth shield") {}
    };

    class CastWaterShieldAction : public CastBuffSpellAction {
    public:
        CastWaterShieldAction(PlayerbotAI* ai) : CastBuffSpellAction(ai, "water shield") {}
    };

	class CastLightningShieldAction : public CastBuffSpellAction {
	public:
		CastLightningShieldAction(PlayerbotAI* ai) : CastBuffSpellAction(ai, "lightning shield") {}
	};

    class CastEarthlivingWeaponAction : public CastEnchantItemAction {
    public:
        CastEarthlivingWeaponAction(PlayerbotAI* ai) : CastEnchantItemAction(ai, "earthliving weapon") {}
    };

    class CastRockbiterWeaponAction : public CastEnchantItemAction {
    public:
        CastRockbiterWeaponAction(PlayerbotAI* ai) : CastEnchantItemAction(ai, "rockbiter weapon") {}
    };

    class CastFlametongueWeaponAction : public CastEnchantItemAction {
    public:
        CastFlametongueWeaponAction(PlayerbotAI* ai) : CastEnchantItemAction(ai, "flametongue weapon") {}
    };

    class CastFrostbrandWeaponAction : public CastEnchantItemAction {
    public:
        CastFrostbrandWeaponAction(PlayerbotAI* ai) : CastEnchantItemAction(ai, "frostbrand weapon") {}
    };

    class CastWindfuryWeaponAction : public CastEnchantItemAction {
    public:
        CastWindfuryWeaponAction(PlayerbotAI* ai) : CastEnchantItemAction(ai, "windfury weapon") {}
    };

    class CastStoneskinTotemAction : public CastBuffSpellAction {
    public:
        CastStoneskinTotemAction(PlayerbotAI* ai) : CastBuffSpellAction(ai, "stoneskin totem") {}
    };

    class CastEarthbindTotemAction : public CastBuffSpellAction {
    public:
        CastEarthbindTotemAction(PlayerbotAI* ai) : CastBuffSpellAction(ai, "earthbind totem") {}
    };

    class CastStrengthOfEarthTotemAction : public CastBuffSpellAction {
    public:
        CastStrengthOfEarthTotemAction(PlayerbotAI* ai) : CastBuffSpellAction(ai, "strength of earth totem") {}
    };

    class CastManaSpringTotemAction : public CastBuffSpellAction {
    public:
        CastManaSpringTotemAction(PlayerbotAI* ai) : CastBuffSpellAction(ai, "mana spring totem") {}
    };

	class CastManaTideTotemAction : public CastSpellAction {
	public:
		CastManaTideTotemAction(PlayerbotAI* ai) : CastSpellAction(ai, "mana tide totem") {}
		virtual string GetTargetName() { return "self target"; }
	};

	class CastHealingStreamTotemAction : public CastBuffSpellAction {
	public:
		CastHealingStreamTotemAction(PlayerbotAI* ai) : CastBuffSpellAction(ai, "healing stream totem") {}
	};

    class CastCleansingTotemAction : public CastBuffSpellAction {
    public:
        CastCleansingTotemAction(PlayerbotAI* ai) : CastBuffSpellAction(ai, "cleansing totem") {}
    };

    class CastFlametongueTotemAction : public CastBuffSpellAction {
    public:
        CastFlametongueTotemAction(PlayerbotAI* ai) : CastBuffSpellAction(ai, "flametongue totem") {}
    };

    class CastWindfuryTotemAction : public CastBuffSpellAction {
    public:
        CastWindfuryTotemAction(PlayerbotAI* ai) : CastBuffSpellAction(ai, "windfury totem") {}
    };

    class CastSearingTotemAction : public CastSpellAction {
    public:
        CastSearingTotemAction(PlayerbotAI* ai) : CastSpellAction(ai, "searing totem") {}
        virtual string GetTargetName() { return "self target"; }
    };

    class CastMagmaTotemAction : public CastMeleeSpellAction {
    public:
        CastMagmaTotemAction(PlayerbotAI* ai) : CastMeleeSpellAction(ai, "magma totem") {}
        virtual string GetTargetName() { return "self target"; }
    };

    class CastFireNovaAction : public CastSpellAction {
    public:
        CastFireNovaAction(PlayerbotAI* ai) : CastSpellAction(ai, "fire nova") {}
    };

    class CastWindShearAction : public CastSpellAction {
    public:
        CastWindShearAction(PlayerbotAI* ai) : CastSpellAction(ai, "wind shear") {}
    };

	class CastAncestralSpiritAction : public ResurrectPartyMemberAction
	{
	public:
		CastAncestralSpiritAction(PlayerbotAI* ai) : ResurrectPartyMemberAction(ai, "ancestral spirit") {}
	};


	class CastPurgeAction : public CastSpellAction
	{
	public:
		CastPurgeAction(PlayerbotAI* ai) : CastSpellAction(ai, "purge") {}
	};

	class CastStormstrikeAction : public CastMeleeSpellAction {
	public:
		CastStormstrikeAction(PlayerbotAI* ai) : CastMeleeSpellAction(ai, "stormstrike") {}
	};

	class CastLavaLashAction : public CastMeleeSpellAction {
	public:
		CastLavaLashAction(PlayerbotAI* ai) : CastMeleeSpellAction(ai, "lava lash") {}
	};

    class CastWaterBreathingAction : public CastBuffSpellAction {
    public:
        CastWaterBreathingAction(PlayerbotAI* ai) : CastBuffSpellAction(ai, "water breathing") {}
    };

    class CastWaterWalkingAction : public CastBuffSpellAction {
    public:
        CastWaterWalkingAction(PlayerbotAI* ai) : CastBuffSpellAction(ai, "water walking") {}
    };

    class CastWaterBreathingOnPartyAction : public BuffOnPartyAction {
    public:
        CastWaterBreathingOnPartyAction(PlayerbotAI* ai) : BuffOnPartyAction(ai, "water breathing") {}
    };

    class CastWaterWalkingOnPartyAction : public BuffOnPartyAction {
    public:
        CastWaterWalkingOnPartyAction(PlayerbotAI* ai) : BuffOnPartyAction(ai, "water walking") {}
    };


    class CastCleanseSpiritAction : public CastCureSpellAction {
    public:
        CastCleanseSpiritAction(PlayerbotAI* ai) : CastCureSpellAction(ai, "cleanse spirit") {}
    };

    class CastCleanseSpiritPoisonOnPartyAction : public CurePartyMemberAction
    {
    public:
        CastCleanseSpiritPoisonOnPartyAction(PlayerbotAI* ai) : CurePartyMemberAction(ai, "cleanse spirit", DISPEL_POISON) {}

        virtual string getName() { return "cleanse spirit poison on party"; }
    };
    class CastCleanseSpiritCurseOnPartyAction : public CurePartyMemberAction
    {
    public:
        CastCleanseSpiritCurseOnPartyAction(PlayerbotAI* ai) : CurePartyMemberAction(ai, "cleanse spirit", DISPEL_CURSE) {}

        virtual string getName() { return "cleanse spirit curse on party"; }
    };
    class CastCleanseSpiritDiseaseOnPartyAction : public CurePartyMemberAction
    {
    public:
        CastCleanseSpiritDiseaseOnPartyAction(PlayerbotAI* ai) : CurePartyMemberAction(ai, "cleanse spirit", DISPEL_DISEASE) {}

        virtual string getName() { return "cleanse spirit disease on party"; }
    };

    class CastFlameShockAction : public CastDebuffSpellAction
    {
    public:
        CastFlameShockAction(PlayerbotAI* ai) : CastDebuffSpellAction(ai, "flame shock") {}
    };

    class CastEarthShockAction : public CastDebuffSpellAction
    {
    public:
        CastEarthShockAction(PlayerbotAI* ai) : CastDebuffSpellAction(ai, "earth shock") {}
    };

    class CastFrostShockAction : public CastDebuffSpellAction
    {
    public:
        CastFrostShockAction(PlayerbotAI* ai) : CastDebuffSpellAction(ai, "frost shock") {}
    };

    class CastChainLightningAction : public CastSpellAction
    {
    public:
        CastChainLightningAction(PlayerbotAI* ai) : CastSpellAction(ai, "chain lightning") {}
    };

    class CastLightningBoltAction : public CastSpellAction
    {
    public:
        CastLightningBoltAction(PlayerbotAI* ai) : CastSpellAction(ai, "lightning bolt") {}
    };

    class CastThunderstormAction : public CastMeleeSpellAction
    {
    public:
        CastThunderstormAction(PlayerbotAI* ai) : CastMeleeSpellAction(ai, "thunderstorm") {}
    };

    class CastHeroismAction : public CastBuffSpellAction
    {
    public:
        CastHeroismAction(PlayerbotAI* ai) : CastBuffSpellAction(ai, "heroism") {}
    };

    class CastBloodlustAction : public CastBuffSpellAction
    {
    public:
        CastBloodlustAction(PlayerbotAI* ai) : CastBuffSpellAction(ai, "bloodlust") {}
    };
}
