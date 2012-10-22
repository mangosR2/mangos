#include "pch.h"

#include "aitest.h"
#include "EngineTestBase.h"
#include <time.inl>
#include "../game/playerbot/strategy/druid/DruidAiObjectContext.h"
#include "../game/playerbot/strategy/paladin/PaladinAiObjectContext.h"
#include "../game/playerbot/strategy/warrior/WarriorAiObjectContext.h"
#include "../game/playerbot/strategy/warlock/WarlockAiObjectContext.h"
#include "../game/playerbot/strategy/mage/MageAiObjectContext.h"
#include "../game/playerbot/strategy/hunter/HunterAiObjectContext.h"
#include "../game/playerbot/strategy/priest/PriestAiObjectContext.h"
#include "../game/playerbot/strategy/shaman/ShamanAiObjectContext.h"
#include "../game/playerbot/PlayerbotAIConfig.h"

using namespace ai;


class PerformanceTestCase : public EngineTestBase
{
    CPPUNIT_TEST_SUITE( PerformanceTestCase );
        CPPUNIT_TEST( druidBear );
        CPPUNIT_TEST( druidCat );
        CPPUNIT_TEST( paladin );
        CPPUNIT_TEST( warrior );
        CPPUNIT_TEST( warlock );
        CPPUNIT_TEST( priest );
        CPPUNIT_TEST( mage );
        CPPUNIT_TEST( hunter );
        CPPUNIT_TEST( shaman );
    CPPUNIT_TEST_SUITE_END();

public:
    void setUp()
    {
        EngineTestBase::setUp();
        setupEngine(new AiObjectContext(ai), "melee", NULL);
    }

protected:
    void run()
    {
        time_t timestamp = time(0);
        for (int i=0; i<100; i++) 
        {
            tick();
        }

        cout << "Time: " << (time(0) - timestamp);
    }

    void druidBear()
    {
        setupEngine(new DruidAiObjectContext(ai), "tank", NULL);
        sPlayerbotAIConfig.iterationsPerTick = 100;
        run();
        sPlayerbotAIConfig.iterationsPerTick = 10;
    }

    void paladin()
    {
        setupEngine(new PaladinAiObjectContext(ai), "tank", NULL);
        sPlayerbotAIConfig.iterationsPerTick = 100;
        run();
        sPlayerbotAIConfig.iterationsPerTick = 10;
    }

    void priest()
    {
        setupEngine(new PriestAiObjectContext(ai), "heal", NULL);
        sPlayerbotAIConfig.iterationsPerTick = 100;
        run();
        sPlayerbotAIConfig.iterationsPerTick = 10;
    }

    void mage()
    {
        setupEngine(new MageAiObjectContext(ai), "frost", NULL);
        sPlayerbotAIConfig.iterationsPerTick = 100;
        run();
        sPlayerbotAIConfig.iterationsPerTick = 10;
    }

    void hunter()
    {
        setupEngine(new HunterAiObjectContext(ai), "dps", NULL);
        sPlayerbotAIConfig.iterationsPerTick = 100;
        run();
        sPlayerbotAIConfig.iterationsPerTick = 10;
    }

    void warrior()
    {
        setupEngine(new WarriorAiObjectContext(ai), "tank", NULL);
        sPlayerbotAIConfig.iterationsPerTick = 100;
        run();
        sPlayerbotAIConfig.iterationsPerTick = 10;
    }

    void druidCat()
    {
        setupEngine(new DruidAiObjectContext(ai), "dps", NULL);
        sPlayerbotAIConfig.iterationsPerTick = 100;
        run();
        sPlayerbotAIConfig.iterationsPerTick = 10;
    }

    void warlock()
    {
        setupEngine(new WarlockAiObjectContext(ai), "tank", NULL);
        sPlayerbotAIConfig.iterationsPerTick = 100;
        run();
        sPlayerbotAIConfig.iterationsPerTick = 10;
    }

    void shaman()
    {
        setupEngine(new ShamanAiObjectContext(ai), "heal", NULL);
        sPlayerbotAIConfig.iterationsPerTick = 100;
        run();
        sPlayerbotAIConfig.iterationsPerTick = 10;
    }
};

CPPUNIT_TEST_SUITE_REGISTRATION( PerformanceTestCase );
