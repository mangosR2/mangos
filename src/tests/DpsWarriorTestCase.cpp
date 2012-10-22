#include "pch.h"

#include "aitest.h"
#include "../game/playerbot/strategy/warrior/WarriorAiObjectContext.h"

using namespace ai;


class DpsWarriorTestCase : public EngineTestBase
{
    CPPUNIT_TEST_SUITE( DpsWarriorTestCase );
    CPPUNIT_TEST( buff );
    CPPUNIT_TEST( combatVsMelee );
    CPPUNIT_TEST( warriorMustHoldAggro );
    CPPUNIT_TEST( aoe );
    CPPUNIT_TEST( boost );
    CPPUNIT_TEST( execute );
    CPPUNIT_TEST( hamstring );
	CPPUNIT_TEST( victoryRush );
    CPPUNIT_TEST_SUITE_END();

public:
    void setUp()
    {
        EngineTestBase::setUp();
        setupEngine(new WarriorAiObjectContext(ai), "dps", NULL);

		spellUnavailable("revenge");
        addAura("battle shout");
        set<uint8>("rage", "self target", 20);
    }

protected:
    void buff()
    {
        removeAura("battle shout");

        tickInSpellRange(); // reach melee
		tickInMeleeRange();
        tick();

		assertActions(">S:battle shout>S:battle stance>T:charge");

    }

    void aoe()
    {
        tickInMeleeRange();

		tickWithAttackerCount(3);
		tickWithAttackerCount(3);
		tickWithAttackerCount(3);

		assertActions(">S:battle stance>T:cleave>T:thunder clap>T:demoralizing shout");
    }

    void warriorMustHoldAggro()
    {
        tickInMeleeRange(); // melee

		tickWithNoAggro();

		assertActions(">S:battle stance>T:mocking blow");
    }

    void combatVsMelee()
    {
		tickInSpellRange();
		tickInSpellRange();

		tickInMeleeRange();

		tickInSpellRange();

		tickInMeleeRange();

        tick();
        addTargetAura("rend");

        tick();

        set<uint8>("rage", "self target", 0);
        tick();

		assertActions(">S:battle stance>T:charge>T:bloodthirst>T:reach melee>T:rend>T:heroic strike>T:melee>S:bloodrage");
    }

    void boost()
    {
        tickInMeleeRange(); // battle stance

		tickWithBalancePercent(1);
		tickWithBalancePercent(1);

		assertActions(">S:battle stance>S:death wish>S:berserker rage");
    }

    void execute()
    {
        tickInMeleeRange(); // battle stance

		tickWithTargetLowHealth(19);

		assertActions(">S:battle stance>T:execute");
    }


    void hamstring ()
    {
		tickInMeleeRange(); // reach melee

		tickWithTargetIsMoving();

		assertActions(">S:battle stance>T:hamstring");
    }


	void victoryRush()
	{
		tickInMeleeRange();
		addAura("victory rush");

		tick();

		assertActions(">S:battle stance>T:victory rush");
	}

};

CPPUNIT_TEST_SUITE_REGISTRATION( DpsWarriorTestCase );
