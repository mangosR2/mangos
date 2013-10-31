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

#include "IRCClient.h"
#include "IRCCmd.h"
#include "IRCFunc.h"
#include "../ObjectAccessor.h"
#include "../ObjectMgr.h"
#include "../../shared/WorldPacket.h"
#include "../ChannelMgr.h"
#include "../../shared/Config/Config.h"
#include "../Channel.h"
#include "../World.h"
#include "../Chat.h"

IRCCmd Command;
void IRCClient::Handle_IRC(std::string sData)
{
    sLog.outDebug(sData.c_str());
    // If first 5 chars are ERROR then something is wrong
    // either link is being closed, nickserv ghost command, etc...
    try
    {
        if(sData.substr(0, 5) == "ERROR")
        {
            Disconnect();
            return;
        }
        if(sData.substr(0, 4) == "PING")
        {
            // if the first 4 characters contain PING
            // the server is checking if we are still alive
            // sen back PONG back plus whatever the server send with it
            SendIRC("PONG " + sData.substr(4, sData.size() - 4));
        }
        else
        {
            // if the first line contains : its an irc message
            // such as private messages channel join etc.
            if(sData.substr(0, 1) == ":")
            {
                // find the spaces in the receieved line
                size_t p1 = sData.find(" ");
                size_t p2 = sData.find(" ", p1 + 1);
                // because the irc protocol uses simple spaces
                // to seperate data we can easy pick them out
                // since we know the position of the spaces
                std::string USR = sData.substr(1, p1 - 1);
                std::string CMD = sData.substr(p1 + 1, p2 - p1 - 1);
                // trasform the commands to lowercase to make sure they always match
                std::transform(CMD.begin(), CMD.end(), CMD.begin(), towlower);
                // Extract the username from the first part
                std::string szUser = GetUser(USR);
                // if we receieved the internet connect code
                // we know for sure that were in and we can
                // authenticate ourself.
                if(CMD == sIRC._ICC)
                {
                    // _Auth is defined in mangosd.conf (irc.auth)
                    // 0 do not authenticate
                    // 1 use nickserv
                    // 2 use quakenet
                    // aditionally you can provide you own authentication method here
                    switch(sIRC._Auth)
                    {
                        case 1:
                            SendIRC("PRIVMSG nickserv :IDENTIFY " + sIRC._Pass);
                            break;
                        case 2:
                            SendIRC("PRIVMSG nickserv :IDENTIFY " + sIRC._Auth_Nick + " " + sIRC._Pass);
                            break;
                        case 3:
                            SendIRC("PRIVMSG Q@CServe.quakenet.org :AUTH " + sIRC._Nick + " " + sIRC._Pass);
                            break;
                        case 4:
                            SendIRC("PRIVMSG Q@CServe.quakenet.org :AUTH " + sIRC._Auth_Nick + " " + sIRC._Pass);
                            break;
                    }
                    // if we join a default channel leave this now.
                    if(sIRC._ldefc==1)
                        SendIRC("PART #" + sIRC._defchan);
                    // Loop thru the channel array and send a command to join them on IRC.
                    for(int i=1;i < sIRC._chan_count + 1;i++)
                    {
                        SendIRC("JOIN #" + sIRC._irc_chan[i]);
                    }
                }
                // someone joined the channel this could be the bot or another user
                if(CMD == "join")
                {
                    size_t p = sData.find(":", p1);
                    std::string CHAN = sData.substr(p + 1, sData.size() - (p + 1 + isCRTerminated(sData)));
                    // if the user is us it means we join the channel
                    if ((szUser == sIRC._Nick) )
                    {
                        // its us that joined the channel
                        Send_IRC_Channel(CHAN, MakeMsg(MakeMsg(sIRC.JoinMsg, "$Ver", sIRC._Mver.c_str()), "$Trigger", sIRC._cmd_prefx.c_str()), true);
                    }
                    else
                    {
                        // if the user is not us its someone else that joins
                        // so we construct a message and send this to the clients.
                        // MangChat now uses Send_WoW_Channel to send to the client
                        // this makes MangChat handle the packets instead of previously the world.
                        if(sIRC.BOTMASK & 2)
                            Send_WoW_Channel(GetWoWChannel(CHAN).c_str(), IRCcol2WoW(MakeMsg(MakeMsg(GetChatLine(JOIN_IRC), "$Name", szUser), "$Channel", GetWoWChannel(CHAN))));
                    }
                }
                // someone on irc left or quit the channel
                if(CMD == "part" || CMD == "quit")
                {
                    size_t p3 = sData.find(" ", p2 + 1);
                    std::string CHAN = sData.substr(p2 + 1, p3 - (p2 - isCRTerminated(sData)));
                    // Logout IRC Nick From MangChat If User Leaves Or Quits IRC.
                    if(Command.IsLoggedIn(szUser))
                    {
                        _CDATA CDATA;
                        CDATA.USER      = szUser;
                        Command.Handle_Logout(&CDATA);
                    }
                    // Construct a message and inform the clients on the same channel.
				    if (sIRC.BOTMASK & 2)
                        Send_WoW_Channel(GetWoWChannel(CHAN).c_str(), IRCcol2WoW(MakeMsg(MakeMsg(GetChatLine(LEAVE_IRC), "$Name", szUser), "$Channel", GetWoWChannel(CHAN))));
                }
                // someone changed their nick
			    if (CMD == "nick" && (sIRC.BOTMASK & 128))
                {
                    MakeMsg(MakeMsg(GetChatLine(CHANGE_NICK), "$Name", szUser), "$NewName", sData.substr(sData.find(":", p2) + 1, sData.size()- isCRTerminated(sData)));
				    // If the user is logged in and changes their nick
				    // then we want to either log them out or update
				    // their nick in the bot. I chose to update the bots user list.
				    if(Command.IsLoggedIn(szUser))
				    {
                        std::string NewNick = sData.substr(sData.find(":", p2) + 1, isCRTerminated(sData));
					    // On freenode I noticed the server sends an extra character
					    // at the end of the string, so we need to erase the last
					    // character of the string. if you have a problem with getting
					    // the last letter of your nick erased, then remove the - 1.
					    NewNick.erase(NewNick.length() - 1, 1);

					    for(std::list<_client*>::iterator i=Command._CLIENTS.begin(); i!=Command._CLIENTS.end();i++)
                        {
                            if((*i)->Name == szUser)
                            {
					            (*i)->Name     = NewNick;
					            sIRC.Send_IRC_Channel(NewNick.c_str(), "I Noticed You Changed Your Nick, I Have Updated My Internal Database Accordingly.", true, "NOTICE");

							    // Figure why not output to the logfile, makes tracing problems easier.
							    sIRC.iLog.WriteLog(" %s : %s Changed Nick To: %s", sIRC.iLog.GetLogDateTimeStr().c_str(), szUser.c_str(), NewNick.c_str());
                            }
                        }
				    }

                }
                // someone was kicked from irc
                if (CMD == "kick")
                {
                    // extract the details
                    size_t p3 = sData.find(" ", p2 + 1);
                    size_t p4 = sData.find(" ", p3 + 1);
                    size_t p5 = sData.find(":", p4);
                    std::string CHAN = sData.substr(p2 + 1, p3 - p2 - 1);
                    std::string WHO = sData.substr(p3 + 1, p4 - (p3 + 1));
                    std::string BY = sData.substr(p4 + 1, sData.size() - (p4 + isCRTerminated(sData)));
                    // if the one kicked was us
                    if(WHO == sIRC._Nick)
                    {
                        // and autojoin is enabled
                        // return to the channel
                        if(sIRC._autojoinkick == 1)
                        {
                            SendIRC("JOIN " + CHAN);
                            Send_IRC_Channel(CHAN, sIRC.kikmsg, true);
                        }
                    }
                    else
                    {
                        // if it is not us who was kicked we need to inform the clients someone
                        // was removed from the channel
                        // construct a message and send it to the players.
                        Send_WoW_Channel(GetWoWChannel(CHAN).c_str(), "<IRC>[" + WHO + "]: Was Kicked From " + CHAN + " By: " + szUser);
                    }
                }
                // a private chat message was receieved.
                if(CMD == "privmsg" || CMD == "notice")
                {
                    // extract the values
                    size_t p = sData.find(" ", p2 + 1);
                    std::string FROM = sData.substr(p2 + 1, p - p2 - 1);
                    std::string CHAT = sData.substr(p + 2, sData.size() - (p + 2 + isCRTerminated(sData)));
                    // if this is our username it means we recieved a PM
                    if(FROM == sIRC._Nick)
                    {
                        if(CHAT.find("\001VERSION\001") < CHAT.size())
                        {
                            Send_IRC_Channel(szUser, MakeMsg("\001VERSION MangChat %s ©2008 |Death|\001", "%s" , sIRC._Mver.c_str()), true, "NOTICE");
                        }
                        // a pm is required for certain commands
                        // such as login. to validate the command
                        // we send it to the command class wich handles
                        // evrything else.
                        Command.IsValid(szUser, FROM, CHAT, CMD);
                    }
                    else
                    {
                        // if our name is not in it, it means we receieved chat on one of the channels
                        // magchat is in. the first thing we do is check if it is a command or not
                        if(!Command.IsValid(szUser, FROM, CHAT, CMD))
					    {
						    Send_WoW_Channel(GetWoWChannel(FROM).c_str(), IRCcol2WoW(MakeMsg(MakeMsg(GetChatLine(IRC_WOW), "$Name", szUser), "$Msg", CHAT)));
					    }
                        // if we indeed receieved a command we do not want to display this to the players
                        // so only incanse the isvalid command returns false it will be sent to all player.
                        // the isvalid function will automaitcly process the command on true.
                    }
                }
                if(CMD == "mode")
                {
                    // extract the mode details
                    size_t p3 = sData.find(" ", p2 + 1);
                    size_t p4 = sData.find(" ", p3 + 1);
                    size_t p5 = sData.find(" ", p4 + 1);
                    std::string CHAN = sData.substr(p2 + 1, p3 - p2 - 1);
                    std::string MODE = sData.substr(p3 + 1, p4 - p3 - 1);
                    std::string NICK = sData.substr(p4 + 1, p5 - p4 - 1);
				    bool _AmiOp;
				    _AmiOp = false;
				    //A mode was changed on us
				    if(NICK.c_str() == sIRC._Nick)
					    _AmiOp = true;

			    }
            }
        }
    }
    catch(std::out_of_range& e)
    {
    }
}

// This function is called in Channel.h
// based on nAction it will inform the people on
// irc when someone leaves one of the game channels.
// nAction is based on the struct CACTION
void IRCClient::Handle_WoW_Channel(std::string Channel, Player *plr, int nAction)
{
    // make sure that we are connected
    if (sIRC.Connected && (sIRC.BOTMASK & 1))
    {
        if(Channel_Valid(Channel))
        {
            std::string GMRank = "";
            std::string pname = plr->GetName();
            bool DoGMAnnounce = false;
            if (plr->GetSession()->GetSecurity() > 0 && (sIRC.BOTMASK & 8))
                DoGMAnnounce = true;
            if (plr->isGameMaster() && (sIRC.BOTMASK & 16))
                DoGMAnnounce = true;
            if(DoGMAnnounce)
            {
                uint16 gmLevel = plr->GetSession()->GetSecurity();
                GMRank = "\0037"+sIRC.ojGM[ gmLevel < SEC_CONSOLE ? gmLevel : SEC_CONSOLE];
            }
            std::string ChatTag = "";
            switch (plr->GetTeam())
            {
                case 67:ChatTag.append("\0034");break;      //horde
                case 469:ChatTag.append("\00312");break;    //alliance
            }
            std::string query = "INSERT INTO `IRC_Inchan` VALUES (%d,'"+pname+"','"+Channel+"')";
            std::string lchan = "DELETE FROM `IRC_Inchan` WHERE `guid` = %d AND `channel` = '"+Channel+"'";
            switch(nAction)
            {
                case CHANNEL_JOIN:
                    Send_IRC_Channel(GetIRCChannel(Channel), MakeMsg(MakeMsg(MakeMsg(GetChatLine(JOIN_WOW), "$Name", ChatTag + plr->GetName()), "$Channel", Channel), "$GM", GMRank));
                    WorldDatabase.PExecute(lchan.c_str(), plr->GetObjectGuid().GetCounter());
                    WorldDatabase.PExecute(query.c_str(), plr->GetObjectGuid().GetCounter());
                    break;
                case CHANNEL_LEAVE:
                    Send_IRC_Channel(GetIRCChannel(Channel), MakeMsg(MakeMsg(MakeMsg(GetChatLine(LEAVE_WOW), "$Name", ChatTag + plr->GetName()), "$Channel", Channel), "$GM", GMRank));
                    WorldDatabase.PExecute(lchan.c_str(), plr->GetObjectGuid().GetCounter());
                    break;
            }
        }
    }
}

// This function sends chat to a irc channel or user
// to prevent the # beeing appended to send a msg to a user
// set the NoPrefix to true
void IRCClient::Send_IRC_Channel(std::string sChannel, std::string sMsg, bool NoPrefix, std::string nType)
{
    std::string mType = "PRIVMSG";
	if(Command.MakeUpper(nType.c_str()) == "NOTICE")
		mType = "NOTICE";
    if(Command.MakeUpper(nType.c_str()) == "ERROR" && (sIRC.BOTMASK & 32))
		mType = "NOTICE";
    if(sIRC.Connected)
    {
        if(NoPrefix)
            SendIRC(mType + " " + sChannel + " :" + sMsg);
        else
            SendIRC(mType + " #" + sChannel + " :" + sMsg);
    }
}

// This function sends a message to all irc channels
// that mangchat has in its configuration
void IRCClient::Send_IRC_Channels(std::string sMsg)
{
    for(int i=1;i < sIRC._chan_count + 1;i++)
        Send_IRC_Channel(sIRC._irc_chan[i], sMsg);
}

// This function is called in ChatHandler.cpp, any channel chat from wow will come
// to this function, validates the channel and constructs a message that is send to IRC
void IRCClient::Send_WoW_IRC(Player *plr, std::string Channel, std::string Msg)
{
    // Check if the channel exist in our configuration
    if(Channel_Valid(Channel) && Msg.substr(0, 1) != ".")
        Send_IRC_Channel(GetIRCChannel(Channel), MakeMsgP(WOW_IRC, Msg, plr));
}

void IRCClient::Send_WoW_Player(std::string sPlayer, std::string sMsg)
{
    normalizePlayerName(sPlayer);
    if (Player* plr = ObjectAccessor::Instance().FindPlayerByName(sPlayer.c_str()))
        Send_WoW_Player(plr, sMsg);
}

void IRCClient::Send_WoW_Player(Player *plr, string sMsg)
{
    WorldPacket data(SMSG_MESSAGECHAT, 200);
    ChatHandler::FillMessageData(&data, plr->GetSession(), CHAT_MSG_SYSTEM, LANG_UNIVERSAL, NULL, plr->GetObjectGuid(), sMsg.c_str(), NULL);
    plr->GetSession()->SendPacket(&data);
}

// This function will construct and send a packet to all players
// on the given channel ingame. (previuosly found in world.cpp)
// it loops thru all sessions and checks if they are on the channel
// if so construct a packet and send it.
void IRCClient::Send_WoW_Channel(const char *channel, std::string chat)
{
    if(!(strlen(channel) > 0))
        return;

    // IRC-Protocol does not use a specific character encoding.
    // TODO: Autoencode to UTF8 (as used in the wow client)

    HashMapHolder<Player>::MapType& m = ObjectAccessor::Instance().GetPlayers();
    for(HashMapHolder<Player>::MapType::iterator itr = m.begin(); itr != m.end(); ++itr)
    {
        if (itr->second && itr->second->GetSession()->GetPlayer() && itr->second->GetSession()->GetPlayer()->IsInWorld())
        {
            if(ChannelMgr* cMgr = channelMgr(itr->second->GetSession()->GetPlayer()->GetTeam()))
            {
                if(Channel *chn = cMgr->GetChannel(channel, itr->second->GetSession()->GetPlayer()))
                {
                    WorldPacket data;
                    ChatHandler::FillMessageData(&data, NULL, CHAT_MSG_CHANNEL, LANG_UNIVERSAL, channel, ObjectGuid(), IRCcol2WoW(chat.c_str()).c_str(), NULL);
                    itr->second->GetSession()->SendPacket(&data);
                }
            }
        }
    }
}

void IRCClient::Send_WoW_System(std::string Message)
{
    HashMapHolder<Player>::MapType& m = ObjectAccessor::Instance().GetPlayers();
    for(HashMapHolder<Player>::MapType::iterator itr = m.begin(); itr != m.end(); ++itr)
    {
        if (itr->second && itr->second->GetSession()->GetPlayer() && itr->second->GetSession()->GetPlayer()->IsInWorld())
        {
            WorldPacket data;
            data.Initialize(SMSG_MESSAGECHAT, 100);
            data << (uint8)CHAT_MSG_SYSTEM;
            data << (uint32)LANG_UNIVERSAL;
            data << (uint64)0;
            data << (uint32)0;
            data << (uint64)0;
            data << (uint32) (strlen(Message.c_str()) + 1);
            data << Message.c_str();
            data << (uint8)0;
            itr->second->GetSession()->SendPacket(&data);
        }
    }
}
void IRCClient::ResetIRC()
{
    SendData("QUIT");
    Disconnect();
}

#define CHAT_INVITE_NOTICE 0x18

// this function should be called on player login WorldSession::HandlePlayerLogin
void IRCClient::AutoJoinChannel(Player *plr)
{
    if(ChannelMgr* cMgr = channelMgr(plr->GetTeam()))
    {
	    if(Channel *chn = cMgr->GetChannel(sIRC.ajchan,plr))
		    return;
    }

    //this will work if at least 1 player is logged in regrdless if he is on the channel or not
    // the first person that login empty server is the one with bad luck and wont be invited,
    // if at least 1 player is online the player will be inited to the chanel

    std::string m_name = sIRC.ajchan;
    WorldPacket data;
    data.Initialize(SMSG_CHANNEL_NOTIFY, 1+m_name.size()+1);
    data << uint8(CHAT_INVITE_NOTICE);
    data << m_name.c_str();

    HashMapHolder<Player>::MapType& m = ObjectAccessor::Instance().GetPlayers();
    for(HashMapHolder<Player>::MapType::iterator itr = m.begin(); itr != m.end(); ++itr)
    {
        if (itr->second && itr->second->GetSession()->GetPlayer() && itr->second->GetSession()->GetPlayer()->IsInWorld())
        {
            data << itr->second->GetObjectGuid();
            break;
        }
    }
    plr->GetSession()->SendPacket(&data);
}
