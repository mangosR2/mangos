#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "TellReputationAction.h"


using namespace ai;

bool TellReputationAction::Execute(Event event)
{
    Player* master = GetMaster();
    if (!master)
        return false;

    ObjectGuid selection = master->GetSelectionGuid();
    if (selection.IsEmpty())
        return false;

    Unit* unit = master->GetMap()->GetUnit(selection);
    if (!unit)
        return false;

    const FactionTemplateEntry *factionTemplate = unit->getFactionTemplateEntry();
    uint32 faction = factionTemplate->faction;
    const FactionEntry* entry = sFactionStore.LookupEntry(faction);
    int32 reputation = bot->GetReputationMgr().GetReputation(faction);

    ostringstream out;
    out << "Reputation with " << entry->name[0] << ": ";
    ReputationRank rank = bot->GetReputationMgr().GetRank(entry);
    switch (rank) {
        case REP_HATED:
            out << "hated";
            break;
        case REP_HOSTILE:
            out << "hostile";
            break;
        case REP_UNFRIENDLY:
            out << "unfriendly";
            break;
        case REP_NEUTRAL:
            out << "neutral";
            break;
        case REP_FRIENDLY:
            out << "friendly";
            break;
        case REP_HONORED:
            out << "honored";
            break;
        case REP_REVERED:
            out << "revered";
            break;
        case REP_EXALTED:
            out << "exalted";
            break;
        default:
            out << "unknown";
            break;
    }

    int32 base = ReputationMgr::Reputation_Cap + 1;
    for (int i = MAX_REPUTATION_RANK - 1; i >= rank; --i)
        base -= ReputationMgr::PointsInRank[i];

    out << " (" << (reputation - base) << "/" << ReputationMgr::PointsInRank[rank] << ")";
    ai->TellMaster(out);

    return true;
}
