#pragma once

#include "../Action.h"

namespace ai
{
    class InviteToGroupAction : public Action 
    {
    public:
        InviteToGroupAction(PlayerbotAI* ai) : Action(ai, "invite") {}

        virtual bool Execute(Event event)
        {
            WorldPacket p;
            uint32 roles_mask = 0;
            p << master->GetName();
            p << roles_mask;
            bot->GetSession()->HandleGroupInviteOpcode(p);

            return true;
        }
    };

}