#pragma once

#include "Trigger.h"

namespace ai
{
    class ExternalEventHelper {
    public:
        ExternalEventHelper(AiObjectContext* aiObjectContext) : aiObjectContext(aiObjectContext) {}

        bool ParseChatCommand(string command) 
        {
            if (HandleCommand(command, ""))
                return true;

            size_t i = string::npos;
            while (true)
            {
                size_t found = command.rfind(" ", i);
                if (found == string::npos || !found)
                    break;

                string name = command.substr(0, found);
                string param = command.substr(found + 1);

                i = found - 1;

                if (HandleCommand(name, param))
                    return true;
            }

            if (!ChatHelper::parseable(command))
                return false;

            HandleCommand("q", command);
            HandleCommand("c", command);
            HandleCommand("t", command);
            return true;
        }

        void HandlePacket(map<uint16, string> &handlers, const WorldPacket &packet)
        {
            uint8 opcode = packet.GetOpcode();
            string name = handlers[packet.GetOpcode()];
            if (name.empty())
                return;

            Trigger* trigger = aiObjectContext->GetTrigger(name);
            if (!trigger)
                return;

            WorldPacket p(packet);
            trigger->ExternalEvent(p);
        }

        bool HandleCommand(string name, string param)
        {
            Trigger* trigger = aiObjectContext->GetTrigger(name);
            if (!trigger)
                return false;

            trigger->ExternalEvent(param);
            return true;
        }

    private:
        AiObjectContext* aiObjectContext;
    };
}
