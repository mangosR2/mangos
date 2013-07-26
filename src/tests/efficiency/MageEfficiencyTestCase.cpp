#include "pch.h"

#include "../aitest.h"
#include "../../game/playerbot/strategy/mage/MageAiObjectContext.h"
#include "EfficiencyActionExecutionListener.h"

using namespace ai;


class MageEfficiencyTestCase : public EngineTestBase
{
  CPPUNIT_TEST_SUITE( MageEfficiencyTestCase );
  CPPUNIT_TEST( lvl19_frost );
  CPPUNIT_TEST( lvl19_fire );
  CPPUNIT_TEST( lvl19_arcane );
  CPPUNIT_TEST_SUITE_END();

public:
    void setUp()
    {
		EngineTestBase::setUp();
    }

protected:
    map<string, SpellInfo> lvl19()
    {
        map<string, SpellInfo> spellInfo;
        spellInfo["frostbolt"] = SpellInfo(27, 2, 0, 54);
        spellInfo["frost nova"] = SpellInfo(24, 0, 25, 20);
        spellInfo["arcane explosion"] = SpellInfo(67, 0, 0, 33);
        spellInfo["arcane missiles"] = SpellInfo(106, 4, 0, 36 * 4);
        spellInfo["polymorph"] = SpellInfo(24, 1.5, 0, 0);
        spellInfo["remove curse"] = SpellInfo(27, 0, 0, 0);
        spellInfo["fire blast"] = SpellInfo(72, 0, 8, 64);
        spellInfo["fireball"] = SpellInfo(54, 3, 0, 100);
        spellInfo["flamestrike"] = SpellInfo(120, 2, 0, 60);
        return spellInfo;
    }

 	void lvl19_frost()
	{
        setupEngine(new MageAiObjectContext(ai), "frost", NULL);
        EfficiencyActionExecutionListener* listener = new EfficiencyActionExecutionListener(ai, lvl19(), 888);
        engine->AddActionExecutionListener(listener);

        while (listener->CanContinue())
 	    {
            tick();
            spellAvailable("frostbolt");
            spellAvailable("frost nova");
 	    }
        cout << "Act: " << ai->buffer << "\n";
        listener->Report();
	}

 	void lvl19_fire()
	{
        setupEngine(new MageAiObjectContext(ai), "fire", NULL);
        EfficiencyActionExecutionListener* listener = new EfficiencyActionExecutionListener(ai, lvl19(), 888);
        engine->AddActionExecutionListener(listener);

        while (listener->CanContinue())
 	    {
            tick();
            spellAvailable("fireball");
            spellAvailable("fire blast");
            spellAvailable("frost nova");
 	    }
        cout << "Act: " << ai->buffer << "\n";
        listener->Report();
	}

 	void lvl19_arcane()
	{
        setupEngine(new MageAiObjectContext(ai), "arcane", NULL);
        EfficiencyActionExecutionListener* listener = new EfficiencyActionExecutionListener(ai, lvl19(), 888);
        engine->AddActionExecutionListener(listener);

        while (listener->CanContinue())
 	    {
            tick();
            spellAvailable("arcane missiles");
            spellAvailable("arcane explosion");
            spellAvailable("frost nova");
 	    }
        cout << "Act: " << ai->buffer << "\n";
        listener->Report();
	}

};

CPPUNIT_TEST_SUITE_REGISTRATION( MageEfficiencyTestCase );
