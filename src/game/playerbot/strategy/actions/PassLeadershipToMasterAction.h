#pragma once

#include "../Action.h"

namespace ai
{
    class PassLeadershipToMasterAction : public Action {
    public:
        PassLeadershipToMasterAction(PlayerbotAI* ai) : Action(ai, "pass leadership to master") {}

        virtual bool Execute(Event event)
        {
            
            
            WorldPacket &p = event.getPacket();

            string name;
            p >> name;
            if (bot->GetGroup() && name == bot->GetName())
            {
                if (bot->GetGroup()->IsMember(master->GetObjectGuid()))
                {
                    p.resize(8);
                    p << master->GetObjectGuid();
                    bot->GetSession()->HandleGroupSetLeaderOpcode(p);
                    return true;
                }
            }

            return false;
        }
    };

}