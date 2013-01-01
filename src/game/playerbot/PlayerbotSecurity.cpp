#include "Config/Config.h"
#include "../pchdef.h"
#include "PlayerbotMgr.h"
#include "playerbot.h"
#include "PlayerbotAIConfig.h"
#include "PlayerbotAI.h"
#include "ChatHelper.h"

PlayerbotSecurity::PlayerbotSecurity(Player* const master, Player* const bot) : master(master), bot(bot)
{
    if (bot)
        account = sObjectMgr.GetPlayerAccountIdByGUID(bot->GetObjectGuid());
}

PlayerbotSecurityLevel PlayerbotSecurity::LevelFor(Player* from)
{
    if (!from)
        from = master;

    if (from != master)
        return PLAYERBOT_SECURITY_DENY_ALL;

    if (from->GetPlayerbotAI())
        return PLAYERBOT_SECURITY_DENY_ALL;

    if (master->GetSession()->GetSecurity() >= SEC_GAMEMASTER)
        return PLAYERBOT_SECURITY_ALLOW_ALL;

    if (sPlayerbotAIConfig.IsInRandomAccountList(account))
    {
        if (!from->GetRandomPlayerbotMgr() || !from->GetRandomPlayerbotMgr()->IsRandomBot(bot))
            return PLAYERBOT_SECURITY_DENY_ALL;

        if (bot->GetPlayerbotAI()->IsOpposing(master))
            return PLAYERBOT_SECURITY_DENY_ALL;

        Group* group = master->GetGroup();
        if (group)
        {
            for (GroupReference *gref = group->GetFirstMember(); gref; gref = gref->next())
            {
                Player* player = gref->getSource();
                if(player == master)
                    continue;

                if (player == bot)
                    return PLAYERBOT_SECURITY_ALLOW_ALL;
            }
        }

        if ((int)bot->getLevel() - (int)from->getLevel() > 5)
            return PLAYERBOT_SECURITY_TALK;

        int botGS = (int)bot->GetEquipGearScore(false, false);
        int fromGS = (int)from->GetEquipGearScore(false, false);
        if (botGS && bot->getLevel() > 15 && 100 * (botGS - fromGS) / botGS >= (10 + (91 - (int)bot->getLevel()) / 4))
            return PLAYERBOT_SECURITY_TALK;

        if (bot->isDead())
            return PLAYERBOT_SECURITY_TALK;

        if (!group)
            return PLAYERBOT_SECURITY_INVITE;

        if (group->IsFull())
            return PLAYERBOT_SECURITY_TALK;

        return PLAYERBOT_SECURITY_INVITE;
    }

    return PLAYERBOT_SECURITY_ALLOW_ALL;
}

bool PlayerbotSecurity::CheckLevelFor(PlayerbotSecurityLevel level, bool silent, Player* from)
{
    if (!from)
        from = master;

    PlayerbotSecurityLevel realLevel = LevelFor(from);
    if (realLevel >= level)
        return true;

    if (silent || from->GetPlayerbotAI())
        return false;

    if (bot->GetPlayerbotAI() && bot->GetPlayerbotAI()->IsOpposing(master) && master->GetSession()->GetSecurity() < SEC_GAMEMASTER)
        return false;

    ostringstream out;
    switch (realLevel)
    {
    case PLAYERBOT_SECURITY_DENY_ALL:
        out << "I'm kind of busy now";
        break;
    case PLAYERBOT_SECURITY_TALK:
        out << "I can't do that";
        break;
    case PLAYERBOT_SECURITY_INVITE:
        out << "Invite me to your group first";
        break;
    }

    WorldPacket data(SMSG_MESSAGECHAT, 1024);
    bot->BuildPlayerChat(&data, CHAT_MSG_WHISPER, out.str().c_str(), LANG_UNIVERSAL);
    from->GetSession()->SendPacket(&data);

    return false;
}
