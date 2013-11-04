SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for IRC_Commands
-- ----------------------------
DROP TABLE IF EXISTS `IRC_Commands`;
CREATE TABLE `IRC_Commands` (
  `Command` varchar(10) NOT NULL default '',
  `Description` varchar(150) NOT NULL default '',
  `gmlevel` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Command`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='IRC Module System';

-- ----------------------------
-- Records
-- ----------------------------
INSERT INTO `IRC_Commands` VALUES
('acct', '[acct <Player> <(un)lock/mail/pass/rename>] : Perform Action To <Player> Account.', '3'),
('ban', '[ban <Player/IP> <ip/acct/unban/reason>] : Ban/Unban <Player>', '3'),
('chan', '[chan <op/deop/voice/devoice> <*IRC Nick*>] : Set Mode On Yourself, If <IRC Nick> Is Specified Then Set mode On Nick.', '3'),
('char', '[char <Player> <mailcheat/taxicheat/maxskill/setskill>] : Perform Action To Character.', '3'),
('fun', '[fun <Player> <Sound/Say>] : Do Selected Fun Action To <Player>.', '3'),
('help', '[help Command] : Use No Paramaters For List Of Available Commands.', '0'),
('inchan', '[inchan <Channel>] : Display Users In Selected In Game <Channel>', '0'),
('info', '[info] : Display Server Info. (Number Of Players Online/Max Since Last Restart/Uptime)', '0'),
('item', '[item <Player> <add> <ItemID/[ItemName]> <Amount>] : Additem To <Player>, Use <ItemID> Or <[Exact Item Name]>.', '3'),
('jail', '[jail <Player> <release/Reason>] : Jail Selected <Player> For <Reason>. Using release As <Reason> Releases Player.', '3'),
('kick', '[kick <Player> <Reason>] : Kick <Player> For <Reason>.', '3'),
('kill', '[kill <Player> <Reason>] : Kill <Player> For <Reason>.', '3'),
('level', '[level <Player> <NewLevel>] : Level <Player> To <NewLevel>. *Can Be Done Offline*', '3'),
('lookup', '[lookup <acct/char/creature/faction/go/item/quest/skill/spell/tele> <ID/Name>] : ', '3'),
('login', '[login <UserName> <Password>] : Login To MangChat Admin Mode.  (Must Be Done In A PM)', '0'),
('logout', '[logout] : Logout Of MangChat Admin Mode.', '0'),
('money', '[money <Player> <(-)Money>] : Give Money To <Player>, Use - To Take Money. *Can Be Done Offline*', '3'),
('mute', '[mute <Player> <release/TimeInMins> <Reason>] : Mute Player For Reason, For <TimeInMins>. Using release As Time Releases Player. *Can Be Done Offline*', '3'),
('online', '[online] : Display All Users Logged In Game.', '0'),
('pm', '[pm <Player> <Message>] : Whisper <Player> In WoW <Message>.', '3'),
('reload', '[reload] : Reload MangChat Config Options And Security Level From DataBase.', '3'),
('restart', '[restart] : Restart MangChat, NOT MaNGOS World Server Itself. Forces Reconnection To IRC Server.', '3'),
('revive', '[revive <Player>] : Revive <Player>.', '3'),
('saveall', '[saveall] : Forces MaNGOS To Save All Players.', '3'),
('shutdown', '[shutdown <TimeInSeconds>] : Shuts The Server Down In <TimeInSeconds>, Use 0 For Immediate Shut Down', '3'),
('spell', '[spell <Player> <Cast/Learn/UnLearn> <SpellID>] : Make <Player> <Learn> Or <UnLearn> A Spell, Or <Cast> A Spell On A <Player>.', '3'),
('tele', '[tele <Player> <l/c/r/to> <Loc.Name/MAPID X Y Z/Recall/Player>] : Teleport Player To Location, Coords, Or Another Player. (l-Location)(c-Coords)', '3'),
('ticket', '[ticket <list/read/respond/delete> <limit/name/all> <message>] : Manage GM tickets, respond with message', '3'),
('top', '[top <accttime/chartime/money> <limit>] : Display top stats for given option. Only GM Higher Than Config Option Can Use Limit.', '3'),
('who', '[who] : Displays Users Currently Logged In To MangChat.', '1'),
('sysmsg', '[sysmsg <a/n/e> <Message>] : Broadcasts A System Message. (a-Broadcast System Message)(n-Broadcast Notify Message)(e-Event Message)', 3);

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for IRC_Inchan
-- ----------------------------
DROP TABLE IF EXISTS `IRC_Inchan`;
CREATE TABLE `IRC_Inchan` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `name` varchar(12) NOT NULL default '',
  `channel` varchar(15) NOT NULL default '',
  PRIMARY KEY  (`guid`,`channel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='IRC Module System';

SET FOREIGN_KEY_CHECKS=0;

DELETE FROM `command` WHERE `name` = 'ircpm';
INSERT INTO `command` VALUES ('ircpm', '1', 'Syntax:.ircpm #nick #Nachricht\r\n\r\nSchicke eine Nachricht an eine Person im IRC.');

-- do not delete tickets, only flag them as "closed"

UPDATE `mangos_string` SET `content_default` = 'All tickets closed.', `content_loc3` = 'Alle Tickets geschlossen.' WHERE entry = 294;
UPDATE `mangos_string` SET `content_default` = 'Character %s ticket closed.', `content_loc3` = 'Ticket von Charakter %s wurde geschlossen.' WHERE entry = 295;
UPDATE `mangos_string` SET `content_default` = 'Ticket closed.', `content_loc3` = 'Ticket geschlossen.' WHERE entry = 296;
DELETE FROM `command` WHERE name = 'delticket';
INSERT INTO `command` 
	(`name`, `security`, `help`)
VALUES
	('closeticket',2,'Syntax: .closeticket all\r\n        .closeticket #num\r\n        .closeticket $character_name\r\n\rall to close all tickets at server, $character_name to close ticket of this character, #num to close ticket #num.');

