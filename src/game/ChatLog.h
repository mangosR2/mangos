/*
 * Copyright (C) 2005,2006,2007 MaNGOS <http://www.mangosproject.org/>
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

#ifndef MANGOSSERVER_CHATLOG_H
#define MANGOSSERVER_CHATLOG_H

#include "SharedDefines.h"
#include "ChatLexicsCutter.h"
#include "ObjectMgr.h"
#include "Policies/Singleton.h"

enum ChatLogMethod
{
    CHAT_LOG_METHOD_NONE = 0,
    CHAT_LOG_METHOD_FILE = 1,
    CHAT_LOG_METHOD_SQL  = 2
};

enum ChatLogFiles
{
    CHAT_LOG_CHAT = 0,
    CHAT_LOG_PARTY,
    CHAT_LOG_GUILD,
    CHAT_LOG_WHISPER,
    CHAT_LOG_CHANNEL,
    CHAT_LOG_RAID,
    CHAT_LOG_BATTLEGROUND,
    CHATLOG_CHAT_TYPES_COUNT
};

enum LexicsActions
{
    LEXICS_ACTION_LOG      = 0,
    LEXICS_ACTION_SHEEP    = 1,
    LEXICS_ACTION_STUN     = 2,
    LEXICS_ACTION_DIE      = 3,
    LEXICS_ACTION_DRAIN    = 4,
    LEXICS_ACTION_SILENCE  = 5,
    LEXICS_ACTION_STUCK    = 6,
    LEXICS_ACTION_SICKNESS = 7,
    LEXICS_ACTION_SHEAR    = 8,
};

class ChatLog : public MaNGOS::Singleton<ChatLog, MaNGOS::ClassLevelLockable<ChatLog, ACE_Thread_Mutex> >
{
    public:
        ChatLog();
        ~ChatLog();

        void Initialize();
        void Uninitialize();

        void ChatMsg(Player* player, std::string& msg, uint32 type);
        void PartyMsg(Player* player, std::string& msg);
        void GuildMsg(Player* player, std::string& msg, bool officer);
        void WhisperMsg(Player* player, std::string& to, std::string& msg);
        void ChannelMsg(Player* player, std::string& channel, std::string& msg);
        void RaidMsg(Player* player, std::string& msg, uint32 type);
        void BattleGroundMsg(Player* player, std::string& msg, uint32 type);

        void ChatBadLexicsAction(Player* player, std::string& msg);

        std::string m_sLogsDir;

        ChatLogMethod m_uiChatLogMethod;

        bool m_bChatLogDateSplit;
        bool m_bChatLogUTFHeader;
        bool m_bChatLogIgnoreUnprintable;

        std::string m_sLogFileNames[CHATLOG_CHAT_TYPES_COUNT];
        bool m_bScreenFlag[CHATLOG_CHAT_TYPES_COUNT];
        bool m_bCutFlag[CHATLOG_CHAT_TYPES_COUNT];

        bool m_bLexicsCutterEnable;
        bool m_bLexicsCutterInnormativeCut;
        bool m_bLexicsCutterNoActionOnGM;
        bool m_bLexicsCutterScreenLog;
        std::string m_sLexicsCutterCutReplacement;
        int32 m_iLexicsCutterAction;
        int32 m_iLexicsCutterActionDuration;
        bool m_bLexicsCutterIgnoreMiddleSpaces;
        bool m_bLexicsCutterIgnoreLetterRepeat;

        std::string m_sAnalogsFileName;
        std::string m_sWordsFileName;
        std::string m_sInnormativeFileName;

    private:
        bool _ChatCommon(ChatLogFiles ChatType, Player* player, std::string& msg);

        FILE* files[CHATLOG_CHAT_TYPES_COUNT];

        int lastday;

        LexicsCutter* Lexics;

        FILE* f_innormative;

        void OpenAllFiles();
        void CloseAllFiles();
        void CheckDateSwitch();

        void WriteInitStamps();
        void OutTimestamp(FILE* file);
};

#define sChatLog MaNGOS::Singleton<ChatLog>::Instance()

#endif
