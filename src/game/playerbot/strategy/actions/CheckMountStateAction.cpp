#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "CheckMountStateAction.h"

using namespace ai;

uint64 extractGuid(WorldPacket& packet);

bool CheckMountStateAction::Execute(Event event)
{
    Player* master = GetMaster();
    if (!bot->GetGroup() || !master)
        return false;

    if (bot->IsTaxiFlying())
        return false;

    if (master->IsMounted() && !bot->IsMounted())
    {
        if (!master->GetAurasByType(SPELL_AURA_MOUNTED).empty())
        {
            return Mount();
        }
    }
    else if (!master->IsMounted() && bot->IsMounted())
    {
        WorldPacket emptyPacket;
        bot->GetSession()->HandleCancelMountAuraOpcode(emptyPacket);
        return true;
    }
    return false;
}


bool CheckMountStateAction::Mount()
{
    Player* master = GetMaster();
    ai->RemoveShapeshift();

    const SpellEntry* masterSpell = master->GetAurasByType(SPELL_AURA_MOUNTED).front()->GetSpellProto();
    int32 masterSpeed = max(masterSpell->EffectBasePoints[1], masterSpell->EffectBasePoints[2]);

    map<uint32, map<int32, vector<uint32> > > allSpells;
    for(PlayerSpellMap::iterator itr = bot->GetSpellMap().begin(); itr != bot->GetSpellMap().end(); ++itr)
    {
        uint32 spellId = itr->first;
        if(itr->second.state == PLAYERSPELL_REMOVED || itr->second.disabled || IsPassiveSpell(spellId))
            continue;

        const SpellEntry* spellInfo = sSpellStore.LookupEntry(spellId);
        if (!spellInfo || spellInfo->EffectApplyAuraName[0] != SPELL_AURA_MOUNTED)
            continue;

        int32 effect = max(spellInfo->EffectBasePoints[1], spellInfo->EffectBasePoints[2]);
        if (effect < masterSpeed)
            continue;

        uint32 index = (spellInfo->EffectApplyAuraName[1] == SPELL_AURA_MOD_FLIGHT_SPEED_MOUNTED ||
                spellInfo->EffectApplyAuraName[2] == SPELL_AURA_MOD_FLIGHT_SPEED_MOUNTED) ? 1 : 0;
        allSpells[index][effect].push_back(spellId);
    }

    int masterMountType = (masterSpell->EffectApplyAuraName[1] == SPELL_AURA_MOD_FLIGHT_SPEED_MOUNTED ||
            masterSpell->EffectApplyAuraName[2] == SPELL_AURA_MOD_FLIGHT_SPEED_MOUNTED) ? 1 : 0;

    map<int32, vector<uint32> >& spells = allSpells[masterMountType];
    for (map<int32,vector<uint32> >::iterator i = spells.begin(); i != spells.end(); ++i)
    {
		vector<uint32>& ids = i->second;
        int index = urand(0, ids.size() - 1);
        if (index >= ids.size())
            continue;

        ai->CastSpell(ids[index], bot);
        return true;
    }

    return false;
}
