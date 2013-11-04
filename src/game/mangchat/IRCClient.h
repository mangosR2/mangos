/*
 * MangChat for MaNGOS, the open source MMORPG-server
 *
 * This Program Is Free Software; You Can Redistribute It And/Or Modify It Under The
 * Terms Of The GNU General Public License
 *
 * Written and Developed by Cybrax <cybraxvd@gmail.com>, |Death| <death@hell360.net>,
 * Lice <lice@yeuxverts.net>, Dj_baby, Sanaell, Tase, Shinzon <shinzon@wowgollum.com>,
 * Xeross, 3raZar3, the orangevirus team <www.orangevir.us>, ...
 *
 * With Help And Support From The MaNGOS Project Community.
 * PLEASE RETAIN THE COPYRIGHT OF THE AUTHORS.
 */

#ifndef _IRC_CLIENT_H
#define _IRC_CLIENT_H

#include "Policies/Singleton.h"
#include "../Player.h"
#include "IRCLog.h"
#include "IRCCmd.h"

using namespace std;
// The maximum ammount of channels used, must be >= config option
#define MAX_CONF_CHANNELS 10
#define MAX_CHAT_LINES 10

// let scripts know we have mangchat
#define MANGCHAT_INSTALLED

// CLINES is used for the default chatlines
// By using the GetChatLine function its easier and faster
// to receieve the line you need.
enum CLINES
{
    IRC_WOW = 0,
    WOW_IRC = 1,
    JOIN_WOW = 2,
    JOIN_IRC = 3,
    LEAVE_WOW = 4,
    LEAVE_IRC = 5,
    CHANGE_NICK = 6
};

// CACTION is used by the Handle_WoW_Channel function
// this function is called in channel.h when a player
// joins or leave a channel inside the client.
enum CACTION
{
    CHANNEL_JOIN,
    CHANNEL_LEAVE,
};

enum script_Names
{
    MCS_Players_Online  = 0,
};

// IRCClient main class
class IRCClient : public ACE_Based::Runnable
{
    public:
        IRCClient();
        ~IRCClient();
        // ZThread Entry
        void run();

        // AH Function
        void AHFunc(uint64 itmid, std::string itmnme, std::string plname);

        //NOTE: Removed "BeenToGMI" due to back overflows caused with new packet structure (Shinzon)
        //bool BeenToGMI(float posx, float posy, std::string player, std::string from);

        // IRCClient active
        bool    Active;
        // Connected to IRC
        bool    Connected;
        // Send data to IRC, in addition the endline is added \n
        bool    SendIRC(std::string data);
        // This function is called in ChatHandler.cpp and processes the chat from game to IRC
        void    Send_WoW_IRC(Player *plr, std::string Channel, std::string Msg);
        // Sends a message to all players on the specified channel
        void    Send_WoW_Channel(const char *channel, std::string chat);
        // Send a system message to all players
        void    Send_WoW_System(std::string Message);
        // Send a message to the specified IRC channel
        void    Send_IRC_Channel(std::string sChannel, std::string sMsg, bool NoPrefix = false, std::string nType = "PRIVMSG");
        // Sends a message to all IRC Channels
        void    Send_IRC_Channels(std::string sMsg);
        std::string MakeMsg(std::string msg, std::string var, std::string val)
        {
            std::size_t start = msg.find(var);
            if (start != std::string::npos)
                msg.replace(start, var.length(), val);
            return msg;
        }
        void    Send_WoW_Player(string sPlayer, string sMsg);
        void    Send_WoW_Player(Player *plr, string sMsg);

        // This function is called in Channel.cpp and processes Join/leave messages
        void    Handle_WoW_Channel(std::string Channel, Player *plr, int nAction);
        void ResetIRC();

        void AutoJoinChannel(Player *plr);

        bool Script_Lock[5];
        bool _AmiOp;

        string _Mver;

        // BotMask Options
        int Botmask;
        // Status Channel
        int Status;
        // Announce Channel
        int anchn;
        int autoanc;
        // IRC Channel count
        int _chan_count;
        // IRC Channel list
        // Array to store our IRC channels
        // each element will corrospond
        // with _wow_chan array below.
        std::string _irc_chan[MAX_CONF_CHANNELS];
        // Game Channel list
        std::string _wow_chan[MAX_CONF_CHANNELS];
        // AutoJoin Options
        int ajoin;
        string ajchan;
        // Online Command Max Results
        int onlrslt;
        // Channel OnJoin/Restart/Kick Messages
        string  JoinMsg;
        string  RstMsg;
        string  kikmsg;
        // Misc Options
        string  ojGM[SEC_CONSOLE];
        string  logfile;
        int     games;
        int     gmlog;
        // IRC Commands Security Level
        int     CACCT;
        int     CBAN;
        int     CCHAN;
        int     CCHAR;
        int     CFUN;
        int     CHELP;
        int     CINCHAN;
        int     CINFO;
        int     CITEM;
        int     CJAIL;
        int     CKICK;
        int     _KILL;
        int     CLEVEL;
        int     CLOOKUP;
        int     CMONEY;
        int     CMUTE;
        int     CONLINE;
        int     CPM;
        int     CRESTART;
        int     CREVIVE;
        int     CSAVEALL;
        int     CSHUTDOWN;
        int     CSPELL;
        int     CSYSMSG;
        int     CTELE;
        int     CTOP;
        int     CWHO;
        // BotMask
        int     BOTMASK;
        // Max connect attempt
        int     _MCA;
        // Auto rejoin when kicked from irc
        int     _autojoinkick;
        // IRC Command prefix
        string  _cmd_prefx;
        int _op_gm;
        int _op_gm_lev;

        string  GetChatLine(int nItem);

        int _Max_Script_Inst;
        // MAX_SCRIPT_INST

        IRCLog iLog;

        // Load MangChat configuration file
        bool    LoadConfig();
        void    SetCfgFile(char const* cfgfile);

        std::string* GetNick() {return &_Nick; }

    private:
        // Socket indentifier
        int     SOCKET;
        fd_set  sfdset;

        // Initialize socket library
        bool    InitSock();
        // Connect to IRC Server
        bool    Connect(const char *cHost, int nPort);
        // Login to IRC Server
        bool    Login(std::string sNick, std::string sUser, std::string sPass);
        // Send raw data to IRC
        bool    SendData(const char *data);
        // Disconnect from IRC and cleanup socket
        void    Disconnect();
        // Processes the data receieved from IRC
        void    Handle_IRC(std::string sData);
        // Receieves data from the socket.
        void    SockRecv();
        // the mangchat configuration file
        char const* CfgFile;
        // Array that contains our chatlines from the conf file
        string  ILINES[MAX_CHAT_LINES];


        string  _Host;              // IRC Server host
        int     _Port;              // IRC Server Port
        string  _User;              // IRC Username
        string  _Pass;              // IRC Password
        string  _Nick;              // IRC Nickname

        int _Auth;                  // Authentication type
        string _Auth_Nick;
        string  _ICC;               // IRC Connect code

        string  _defchan;           // IRC Default channel
        int _ldefc;                 // IRC Leave Default channel
        int _wct;                   // Wait Connect Time
};
#endif
#define sIRC MaNGOS::Singleton<IRCClient>::Instance()
