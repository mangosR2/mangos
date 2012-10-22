#include "Config/Config.h"
#include "../pchdef.h"
#include "playerbot.h"
#include "strategy/values/SharedValueContext.h"
#include "PlayerbotAIConfig.h"
#include "PlayerbotFactory.h"
#include "../AccountMgr.h"


class LoginQueryHolder;
class CharacterHandler;

class SharedPlayerbotAI : public PlayerbotAIBase
{
public:
    SharedPlayerbotAI() : PlayerbotAIBase() { }
    virtual ~SharedPlayerbotAI() { }

public:
    SharedValueContext* GetSharedValues()
    {
        return &sharedValues;
    }

    virtual void UpdateAIInternal(uint32 elapsed)
    {
        sharedValues.Update();
    }

    void Clear()
    {
        sharedValues.Clear();
    }

private:
    SharedValueContext sharedValues;
};

PlayerbotMgr::PlayerbotMgr(Player* const master) : PlayerbotAIBase(),  m_master(master) , sharedAi(NULL)
{
    for (uint32 spellId = 0; spellId < sSpellStore.GetNumRows(); spellId++)
        sSpellStore.LookupEntry(spellId);
}

PlayerbotMgr::~PlayerbotMgr()
{
    LogoutAllBots();
    if (sharedAi)
    {
        delete sharedAi;
        sharedAi = NULL;
    }
}

void PlayerbotMgr::UpdateAIInternal(uint32 elapsed)
{
    if (sharedAi)
        sharedAi->UpdateAI(elapsed);

    SetNextCheckDelay(sPlayerbotAIConfig.reactDelay);
}

void PlayerbotMgr::HandleMasterIncomingPacket(const WorldPacket& packet)
{
    for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        bot->GetPlayerbotAI()->HandleMasterIncomingPacket(packet);
    }

    switch (packet.GetOpcode())
    {
        // if master is logging out, log out all bots
        case CMSG_LOGOUT_REQUEST:
        {
            LogoutAllBots();
            return;
        }
    }
}
void PlayerbotMgr::HandleMasterOutgoingPacket(const WorldPacket& packet)
{
    for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        bot->GetPlayerbotAI()->HandleMasterOutgoingPacket(packet);
    }
}

void PlayerbotMgr::LogoutAllBots()
{
    while (true)
    {
        PlayerBotMap::const_iterator itr = GetPlayerBotsBegin();
        if (itr == GetPlayerBotsEnd()) break;
        Player* bot= itr->second;
        LogoutPlayerBot(bot->GetObjectGuid().GetRawValue());
    }
}

void PlayerbotMgr::LogoutPlayerBot(uint64 guid)
{
    Player* bot = GetPlayerBot(guid);
    if (bot)
    {
        bot->GetPlayerbotAI()->TellMaster("Goodbye!");

        ResetSharedAi();

        WorldSession * botWorldSessionPtr = bot->GetSession();
        m_playerBots.erase(guid);    // deletes bot player ptr inside this WorldSession PlayerBotMap
        botWorldSessionPtr->LogoutPlayer(true); // this will delete the bot Player object and PlayerbotAI object
        delete botWorldSessionPtr;  // finally delete the bot's WorldSession
    }
}

void PlayerbotMgr::RandomizePlayerBot(uint64 guid, uint32 level, uint32 itemQuality)
{
    Player* bot = GetPlayerBot(guid);
    if (!bot)
        return;

    PlayerbotFactory factory(bot, level, itemQuality);
    factory.Randomize();
}

Player* PlayerbotMgr::GetPlayerBot(uint64 playerGuid) const
{
    PlayerBotMap::const_iterator it = m_playerBots.find(playerGuid);
    return (it == m_playerBots.end()) ? 0 : it->second;
}

void PlayerbotMgr::OnBotLogin(Player * const bot)
{
    ResetSharedAi();

    PlayerbotAI* ai = new PlayerbotAI(this, bot, ((SharedPlayerbotAI*)sharedAi)->GetSharedValues());
    bot->SetPlayerbotAI(ai);

    m_playerBots[bot->GetObjectGuid().GetRawValue()] = bot;

    ObjectGuid masterGuid = m_master->GetObjectGuid();
    if (m_master->GetGroup() &&
        ! m_master->GetGroup()->IsLeader(masterGuid))
        m_master->GetGroup()->ChangeLeader(masterGuid);

    ai->TellMaster("Hello!");
}

bool processBotCommand(WorldSession* session, string cmd, ObjectGuid guid)
{
    if (!sPlayerbotAIConfig.enabled || guid.IsEmpty() || (guid == session->GetPlayer()->GetObjectGuid()))
        return false;

    PlayerbotMgr* mgr = session->GetPlayer()->GetPlayerbotMgr();
    bool isRandomBot = mgr->GetMaster()->GetRandomPlayerbotMgr()->IsRandomBot(guid);
    bool isRandomAccount = sPlayerbotAIConfig.IsInRandomAccountList(sObjectMgr.GetPlayerAccountIdByGUID(guid));

    if (isRandomAccount && !isRandomBot && session->GetSecurity() < SEC_GAMEMASTER)
        return false;

    if (cmd == "add" || cmd == "login")
    {
        if (sObjectMgr.GetPlayer(guid, true))
            return false;

        mgr->AddPlayerBot(guid.GetRawValue(), session);
        return true;
    }
    else if (cmd == "remove" || cmd == "logout" || cmd == "rm")
    {
        if (!mgr->GetPlayerBot(guid.GetRawValue()))
            return false;

        mgr->LogoutPlayerBot(guid.GetRawValue());
        return true;
    }

    if (session->GetSecurity() >= SEC_GAMEMASTER)
    {
        Player* bot = mgr->GetPlayerBot(guid.GetRawValue());
        if (!bot)
            return false;

        if (cmd == "init=white" || cmd == "init=common")
        {
            mgr->RandomizePlayerBot(guid.GetRawValue(), session->GetPlayer()->getLevel(), ITEM_QUALITY_NORMAL);
            return true;
        }
        else if (cmd == "init=green" || cmd == "init=uncommon")
        {
            mgr->RandomizePlayerBot(guid.GetRawValue(), session->GetPlayer()->getLevel(), ITEM_QUALITY_UNCOMMON);
            return true;
        }
        else if (cmd == "init=blue" || cmd == "init=rare")
        {
            mgr->RandomizePlayerBot(guid.GetRawValue(), session->GetPlayer()->getLevel(), ITEM_QUALITY_RARE);
            return true;
        }
        else if (cmd == "init=epic" || cmd == "init=purple")
        {
            mgr->RandomizePlayerBot(guid.GetRawValue(), session->GetPlayer()->getLevel(), ITEM_QUALITY_EPIC);
            return true;
        }
        else if (cmd == "pvp")
        {
            mgr->GetMaster()->GetRandomPlayerbotMgr()->DoPvpAttack(bot);
            return true;
        }
        else if (cmd == "random")
        {
            mgr->GetMaster()->GetRandomPlayerbotMgr()->Randomize(bot);
            return true;
        }
    }

    return false;
}

bool ChatHandler::HandlePlayerbotCommand(char* args)
{
	if(sConfig.GetBoolDefault("PlayerbotAI.DisableBots", false))
	{
		PSendSysMessage("|cffff0000Playerbot system is currently disabled!");
        SetSentErrorMessage(true);
        return false;
	}

    if (! m_session)
    {
        PSendSysMessage("You may only add bots from an active session");
        SetSentErrorMessage(true);
        return false;
    }

    if (!*args)
    {
        PSendSysMessage("usage: add/init/remove PLAYERNAME or option or option=value");
        SetSentErrorMessage(true);
        return false;
    }

    char *cmd = strtok ((char*)args, " ");
    char *charname = strtok (NULL, " ");
    if (!cmd || !charname)
    {
        PSendSysMessage("usage: add/init/remove PLAYERNAME or option or option=value");
        SetSentErrorMessage(true);
        return false;
    }

    std::string cmdStr = cmd;
    std::string charnameStr = charname;

    if (cmdStr == "option" && m_session->GetSecurity() >= SEC_GAMEMASTER)
    {
        if (charnameStr.find("=") == string::npos)
        {
            string value = sPlayerbotAIConfig.GetValue(charnameStr);
            ostringstream out; out << charnameStr << " = " << value;
            PSendSysMessage(out.str().c_str());
        }
        else
        {
            string value = charnameStr.substr(charnameStr.find("=") + 1);
            string option = charnameStr.substr(0, charnameStr.find("="));
            sPlayerbotAIConfig.SetValue(option, value);
            ostringstream out; out << charnameStr << " set to " << value;
            PSendSysMessage(out.str().c_str());
        }
        return true;
    }

    Player* player = m_session->GetPlayer();
    PlayerbotMgr* mgr = player->GetPlayerbotMgr();
    if (!mgr)
    {
        PSendSysMessage("you cannot control bots yet");
        SetSentErrorMessage(true);
        return false;
    }

    set<string> bots;
    if (charnameStr == "*")
    {
        Group* group = player->GetGroup();
        if (!group)
        {
            PSendSysMessage("you must be in group");
            SetSentErrorMessage(true);
            return false;
        }

        Group::MemberSlotList slots = group->GetMemberSlots();
        for (Group::member_citerator i = slots.begin(); i != slots.end(); i++)
        {
			ObjectGuid member = i->guid;

			if (member == m_session->GetPlayer()->GetObjectGuid())
				continue;

			string bot;
			if (sObjectMgr.GetPlayerNameByGUID(member, bot))
			    bots.insert(bot);
        }
    }

    vector<string> chars = split(charnameStr, ',');
    for (vector<string>::iterator i = chars.begin(); i != chars.end(); i++)
    {
        string s = *i;

        uint32 accountId = mgr->GetAccountId(s);
        if (!accountId)
        {
            bots.insert(s);
            continue;
        }

        QueryResult* results = CharacterDatabase.PQuery(
            "SELECT name FROM characters WHERE account = '%u'",
            accountId);
        if (results)
        {
            do
            {
                Field* fields = results->Fetch();
                string charName = fields[0].GetCppString();
                bots.insert(charName);
            } while (results->NextRow());

            delete results;
        }
	}

    bool res = false;
    for (set<string>::iterator i = bots.begin(); i != bots.end(); ++i)
    {
        string bot = *i;
        if (mgr->ProcessBot(bot, cmdStr))
        {
            PSendSysMessage("%s: %s - ok", cmdStr.c_str(), bot.c_str());
            res = true;
        }
        else
        {
            PSendSysMessage("%s: %s - now allowed", cmdStr.c_str(), bot.c_str());
        }
    }

    SetSentErrorMessage(true);
    return res;
}

uint32 PlayerbotMgr::GetAccountId(string name)
{
    uint32 accountId = 0;

    QueryResult *results = LoginDatabase.PQuery("SELECT id FROM account WHERE username = '%s'", name.c_str());
    if(results)
    {
        Field* fields = results->Fetch();
        accountId = fields[0].GetUInt32();
        delete results;
    }

    return accountId;
}

bool PlayerbotMgr::ProcessBot(string name, string cmdStr)
{
    ObjectGuid member = sObjectMgr.GetPlayerGuidByName(name);
	if (member != GetMaster()->GetObjectGuid())
    {
		return processBotCommand(GetMaster()->GetSession(), cmdStr, member);
    }
    return false;
}

void PlayerbotMgr::SaveToDB()
{
    for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        bot->SaveToDB();
    }
}

void PlayerbotMgr::ResetSharedAi()
{
    if (sharedAi)
        ((SharedPlayerbotAI*)sharedAi)->Clear();
    else
        sharedAi = new SharedPlayerbotAI();
}
