#include "Config/Config.h"
#include "../pchdef.h"
#include "playerbot.h"
#include "PlayerbotAIConfig.h"
#include "PlayerbotFactory.h"
#include "../AccountMgr.h"
#include "../ObjectMgr.h"
#include "../../shared/Database/DatabaseEnv.h"
#include "PlayerbotAI.h"
#include "../Player.h"
#include "RandomPlayerbotFactory.h"
#include "SystemConfig.h"

bool RandomPlayerbotFactory::CreateRandomBot()
{
    uint8 gender = rand() % 2 ? GENDER_MALE : GENDER_FEMALE;

    uint8 races[] = { RACE_HUMAN,  RACE_ORC, RACE_DWARF, RACE_NIGHTELF, RACE_UNDEAD, RACE_TAUREN,
            RACE_GNOME, RACE_TROLL, RACE_BLOODELF, RACE_DRAENEI };
    uint8 race = races[urand(0, sizeof(races) / sizeof(uint8) - 1)];

    map<uint8, uint8*> classes;
    uint8 humanClasses[] = { CLASS_WARRIOR, CLASS_PALADIN, CLASS_ROGUE, CLASS_PRIEST,
            CLASS_MAGE, CLASS_WARLOCK };
    classes[RACE_HUMAN] = humanClasses;
    uint8 dwarfClasses[] = { CLASS_WARRIOR, CLASS_PALADIN, CLASS_ROGUE, CLASS_PRIEST,
            CLASS_HUNTER };
    classes[RACE_DWARF] = dwarfClasses;
    uint8 neClasses[] = { CLASS_WARRIOR, CLASS_ROGUE, CLASS_PRIEST, CLASS_DRUID,
            CLASS_HUNTER };
    classes[RACE_NIGHTELF] = neClasses;
    uint8 gnomeClasses[] = { CLASS_WARRIOR, CLASS_ROGUE, CLASS_MAGE,
            CLASS_WARLOCK };
    classes[RACE_GNOME] = gnomeClasses;
    uint8 draeneiClasses[] = { CLASS_WARRIOR, CLASS_PALADIN, CLASS_HUNTER, CLASS_PRIEST, CLASS_MAGE,
            CLASS_SHAMAN };
    classes[RACE_DRAENEI] = draeneiClasses;
    uint8 orcClasses[] = { CLASS_WARRIOR, CLASS_HUNTER, CLASS_SHAMAN,
            CLASS_WARLOCK };
    classes[RACE_ORC] = orcClasses;
    uint8 undeadClasses[] = { CLASS_WARRIOR, CLASS_ROGUE, CLASS_PRIEST, CLASS_MAGE,
            CLASS_WARLOCK };
    classes[RACE_UNDEAD] = undeadClasses;
    uint8 taurenClasses[] = { CLASS_WARRIOR, CLASS_HUNTER, CLASS_SHAMAN, CLASS_DRUID  };
    classes[RACE_TAUREN] = taurenClasses;
    uint8 trollClasses[] = { CLASS_WARRIOR, CLASS_HUNTER, CLASS_ROGUE, CLASS_PRIEST, CLASS_SHAMAN, CLASS_MAGE };
    classes[RACE_TROLL] = trollClasses;
    uint8 beClasses[] = { CLASS_PALADIN, CLASS_HUNTER, CLASS_ROGUE, CLASS_PRIEST, CLASS_WARLOCK, CLASS_MAGE };
    classes[RACE_BLOODELF] = beClasses;

    uint8* availableClasses = classes[race];
    uint8 botClass = availableClasses[urand(0, sizeof(availableClasses) / sizeof(uint8) - 1)];

    string name = CreateRandomBotName();

    uint8 skin = urand(0, 7);
    uint8 face = urand(0, 7);
    uint8 hairStyle = urand(0, 7);
    uint8 hairColor = urand(0, 7);
    uint8 facialHair = urand(0, 7);
    uint8 outfitId = 0;

    WorldSession* session = new WorldSession(accountId, NULL, SEC_PLAYER, MAX_EXPANSION, 0, LOCALE_enUS);
    if (!session)
    {
        sLog.outError("Couldn't create session for random bot account %d", accountId);
        delete session;
        return false;
    }

    Player *player = new Player(session);
    if (!player->Create(sObjectMgr.GeneratePlayerLowGuid(), name, race, botClass, gender, skin, face, hairStyle,hairColor, facialHair, outfitId))
    {
        player->DeleteFromDB(player->GetObjectGuid(), accountId, true, true);
        delete session;
        delete player;
        sLog.outError("Unable to create random bot for account %d - name: \"%s\"; race: %u; class: %u; gender: %u; skin: %u; face: %u; hairStyle: %u; hairColor: %u; facialHair: %u; outfitId: %u",
                accountId, name.c_str(), race, botClass, gender, skin, face, hairStyle, hairColor, facialHair, outfitId);
        return false;
    }

    player->setCinematic(2);
    player->SetAtLoginFlag(AT_LOGIN_NONE);
    player->SaveToDB();

    sLog.outDetail("Random bot created for account %d - name: \"%s\"; race: %u; class: %u; gender: %u; skin: %u; face: %u; hairStyle: %u; hairColor: %u; facialHair: %u; outfitId: %u",
            accountId, name.c_str(), race, botClass, gender, skin, face, hairStyle, hairColor, facialHair, outfitId);

    return true;
}

string RandomPlayerbotFactory::CreateRandomBotName()
{
    QueryResult *result = CharacterDatabase.Query("SELECT MAX(name_id) FROM ai_playerbot_names");
    if (!result)
        return false;

    Field *fields = result->Fetch();
    uint32 maxId = fields[0].GetUInt32();
    delete result;

    uint32 id = urand(0, maxId);
    result = CharacterDatabase.PQuery("SELECT n.name FROM ai_playerbot_names n "
            "LEFT OUTER JOIN characters e ON e.name = n.name "
            "WHERE e.guid IS NULL AND n.name_id >= '%u' LIMIT 1", id);
    if (!result)
    {
        sLog.outError("No more names left for random bots");
        return false;
    }

    string name = fields[0].GetCppString();
    delete result;

    return name;
}

