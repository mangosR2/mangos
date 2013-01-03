#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "LfgUpdateAction.h"
#include "../../AiFactory.h"
#include "../../PlayerbotAIConfig.h"


using namespace ai;

bool LfgUpdateAction::Execute(Event event)
{
    WorldPacket p(event.getPacket());
    p.rpos(0);

    uint8 updateType;
    p >> updateType;

    if (!sPlayerbotAIConfig.randomBotJoinLfg)
        return false;

    if (bot->isDead())
        return false;

    if (!master->GetRandomPlayerbotMgr()->IsRandomBot(bot))
        return false;

    if (ai->GetSecurity()->LevelFor(master) != PLAYERBOT_SECURITY_INVITE)
        return false;

    if (abs((int)master->getLevel() - (int)bot->getLevel()) > 2)
        return false;

    int botGS = (int)bot->GetEquipGearScore(false, false);
    int masterGS = (int)master->GetEquipGearScore(false, false);
    if (masterGS && bot->getLevel() > 15 && 100 * (masterGS - botGS) / masterGS >= (20 + (91 - (int)master->getLevel()) / 4))
        return false;

    switch (updateType)
    {
    case LFG_UPDATETYPE_JOIN_PROPOSAL:
        return JoinProposal();
    }

    return false;
}

bool LfgUpdateAction::JoinProposal()
{
    LFGPlayerState* state = bot->GetLFGPlayerState();
    if (!state || !master->GetLFGPlayerState())
        return false;

    state->SetRoles(LFG_ROLE_MASK_DAMAGE);

    int spec = AiFactory::GetPlayerSpecTab(bot);
    switch (bot->getClass())
    {
    case CLASS_DRUID:
        if (spec == 2)
            state->SetRoles(LFG_ROLE_MASK_HEALER);
        break;
    case CLASS_PALADIN:
        if (spec == 1)
            state->SetRoles(LFG_ROLE_MASK_TANK);
        if (spec == 0)
            state->SetRoles(LFG_ROLE_MASK_HEALER);
        break;
    case CLASS_PRIEST:
        if (spec != 2)
            state->SetRoles(LFG_ROLE_MASK_HEALER);
        break;
    case CLASS_SHAMAN:
        if (spec == 2)
            state->SetRoles(LFG_ROLE_MASK_HEALER);
        break;
    case CLASS_WARRIOR:
        if (spec == 2)
            state->SetRoles(LFG_ROLE_MASK_TANK);
        break;
    }

    state->SetType(master->GetLFGPlayerState()->GetType());
    state->SetComment("bot");
    state->SetDungeons(*master->GetLFGPlayerState()->GetDungeons());

    sLFGMgr.Join(bot);
    return true;
}

bool LfgProposalAction::Execute(Event event)
{
    WorldPacket p(event.getPacket());
    p.rpos(0);

    uint32 ID;
    bool   accept;
    p >> ID;
    p >> accept;

    sLFGMgr.UpdateProposal(ID, bot->GetObjectGuid(), accept);
	return true;
}

bool LfgLeaveAction::Execute(Event event)
{
    sLFGMgr.Leave(bot);
	return true;
}
