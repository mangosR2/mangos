#include "Config/Config.h"
#include "../pchdef.h"
#include "playerbot.h"
#include "PlayerbotAIConfig.h"
#include "PlayerbotFactory.h"
#include "../AccountMgr.h"
#include "RandomPlayerbotMgr.h"


class LoginQueryHolder;
class CharacterHandler;

PlayerbotHolder::PlayerbotHolder() : PlayerbotAIBase()
{
    for (uint32 spellId = 0; spellId < sSpellStore.GetNumRows(); spellId++)
        sSpellStore.LookupEntry(spellId);
}

PlayerbotHolder::~PlayerbotHolder()
{
    LogoutAllBots();
}


void PlayerbotHolder::UpdateAIInternal(uint32 elapsed)
{
}

void PlayerbotHolder::LogoutAllBots()
{
    while (true)
    {
        PlayerBotMap::const_iterator itr = GetPlayerBotsBegin();
        if (itr == GetPlayerBotsEnd()) break;
        Player* bot= itr->second;
        LogoutPlayerBot(bot->GetObjectGuid().GetRawValue());
    }
}

void PlayerbotHolder::LogoutPlayerBot(uint64 guid)
{
    Player* bot = GetPlayerBot(guid);
    if (bot)
    {
        bot->GetPlayerbotAI()->TellMaster("Goodbye!");

        WorldSession * botWorldSessionPtr = bot->GetSession();
        playerBots.erase(guid);    // deletes bot player ptr inside this WorldSession PlayerBotMap
        botWorldSessionPtr->LogoutPlayer(true); // this will delete the bot Player object and PlayerbotAI object
        delete botWorldSessionPtr;  // finally delete the bot's WorldSession
    }
}

Player* PlayerbotHolder::GetPlayerBot(uint64 playerGuid) const
{
    PlayerBotMap::const_iterator it = playerBots.find(playerGuid);
    return (it == playerBots.end()) ? 0 : it->second;
}

void PlayerbotHolder::OnBotLogin(Player * const bot)
{
    PlayerbotAI* ai = new PlayerbotAI(bot);
    bot->SetPlayerbotAI(ai);
    OnBotLoginInternal(bot);

    playerBots[bot->GetObjectGuid().GetRawValue()] = bot;

    Player* master = ai->GetMaster();
    if (master)
    {
        ObjectGuid masterGuid = master->GetObjectGuid();
        if (master->GetGroup() &&
            ! master->GetGroup()->IsLeader(masterGuid))
            master->GetGroup()->ChangeLeader(masterGuid);
    }

    Group *group = bot->GetGroup();
    if (group)
    {
        bool groupValid = false;
        Group::MemberSlotList const& slots = group->GetMemberSlots();
        for (Group::MemberSlotList::const_iterator i = slots.begin(); i != slots.end(); ++i)
        {
            ObjectGuid member = i->guid;
            uint32 account = sAccountMgr.GetPlayerAccountIdByGUID(member);
            if (!sPlayerbotAIConfig.IsInRandomAccountList(account))
            {
                groupValid = true;
                break;
            }
        }

        if (!groupValid)
        {
            WorldPacket p;
            string member = bot->GetName();
            p << uint32(PARTY_OP_LEAVE) << member << uint32(0);
            bot->GetSession()->HandleGroupDisbandOpcode(p);
        }
    }

    ai->ResetStrategies();
    ai->TellMaster("Hello!");
}

bool processBotCommand(WorldSession* session, string cmd, ObjectGuid guid)
{
    if (!sPlayerbotAIConfig.enabled || guid.IsEmpty() || (guid == session->GetPlayer()->GetObjectGuid()))
        return false;

    PlayerbotMgr* mgr = session->GetPlayer()->GetPlayerbotMgr();
    bool isRandomBot = sRandomPlayerbotMgr.IsRandomBot(guid);
    bool isRandomAccount = sPlayerbotAIConfig.IsInRandomAccountList(sObjectMgr.GetPlayerAccountIdByGUID(guid));

    if (isRandomAccount && !isRandomBot && session->GetSecurity() < SEC_GAMEMASTER)
        return false;

    if (cmd == "add" || cmd == "login")
    {
        if (sObjectMgr.GetPlayer(guid, true))
            return false;

        mgr->AddPlayerBot(guid.GetRawValue(), session->GetAccountId());
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
        else if (cmd == "update")
        {
            PlayerbotFactory factory(bot, bot->getLevel());
            factory.Randomize(true);
            return true;
        }
        else if (cmd == "random" && mgr->GetMaster())
        {
            sRandomPlayerbotMgr.Randomize(bot);
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

    if (charnameStr == "!" && player->GetSession()->GetSecurity() > SEC_GAMEMASTER)
    {
        for (PlayerBotMap::const_iterator i = mgr->GetPlayerBotsBegin(); i != mgr->GetPlayerBotsEnd(); ++i)
        {
            Player* bot = i->second;
            if (bot && bot->IsInWorld())
                bots.insert(bot->GetName());
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


PlayerbotMgr::PlayerbotMgr(Player* const master) : PlayerbotHolder(),  master(master)
{
}

PlayerbotMgr::~PlayerbotMgr()
{
}

void PlayerbotMgr::UpdateAIInternal(uint32 elapsed)
{
    SetNextCheckDelay(sPlayerbotAIConfig.reactDelay);
}

void PlayerbotMgr::HandleCommand(uint32 type, const string& text)
{
    Player *master = GetMaster();
    if (!master)
        return;

    for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        bot->GetPlayerbotAI()->HandleCommand(type, text, *master);
    }

    for (PlayerBotMap::const_iterator it = sRandomPlayerbotMgr.GetPlayerBotsBegin(); it != sRandomPlayerbotMgr.GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        if (bot->GetPlayerbotAI()->GetMaster() == master)
            bot->GetPlayerbotAI()->HandleCommand(type, text, *master);
    }
}

void PlayerbotMgr::HandleMasterIncomingPacket(const WorldPacket& packet)
{
    for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        bot->GetPlayerbotAI()->HandleMasterIncomingPacket(packet);
    }

    for (PlayerBotMap::const_iterator it = sRandomPlayerbotMgr.GetPlayerBotsBegin(); it != sRandomPlayerbotMgr.GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        if (bot->GetPlayerbotAI()->GetMaster() == GetMaster())
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

    for (PlayerBotMap::const_iterator it = sRandomPlayerbotMgr.GetPlayerBotsBegin(); it != sRandomPlayerbotMgr.GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        if (bot->GetPlayerbotAI()->GetMaster() == GetMaster())
            bot->GetPlayerbotAI()->HandleMasterOutgoingPacket(packet);
    }
}

void PlayerbotMgr::RandomizePlayerBot(uint64 guid, uint32 level, uint32 itemQuality)
{
    Player* bot = GetPlayerBot(guid);
    if (!bot)
        return;

    PlayerbotFactory factory(bot, level, itemQuality);
    factory.Randomize(false);
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
	if (GetMaster() && member != GetMaster()->GetObjectGuid())
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
    for (PlayerBotMap::const_iterator it = sRandomPlayerbotMgr.GetPlayerBotsBegin(); it != sRandomPlayerbotMgr.GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        if (bot->GetPlayerbotAI()->GetMaster() == GetMaster())
            bot->SaveToDB();
    }
}

void PlayerbotMgr::OnBotLoginInternal(Player * const bot)
{
    bot->GetPlayerbotAI()->SetMaster(master);
    bot->GetPlayerbotAI()->ResetStrategies();
}
