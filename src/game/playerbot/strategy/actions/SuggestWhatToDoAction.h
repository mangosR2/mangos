#pragma once

#include "../Action.h"

namespace ai
{
    class SuggestWhatToDoAction : public Action
    {
    public:
        SuggestWhatToDoAction(PlayerbotAI* ai);
        virtual bool Execute(Event event);

    private:
        typedef void (SuggestWhatToDoAction::*Suggestion) ();
        vector<Suggestion> suggestions;

    private:
        void instance();
        void specificQuest();
        void newQuest();
        void grindMaterials();
        void grindReputation();
        void nothing();
        void relax();
        void achievement();

        vector<uint32> GetIncompletedQuests();

    private:
        bool suggested;
    };
}
