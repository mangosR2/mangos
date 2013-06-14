/*
 * Copyright (C) 2005,2006,2007 MaNGOS <http://www.mangosproject.org/>
 * Copyright (C) 2010-2013 MangosR2 <http://github.com/MangosR2>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "Common.h"
#include "ChatLexicsCutter.h"
#include "ChatLog.h"
#include "Chat.h"
#include "Group.h"
#include "Guild.h"
#include "GuildMgr.h"
#include "ObjectMgr.h"
#include "SpellAuras.h"
#include "Policies/Singleton.h"

INSTANTIATE_SINGLETON_1( ChatLog );

ChatLog::ChatLog()
{
    for (uint8 i = 0; i < CHATLOG_CHAT_TYPES_COUNT; ++i)
    {
        m_sLogFileNames[i] = "";
        files[i] = NULL;
    }

    Lexics = NULL;
    m_sInnormativeFileName = "";
    f_innormative = NULL;
}

ChatLog::~ChatLog()
{
    Uninitialize();
}

void ChatLog::Initialize()
{
    if (m_sAnalogsFileName == "" || m_sWordsFileName == "")
        m_bLexicsCutterEnable = false;

    if (m_bLexicsCutterEnable)
    {
        // initialize lexics cutter
        Lexics = new LexicsCutter;
        if (Lexics && Lexics->Read_Letter_Analogs(m_sAnalogsFileName) && Lexics->Read_Innormative_Words(m_sWordsFileName))
        {
            Lexics->Map_Innormative_Words();
            // read additional parameters
            Lexics->IgnoreLetterRepeat = m_bLexicsCutterIgnoreLetterRepeat;
            Lexics->IgnoreMiddleSpaces = m_bLexicsCutterIgnoreMiddleSpaces;
        }
        else
        {
            m_bLexicsCutterEnable = false;
            if (Lexics)
            {
                delete Lexics;
                Lexics = NULL;
            }
        }
    }

    if (m_bLexicsCutterEnable || m_uiChatLogMethod == CHAT_LOG_METHOD_FILE)
    {
        // open all files (with aliasing)
        OpenAllFiles();

        // write timestamps (init)
        WriteInitStamps();
    }
}

void ChatLog::Uninitialize()
{
    // close all files (avoiding double-close)
    CloseAllFiles();

    if (Lexics)
    {
        delete Lexics;
        Lexics = NULL;
    }
}

bool ChatLog::_ChatCommon(ChatLogFiles ChatType, Player* player, std::string& msg)
{
    if (m_bLexicsCutterEnable && Lexics && m_bCutFlag[ChatType] && Lexics->Check_Lexics(msg))
        ChatBadLexicsAction(player, msg);

    if (m_uiChatLogMethod == CHAT_LOG_METHOD_NONE)
        return false;

    if (m_bChatLogIgnoreUnprintable)
    {
        // have to ignore unprintables, verify string by UTF8 here
        uint32 pos = 0;
        std::string lchar;
        while (LexicsCutter::ReadUTF8(msg, lchar, pos))
        {
            if (lchar.size() == 1 && lchar[0] < ' ')
                return false; // unprintable detected
        }
    }

    return true;
}

void ChatLog::ChatMsg(Player* player, std::string& msg, uint32 type)
{
    if (!_ChatCommon(CHAT_LOG_CHAT, player, msg))
        return;

    if (m_uiChatLogMethod == CHAT_LOG_METHOD_SQL)
    {
        static SqlStatementID insChat;
        SqlStatement stmt = CharacterDatabase.CreateStatement(insChat, "INSERT INTO `chat_log_chat` (`date_time`,`type`,`pname`,`msg`,`level`,`account_id`) VALUES (NOW(), ?, ?, ?, ?, ?)");
        stmt.addUInt32(type);
        stmt.addString(player->GetName());
        stmt.addString(msg.c_str());
        stmt.addUInt32(player->getLevel());
        stmt.addUInt32(player->GetSession()->GetAccountId());
        stmt.Execute();
        return;
    }

    CheckDateSwitch();

    std::string log_str = "";

    switch (type)
    {
        case CHAT_MSG_EMOTE:
            log_str.append("{EMOTE} ");
            break;

        case CHAT_MSG_YELL:
            log_str.append("{YELL} ");
            break;
    }

    log_str.append("[");
    log_str.append(player->GetName());
    log_str.append("] ");

    log_str.append(msg);

    log_str.append("\n");

    if (m_bScreenFlag[CHAT_LOG_CHAT])
        printf("%s", log_str.c_str());

    if (files[CHAT_LOG_CHAT])
    {
        OutTimestamp(files[CHAT_LOG_CHAT]);
        fprintf(files[CHAT_LOG_CHAT], "%s", log_str.c_str());
        fflush(files[CHAT_LOG_CHAT]);
    }
}

void ChatLog::PartyMsg(Player* player, std::string& msg)
{
    if (!_ChatCommon(CHAT_LOG_PARTY, player, msg))
        return;

    if (m_uiChatLogMethod == CHAT_LOG_METHOD_SQL)
    {
        std::string group_str = "";
        Group* group = player->GetGroup();
        if (!group)
            group_str.append("[unknown party]");
        else
        {
            Player* gm_member;
            Group::MemberSlotList g_members = group->GetMemberSlots();
            for (Group::member_citerator itr = g_members.begin(); itr != g_members.end(); itr++)
            {
                gm_member = sObjectMgr.GetPlayer(itr->guid);
                if (gm_member)
                {
                    group_str.append(itr->name);
                    group_str.append(",");
                }
            }
            if (group_str.length() > 1)
                group_str.erase(group_str.length() - 1);
        }

        static SqlStatementID insChat;
        SqlStatement stmt = CharacterDatabase.CreateStatement(insChat, "INSERT INTO `chat_log_party` (`date_time`,`pname`,`msg`,`level`,`account_id`,`members`) VALUES (NOW(), ?, ?, ?, ?, ?)");
        stmt.addString(player->GetName());
        stmt.addString(msg.c_str());
        stmt.addUInt32(player->getLevel());
        stmt.addUInt32(player->GetSession()->GetAccountId());
        stmt.addString(group_str.c_str());
        stmt.Execute();
        return;
    }

    CheckDateSwitch();

    std::string log_str = "";

    log_str.append("[");
    log_str.append(player->GetName());
    log_str.append("]->GROUP:");

    Group* group = player->GetGroup();
    if (!group)
    {
        log_str.append("[unknown group] ");
    }
    else
    {
        // obtain group information
        log_str.append("[");

        ObjectGuid gm_leader_GUID = group->GetLeaderGuid();

        Player* gm_member = sObjectMgr.GetPlayer(gm_leader_GUID);
        if (gm_member)
        {
            log_str.append(gm_member->GetName());
            log_str.append(",");
        }

        Group::MemberSlotList g_members = group->GetMemberSlots();

        for (Group::member_citerator itr = g_members.begin(); itr != g_members.end(); itr++)
        {
            if (itr->guid == gm_leader_GUID)
                continue;

            gm_member = sObjectMgr.GetPlayer(itr->guid);
            if (gm_member)
            {
                log_str.append(itr->name);
                log_str.append(",");
            }
        }

        log_str.erase(log_str.length() - 1);
        log_str.append("] ");
    }

    log_str.append(msg);

    log_str.append("\n");

    if (m_bScreenFlag[CHAT_LOG_PARTY])
        printf("%s", log_str.c_str());

    if (files[CHAT_LOG_PARTY])
    {
        OutTimestamp(files[CHAT_LOG_PARTY]);
        fprintf(files[CHAT_LOG_PARTY], "%s", log_str.c_str());
        fflush(files[CHAT_LOG_PARTY]);
    }
}

void ChatLog::GuildMsg(Player* player, std::string& msg, bool officer)
{
    if (!_ChatCommon(CHAT_LOG_GUILD, player, msg))
        return;

    if (m_uiChatLogMethod == CHAT_LOG_METHOD_SQL)
    {
        std::string guild_str = "";
        if (!player->GetGuildId())
            guild_str.append("[unknown guild]");
        else
        {
            Guild* guild = sGuildMgr.GetGuildById(player->GetGuildId());
            if (!guild)
                guild_str.append("[unknown guild]");
            else
                guild_str.append(guild->GetName());
            if (officer)
                guild_str.append("(officer)");
        }

        static SqlStatementID insChat;
        SqlStatement stmt = CharacterDatabase.CreateStatement(insChat, "INSERT INTO `chat_log_guild` (`date_time`,`pname`,`msg`,`level`,`account_id`,`guild`) VALUES (NOW(), ?, ?, ?, ?, ?)");
        stmt.addString(player->GetName());
        stmt.addString(msg.c_str());
        stmt.addUInt32(player->getLevel());
        stmt.addUInt32(player->GetSession()->GetAccountId());
        stmt.addString(guild_str.c_str());
        stmt.Execute();
        return;
    }

    CheckDateSwitch();

    std::string log_str = "";

    log_str.append("[");
    log_str.append(player->GetName());
    log_str.append((officer ? "]->GUILD_OFF:" : "]->GUILD:"));

    if (!player->GetGuildId())
    {
        log_str.append("[unknown guild] ");
    }
    else
    {
        Guild* guild = sGuildMgr.GetGuildById(player->GetGuildId());
        if (!guild)
        {
            log_str.append("[unknown guild] ");
        }
        else
        {
            // obtain guild information
            log_str.append("(");
            log_str.append(guild->GetName());
            log_str.append(") ");
        }
    }

    log_str.append(msg);

    log_str.append("\n");

    if (m_bScreenFlag[CHAT_LOG_GUILD])
        printf("%s", log_str.c_str());
    if (files[CHAT_LOG_GUILD])
    {
        OutTimestamp(files[CHAT_LOG_GUILD]);
        fprintf(files[CHAT_LOG_GUILD], "%s", log_str.c_str());
        fflush(files[CHAT_LOG_GUILD]);
    }
}

void ChatLog::WhisperMsg(Player* player, std::string& to, std::string& msg)
{
    if (!_ChatCommon(CHAT_LOG_WHISPER, player, msg))
        return;

    if (m_uiChatLogMethod == CHAT_LOG_METHOD_SQL)
    {
        static SqlStatementID insChat;
        SqlStatement stmt = CharacterDatabase.CreateStatement(insChat, "INSERT INTO `chat_log_whisper` (`date_time`,`pname`,`msg`,`level`,`account_id`,`to`) VALUES (NOW(), ?, ?, ?, ?, ?)");
        stmt.addString(player->GetName());
        stmt.addString(msg.c_str());
        stmt.addUInt32(player->getLevel());
        stmt.addUInt32(player->GetSession()->GetAccountId());
        stmt.addString(to.c_str());
        stmt.Execute();
        return;
    }

    CheckDateSwitch();

    std::string log_str = "";

    log_str.append("[");
    log_str.append(player->GetName());
    log_str.append("]->");

    if (to.size() == 0)
    {
        log_str.append("[???] ");
    }
    else
    {
        normalizePlayerName(to);
        log_str.append("[");
        log_str.append(to);
        log_str.append("] ");
    }

    log_str.append(msg);

    log_str.append("\n");

    if (m_bScreenFlag[CHAT_LOG_WHISPER])
        printf("%s", log_str.c_str());
    if (files[CHAT_LOG_WHISPER])
    {
        OutTimestamp(files[CHAT_LOG_WHISPER]);
        fprintf(files[CHAT_LOG_WHISPER], "%s", log_str.c_str());
        fflush(files[CHAT_LOG_WHISPER]);
    }
}

void ChatLog::ChannelMsg(Player* player, std::string& channel, std::string& msg)
{
    if (!_ChatCommon(CHAT_LOG_CHANNEL, player, msg))
        return;

    if (m_uiChatLogMethod == CHAT_LOG_METHOD_SQL)
    {
        std::string channel_str = "";
        if (channel.size() == 0)
            channel_str.append("[unknown channel]");
        else
            channel_str.append(channel);

        static SqlStatementID insChat;
        SqlStatement stmt = CharacterDatabase.CreateStatement(insChat, "INSERT INTO `chat_log_channel` (`date_time`,`pname`,`msg`,`level`,`account_id`,`channel`) VALUES (NOW(), ?, ?, ?, ?, ?)");
        stmt.addString(player->GetName());
        stmt.addString(msg.c_str());
        stmt.addUInt32(player->getLevel());
        stmt.addUInt32(player->GetSession()->GetAccountId());
        stmt.addString(channel_str.c_str());
        stmt.Execute();
        return;
    }

    CheckDateSwitch();

    std::string log_str = "";

    log_str.append("[");
    log_str.append(player->GetName());
    log_str.append("]->CHANNEL:");

    if (channel.size() == 0)
    {
        log_str.append("[unknown channel] ");
    }
    else
    {
        log_str.append("[");
        log_str.append(channel);
        log_str.append("] ");
    }

    log_str.append(msg);

    log_str.append("\n");

    if (m_bScreenFlag[CHAT_LOG_CHANNEL])
        printf("%s", log_str.c_str());

    if (files[CHAT_LOG_CHANNEL])
    {
        OutTimestamp(files[CHAT_LOG_CHANNEL]);
        fprintf(files[CHAT_LOG_CHANNEL], "%s", log_str.c_str());
        fflush(files[CHAT_LOG_CHANNEL]);
    }
}

void ChatLog::RaidMsg(Player* player, std::string& msg, uint32 type)
{
    if (!_ChatCommon(CHAT_LOG_RAID, player, msg))
        return;

    if (m_uiChatLogMethod == CHAT_LOG_METHOD_SQL)
    {
        std::string group_str = "";
        Group* group = player->GetGroup();
        if (!group)
            group_str.append("[unknown raid]");
        else
        {
            Player* gm_member;
            Group::MemberSlotList g_members = group->GetMemberSlots();
            for (Group::member_citerator itr = g_members.begin(); itr != g_members.end(); itr++)
            {
                gm_member = sObjectMgr.GetPlayer(itr->guid);
                if (gm_member)
                {
                    group_str.append(itr->name);
                    group_str.append(",");
                }
            }
            if (group_str.length() > 1)
                group_str.erase(group_str.length() - 1);
        }

        static SqlStatementID insChat;
        SqlStatement stmt = CharacterDatabase.CreateStatement(insChat, "INSERT INTO `chat_log_raid` (`date_time`,`type`,`pname`,`msg`,`level`,`account_id`,`members`) VALUES (NOW(), ?, ?, ?, ?, ?, ?)");
        stmt.addUInt32(type);
        stmt.addString(player->GetName());
        stmt.addString(msg.c_str());
        stmt.addUInt32(player->getLevel());
        stmt.addUInt32(player->GetSession()->GetAccountId());
        stmt.addString(group_str.c_str());
        stmt.Execute();
        return;
    }

    CheckDateSwitch();

    std::string log_str = "";

    log_str.append("[");
    log_str.append(player->GetName());

    switch (type)
    {
        case CHAT_MSG_RAID:
            log_str.append("]->RAID:");
            break;

        case CHAT_MSG_RAID_LEADER:
            log_str.append("]->RAID_LEADER:");
            break;

        case CHAT_MSG_RAID_WARNING:
            log_str.append("]->RAID_WARN:");
            break;

        default:
            log_str.append("]->RAID_UNKNOWN:");
            break;
    }

    Group* group = player->GetGroup();
    if (!group)
    {
        log_str.append("[unknown raid] ");
    }
    else
    {
        // obtain group information
        log_str.append("[");

        ObjectGuid gm_leader_GUID = group->GetLeaderGuid();
        Player* gm_member;

        gm_member = sObjectMgr.GetPlayer(gm_leader_GUID);
        if (gm_member)
        {
            log_str.append(gm_member->GetName());
            log_str.append(",");
        }

        Group::MemberSlotList g_members = group->GetMemberSlots();

        for (Group::member_citerator itr = g_members.begin(); itr != g_members.end(); itr++)
        {
            if (itr->guid == gm_leader_GUID)
                continue;

            gm_member = sObjectMgr.GetPlayer(itr->guid);
            if (gm_member)
            {
                log_str.append(itr->name);
                log_str.append(",");
            }
        }

        log_str.erase(log_str.length() - 1);
        log_str.append("] ");
    }

    log_str.append(msg);

    log_str.append("\n");

    if (m_bScreenFlag[CHAT_LOG_RAID])
        printf("%s", log_str.c_str());

    if (files[CHAT_LOG_RAID])
    {
        OutTimestamp(files[CHAT_LOG_RAID]);
        fprintf(files[CHAT_LOG_RAID], "%s", log_str.c_str());
        fflush(files[CHAT_LOG_RAID]);
    }
}

void ChatLog::BattleGroundMsg(Player* player, std::string& msg, uint32 type)
{
    if (!_ChatCommon(CHAT_LOG_BATTLEGROUND, player, msg))
        return;

    if (m_uiChatLogMethod == CHAT_LOG_METHOD_SQL)
    {
        std::string group_str = "";
        Group* group = player->GetGroup();
        if (!group)
            group_str.append("[unknown group]");
        else
        {
            Player* gm_member;
            Group::MemberSlotList g_members = group->GetMemberSlots();
            for (Group::member_citerator itr = g_members.begin(); itr != g_members.end(); itr++)
            {
                gm_member = sObjectMgr.GetPlayer(itr->guid);
                if (gm_member)
                {
                    group_str.append(itr->name);
                    group_str.append(",");
                }
            }
            if (group_str.length() > 1)
                group_str.erase(group_str.length() - 1);
        }

        static SqlStatementID insChat;
        SqlStatement stmt = CharacterDatabase.CreateStatement(insChat, "INSERT INTO `chat_log_bg` (`date_time`,`type`,`pname`,`msg`,`level`,`account_id`,`members`) VALUES (NOW(), ?, ?, ?, ?, ?, ?)");
        stmt.addUInt32(type);
        stmt.addString(player->GetName());
        stmt.addString(msg.c_str());
        stmt.addUInt32(player->getLevel());
        stmt.addUInt32(player->GetSession()->GetAccountId());
        stmt.addString(group_str.c_str());
        stmt.Execute();
        return;
    }

    CheckDateSwitch();

    std::string log_str = "";

    log_str.append("[");
    log_str.append(player->GetName());

    switch (type)
    {
        case CHAT_MSG_BATTLEGROUND:
            log_str.append("]->BG:");
            break;

        case CHAT_MSG_BATTLEGROUND_LEADER:
            log_str.append("]->BG_LEADER:");
            break;

        default:
            log_str.append("]->BG_UNKNOWN:");
            break;
    }

    Group* group = player->GetGroup();
    if (!group)
    {
        log_str.append("[unknown group] ");
    }
    else
    {
        // obtain group information
        log_str.append("[");

        ObjectGuid gm_leader_GUID = group->GetLeaderGuid();
        Player* gm_member;

        gm_member = sObjectMgr.GetPlayer(gm_leader_GUID);
        if (gm_member)
        {
            log_str.append(gm_member->GetName());
            log_str.append(",");
        }

        Group::MemberSlotList g_members = group->GetMemberSlots();

        for (Group::member_citerator itr = g_members.begin(); itr != g_members.end(); itr++)
        {
            if (itr->guid == gm_leader_GUID)
                continue;

            gm_member = sObjectMgr.GetPlayer(itr->guid);
            if (gm_member)
            {
                log_str.append(itr->name);
                log_str.append(",");
            }
        }

        log_str.erase(log_str.length() - 1);
        log_str.append("] ");
    }

    log_str.append(msg);

    log_str.append("\n");

    if (m_bScreenFlag[CHAT_LOG_BATTLEGROUND])
        printf("%s", log_str.c_str());

    if (files[CHAT_LOG_BATTLEGROUND])
    {
        OutTimestamp(files[CHAT_LOG_BATTLEGROUND]);
        fprintf(files[CHAT_LOG_BATTLEGROUND], "%s", log_str.c_str());
        fflush(files[CHAT_LOG_BATTLEGROUND]);
    }
}

void ChatLog::OpenAllFiles()
{
    if (!m_bLexicsCutterEnable && m_uiChatLogMethod != CHAT_LOG_METHOD_FILE)
        return;

    std::string tempname;
    char dstr[12];

    if (m_bChatLogDateSplit)
    {
        time_t t = time(NULL);
        tm* aTm = localtime(&t);
        sprintf(dstr, "%-4d-%02d-%02d", aTm->tm_year + 1900, aTm->tm_mon + 1, aTm->tm_mday);
    }

    if (!m_sLogsDir.empty())
    {
        switch (m_sLogsDir[m_sLogsDir.size() - 1])
        {
            case '/':
            case '\\':
                break;
            default:
                m_sLogsDir.append("/");
        }
    }

    if (m_uiChatLogMethod == CHAT_LOG_METHOD_FILE)
    {
        for (int8 i = 0; i < CHATLOG_CHAT_TYPES_COUNT; ++i)
        {
            if (m_sLogFileNames[i] != "")
            {
                for (int8 j = i - 1; j >= 0; --j)
                {
                    if (m_sLogFileNames[i] == m_sLogFileNames[j])
                    {
                        files[i] = files[j];
                        break;
                    }
                }
                if (!files[i])
                {
                    tempname = m_sLogFileNames[i];
                    if (m_bChatLogDateSplit)
                    {
                        // append date instead of $d if applicable
                        size_t dpos = tempname.find("$d");
                        if (dpos != tempname.npos)
                        {
                            tempname.replace(dpos, 2, &dstr[0], 10);
                        }
                    }
                    files[i] = fopen((m_sLogsDir + tempname).c_str(), "a+b");
                    if (m_bChatLogUTFHeader && files[i] && ftell(files[i]) == 0)
                        fputs("\xEF\xBB\xBF", files[i]);
                }
            }
        }
    }

    // initialize innormative log
    if (m_bLexicsCutterEnable)
    {
        if (m_sInnormativeFileName != "")
        {
            tempname = m_sInnormativeFileName;
            if (m_bChatLogDateSplit)
            {
                // append date instead of $d if applicable
                size_t dpos = tempname.find("$d");
                if (dpos != tempname.npos)
                {
                    tempname.replace(dpos, 2, &dstr[0], 10);
                }
            }
            f_innormative = fopen((m_sLogsDir + tempname).c_str(), "a+b");
            if (m_bChatLogUTFHeader && f_innormative && (ftell(f_innormative) == 0))
                fputs("\xEF\xBB\xBF", f_innormative);
        }
    }
}

void ChatLog::CloseAllFiles()
{
    for (uint8 i = 0; i < CHATLOG_CHAT_TYPES_COUNT; ++i)
    {
        if (files[i])
        {
            for (uint8 j = i + 1; j < CHATLOG_CHAT_TYPES_COUNT; ++j)
            {
                if (files[j] == files[i])
                    files[j] = NULL;
            }

            fclose(files[i]);
            files[i] = NULL;
        }
    }

    if (f_innormative)
    {
        fclose(f_innormative);
        f_innormative = NULL;
    }
}

void ChatLog::CheckDateSwitch()
{
    if (m_bChatLogDateSplit)
    {
        time_t t = time(NULL);
        tm* aTm = localtime(&t);
        if (lastday != aTm->tm_mday)
        {
            // date switched
            CloseAllFiles();
            OpenAllFiles();
            WriteInitStamps();
        }
    }
}

void ChatLog::WriteInitStamps()
{
    if (!m_bLexicsCutterEnable && m_uiChatLogMethod != CHAT_LOG_METHOD_FILE)
        return;

    // remember date
    time_t t = time(NULL);
    tm* aTm = localtime(&t);
    lastday = aTm->tm_mday;

    if (files[CHAT_LOG_CHAT])
    {
        OutTimestamp(files[CHAT_LOG_CHAT]);
        fprintf(files[CHAT_LOG_CHAT], "%s", "[SYSTEM] Chat Log Initialized\n");
    }
    if (files[CHAT_LOG_PARTY])
    {
        OutTimestamp(files[CHAT_LOG_PARTY]);
        fprintf(files[CHAT_LOG_PARTY], "%s", "[SYSTEM] Party Chat Log Initialized\n");
    }
    if (files[CHAT_LOG_GUILD])
    {
        OutTimestamp(files[CHAT_LOG_GUILD]);
        fprintf(files[CHAT_LOG_GUILD], "%s", "[SYSTEM] Guild Chat Log Initialized\n");
    }
    if (files[CHAT_LOG_WHISPER])
    {
        OutTimestamp(files[CHAT_LOG_WHISPER]);
        fprintf(files[CHAT_LOG_WHISPER], "%s", "[SYSTEM] Whisper Log Initialized\n");
    }
    if (files[CHAT_LOG_CHANNEL])
    {
        OutTimestamp(files[CHAT_LOG_CHANNEL]);
        fprintf(files[CHAT_LOG_CHANNEL], "%s", "[SYSTEM] Chat Channels Log Initialized\n");
    }
    if (files[CHAT_LOG_RAID])
    {
        OutTimestamp(files[CHAT_LOG_RAID]);
        fprintf(files[CHAT_LOG_RAID], "%s", "[SYSTEM] Raid Party Chat Log Initialized\n");
    }

    if (f_innormative)
    {
        OutTimestamp(f_innormative);
        fprintf(f_innormative, "%s", "[SYSTEM] Innormative Lexics Log Initialized\n");
    }
}

void ChatLog::OutTimestamp(FILE* file)
{
    time_t t = time(NULL);
    tm* aTm = localtime(&t);
    fprintf(file, "%-4d-%02d-%02d %02d:%02d:%02d ", aTm->tm_year + 1900, aTm->tm_mon + 1, aTm->tm_mday, aTm->tm_hour, aTm->tm_min, aTm->tm_sec);
}

void ChatLog::ChatBadLexicsAction(Player* player, std::string& msg)
{
    // logging
    std::string log_str = "";

    log_str.append("[");
    log_str.append(player->GetName());
    log_str.append("] ");

    log_str.append(msg);

    log_str.append("\n");

    if (m_bLexicsCutterScreenLog)
        printf("<INNORMATIVE!> %s", log_str.c_str());

    if (f_innormative)
    {
        OutTimestamp(f_innormative);
        fprintf(f_innormative, "%s", log_str.c_str());
        fflush(f_innormative);
    }

    // cutting innormative lexics
    if (m_bLexicsCutterInnormativeCut)
    {
        msg = m_sLexicsCutterCutReplacement;
    }

    if (!player || !player->GetSession())
        return;

    if (m_bLexicsCutterNoActionOnGM && player->GetSession()->GetSecurity())
        return;

    switch (m_iLexicsCutterAction)
    {
        case LEXICS_ACTION_SHEEP:
        {
            // sheep me, yeah, yeah, sheep me
            player->_AddAura(118, m_iLexicsCutterActionDuration);
            break;
        }
        case LEXICS_ACTION_STUN:
        {
            // stunned surprised
            player->_AddAura(13005, m_iLexicsCutterActionDuration);
            break;
        }
        case LEXICS_ACTION_DIE:
        {
            // oops, kicked the bucket
            player->KillSelf();
            break;
        }
        case LEXICS_ACTION_DRAIN:
        {
            // living corpse :)
            player->KillSelf(5);
            break;
        }
        case LEXICS_ACTION_SILENCE:
        {
            // glue the mouth
            time_t mutetime = time(NULL) + (int) (m_iLexicsCutterActionDuration / 1000);
            player->GetSession()->m_muteTime = mutetime;
            break;
        }
        case LEXICS_ACTION_STUCK:
        {
            // yo, the Matrix has had you :) [by KAPATEJIb]
            player->_AddAura(23312, m_iLexicsCutterActionDuration);
            break;
        }
        case LEXICS_ACTION_SICKNESS:
        {
            // for absence of censorship, there is punishment [by Koshei]
            player->_AddAura(15007, m_iLexicsCutterActionDuration);
            break;
        }
        case LEXICS_ACTION_SHEAR:
        {
            // Lord Illidan to watch you [by Koshei]
            player->_AddAura(41032, m_iLexicsCutterActionDuration);
            break;
        }
        case LEXICS_ACTION_LOG:
        default:
            // no action except logging
            break;
    }
}
