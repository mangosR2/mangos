#pragma once

#include "../Action.h"

namespace ai
{
    class LeaveGroupAction : public Action {
    public:
        LeaveGroupAction(PlayerbotAI* ai, string name = "leave") : Action(ai, name) {}

        virtual bool Execute(Event event)
        {
            if (!bot->GetGroup())
                return false;

            ai->TellMaster("Goodbye!", PLAYERBOT_SECURITY_TALK);

            WorldPacket p;
            string member = bot->GetName();
            p << uint32(PARTY_OP_LEAVE) << member << uint32(0);
            bot->GetSession()->HandleGroupDisbandOpcode(p);

            ai->ResetStrategies();

            if (master->GetRandomPlayerbotMgr()->IsRandomBot(bot))
                master->GetRandomPlayerbotMgr()->ScheduleTeleport(bot->GetGUIDLow());

            return true;
        }
    };

    class PartyCommandAction : public LeaveGroupAction {
    public:
        PartyCommandAction(PlayerbotAI* ai) : LeaveGroupAction(ai, "party command") {}

        virtual bool Execute(Event event)
        {
            WorldPacket& p = event.getPacket();
            p.rpos(0);
            uint32 operation;
            string member;

            p >> operation >> member;

            if (operation != PARTY_OP_LEAVE)
                return false;

            if (member == master->GetName())
                return LeaveGroupAction::Execute(event);

            return false;
        }
    };

    class UninviteAction : public LeaveGroupAction {
    public:
        UninviteAction(PlayerbotAI* ai) : LeaveGroupAction(ai, "party command") {}

        virtual bool Execute(Event event)
        {
            WorldPacket& p = event.getPacket();
            p.rpos(0);
            ObjectGuid guid;

            p >> guid;

            if (bot->GetObjectGuid() == guid)
                return LeaveGroupAction::Execute(event);

            return false;
        }
    };

}
