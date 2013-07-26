#include "pch.h"

#include "../aitest.h"
#include "../../game/playerbot/strategy/shaman/ShamanAiObjectContext.h"
#include "EfficiencyActionExecutionListener.h"

using namespace ai;


class ShamanEfficiencyTestCase : public EngineTestBase
{
  CPPUNIT_TEST_SUITE( ShamanEfficiencyTestCase );
  CPPUNIT_TEST( lvl19_melee );
  CPPUNIT_TEST( lvl19_caster );
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
        spellInfo["earth shock"] = SpellInfo(61, 0, 6, 18, "shock");
        spellInfo["flame shock"] = SpellInfo(58, 0, 6, 21, "shock");
        spellInfo["lightning bolt"] = SpellInfo(20, 1.5, 0, 14);
        spellInfo["lightning shield"] = SpellInfo(0, 0, 0, 0);
        spellInfo["searing totem"] = SpellInfo(24, 0, 30, 10 * 30 / 1.5);
        spellInfo["fire nova"] = SpellInfo(75, 0, 6, 52);
        spellInfo["melee"] = SpellInfo(0, 0, 1, 12 + 2);
        return spellInfo;
    }

    void refresh(map<string, SpellInfo> spellInfo)
    {
        for (map<string, SpellInfo>::iterator i = spellInfo.begin(); i != spellInfo.end(); ++i)
        {
            spellAvailable(i->first);
        }
    }

 	void lvl19_melee()
	{
 	    map<string, SpellInfo> spellInfo = lvl19();
        setupEngine(new ShamanAiObjectContext(ai), "melee", "melee aoe", NULL);
        EfficiencyActionExecutionListener* listener = new EfficiencyActionExecutionListener(ai, spellInfo, 600);
        engine->AddActionExecutionListener(listener);

        while (listener->CanContinue())
 	    {
            tick();
            refresh(spellInfo);
 	    }
        cout << "Act: " << ai->buffer << "\n";
        listener->Report();
	}

 	void lvl19_caster()
	{
 	    map<string, SpellInfo> spellInfo = lvl19();
        setupEngine(new ShamanAiObjectContext(ai), "caster", "caster aoe", NULL);
        EfficiencyActionExecutionListener* listener = new EfficiencyActionExecutionListener(ai, spellInfo, 600);
        engine->AddActionExecutionListener(listener);

        while (listener->CanContinue())
 	    {
            tick();
            refresh(spellInfo);
 	    }
        cout << "Act: " << ai->buffer << "\n";
        listener->Report();
	}

};

CPPUNIT_TEST_SUITE_REGISTRATION( ShamanEfficiencyTestCase );
