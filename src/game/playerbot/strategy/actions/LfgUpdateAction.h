#pragma once

#include "../Action.h"

namespace ai
{
    class LfgUpdateAction : public Action {
    public:
        LfgUpdateAction(PlayerbotAI* ai) : Action(ai, "lfg update") {}
        virtual bool Execute(Event event);

    private:
        bool JoinProposal();
    };

    class LfgProposalAction : public Action {
    public:
        LfgProposalAction(PlayerbotAI* ai) : Action(ai, "lfg proposal") {}
        virtual bool Execute(Event event);

    private:
        bool JoinProposal();
    };

    class LfgLeaveAction : public Action {
    public:
        LfgLeaveAction(PlayerbotAI* ai) : Action(ai, "lfg leave") {}
        virtual bool Execute(Event event);
    };

}
