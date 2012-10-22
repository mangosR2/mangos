#pragma once

#include "../Action.h"

namespace ai
{
    class AcceptInvitationAction : public Action {
    public:
        AcceptInvitationAction(PlayerbotAI* ai) : Action(ai, "accept invitation") {}

        virtual bool Execute(Event event)
        {
            Group* grp = bot->GetGroupInvite();
            if (!grp)
                return false;

            Player* inviter = sObjectMgr.GetPlayer(grp->GetLeaderGuid());
            if (!inviter)
                return false;

            WorldPacket p;
            uint32 roles_mask = 0;
            p << roles_mask;

            if (inviter != master) {
                bot->GetSession()->HandleGroupDeclineOpcode(p);
                return false;
            }

            if (((int)bot->getLevel() - (int)inviter->getLevel() > 5 && master->GetRandomPlayerbotMgr()->IsRandomBot(bot)) ||
                    inviter != master) {
                WorldPacket data( SMSG_GROUP_DECLINE, 10 );             // guess size
                data << bot->GetName();
                inviter->GetSession()->SendPacket(&data);
                bot->UninviteFromGroup();
                ai->TellMaster("I'm kind of busy now");
                return false;
            }

            bot->GetSession()->HandleGroupAcceptOpcode(p);

            ai->ResetStrategies();
            ai->TellMaster("Hello");
            return true;
        }
    };

}
