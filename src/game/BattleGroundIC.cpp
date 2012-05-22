/*
 * Copyright (C) 2005-2012 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "Player.h"
#include "BattleGround.h"
#include "BattleGroundIC.h"
#include "BattleGroundMgr.h"
#include "Language.h"
#include "WorldPacket.h"
#include "GameObject.h"
#include "ObjectMgr.h"
#include "Vehicle.h"
#include "Creature.h"
#include "MapManager.h"
#include "Transports.h"
#include "Object.h"
#include "Util.h"

/*
* BattleGround Isle of Conquest:
* TODO:
*   - Fix Vehicles on Transports; teleporting from ground onto transports; transports disappearing after relog
*   - Add scripts to bosses (Crushing Leap, Rage)
*   - Correct spawn of Siege Engine
*   - If a base is owned by a team and a vehicle from the base IS being used, it should not disappear if the opposite team caps the base
*   - Fix buffs from owning quarry / refinery for +15% siege dmg (they are given correctly, just dont work)
*/

BattleGroundIC::BattleGroundIC()
{
    m_StartMessageIds[BG_STARTING_EVENT_FIRST]  = LANG_BG_IC_START_TWO_MINUTES;
    m_StartMessageIds[BG_STARTING_EVENT_SECOND] = LANG_BG_IC_START_ONE_MINUTE;
    m_StartMessageIds[BG_STARTING_EVENT_THIRD]  = LANG_BG_IC_START_HALF_MINUTE;
    m_StartMessageIds[BG_STARTING_EVENT_FOURTH] = LANG_BG_IC_HAS_BEGUN;

    m_BgObjects.resize(BG_IC_MAXOBJ);
}

BattleGroundIC::~BattleGroundIC()
{
}

void BattleGroundIC::Reset()
{
    //call parent's class reset
    BattleGround::Reset();

    for (uint8 i = 0; i < BG_IC_GATE_MAX; i++)
        GateStatus[i] = BG_IC_GO_GATES_NORMAL;

    closeFortressDoorsTimer = CLOSE_DOORS_TIME;
    doorsClosed = false;        // main keep gates
    aOpen = false;              // gate to the alli boss
    hOpen = false;              // gate to the horde boss

    for (uint8 i = 0; i < PVP_TEAM_COUNT; ++i)
        m_TeamScores[i] = BG_IC_SCORE_INITIAL_POINTS;

    for (uint8 i = 0; i < BG_IC_NODES_MAX; ++i)
    {
        m_prevNodes[i] = 0;
        m_NodeTimers[i] = 0;
        m_BannerTimers[i].timer = 0;

        // all nodes except keeps are owned by neutral team at the beginning
        if (i < BG_IC_NODE_A_KEEP)
        {
            m_ActiveEvents[i] = BG_IC_NODE_TYPE_NEUTRAL;
            m_Nodes[i] = 0;
        }
    }

    // you get reinforcements/honor just for owning quarry and refinery
    for (uint8 node = BG_IC_NODE_QUARRY; node <= BG_IC_NODE_REFINERY; node++)
    {
        m_resource_Timer[node] = BG_IC_RESOURCE_TICK_TIMER;
    }

    m_ActiveEvents[BG_IC_NODE_A_KEEP] = BG_IC_NODE_STATUS_ALLY_OCCUPIED;
    m_ActiveEvents[BG_IC_NODE_H_KEEP] = BG_IC_NODE_STATUS_HORDE_OCCUPIED;
    m_Nodes[BG_IC_NODE_A_KEEP] = BG_IC_NODE_STATUS_ALLY_OCCUPIED;
    m_Nodes[BG_IC_NODE_H_KEEP] = BG_IC_NODE_STATUS_HORDE_OCCUPIED;

    SpawnEvent(IC_EVENT_ADD_TELEPORT, 0, true);
    SpawnEvent(IC_EVENT_ADD_VEH, 0, true);
    SpawnEvent(IC_EVENT_BOSS_H, 0, true);
    SpawnEvent(IC_EVENT_BOSS_A, 0, true);

    // spawn bosses and their guards just when one of the gates is destroyed, to prevent some abusing
    SpawnEvent(IC_EVENT_ADD_A_BOSS, 0, false);
    SpawnEvent(IC_EVENT_ADD_A_GUARDS, 0, false);
    SpawnEvent(IC_EVENT_ADD_H_BOSS, 0, false);
    SpawnEvent(IC_EVENT_ADD_H_GUARDS, 0, false);

    SpawnGates();

    gunshipHorde = NULL;
    gunshipAlliance = NULL;
}

void BattleGroundIC::SendTransportInit(Player* player)
{
    if (!gunshipAlliance || !gunshipHorde)
        return;

    UpdateData transData;

    gunshipAlliance->BuildCreateUpdateBlockForPlayer(&transData, player);
    gunshipHorde->BuildCreateUpdateBlockForPlayer(&transData, player);

    WorldPacket packet;

    transData.BuildPacket(&packet);
    player->GetSession()->SendPacket(&packet);
}

void BattleGroundIC::UpdateScore(TeamIndex teamIdx, int32 points )
{
    // note: to remove reinforcements points must be negative, for adding reinforcements points must be positive
    MANGOS_ASSERT( teamIdx == TEAM_INDEX_ALLIANCE || teamIdx == TEAM_INDEX_HORDE);
    m_TeamScores[teamIdx] += points;                      // m_TeamScores is int32 - so no problems here

    if (points < 0)
    {
        if (m_TeamScores[teamIdx] < 1)
        {
            m_TeamScores[teamIdx] = 0;
            // other team will win:
            EndBattleGround((teamIdx == TEAM_INDEX_ALLIANCE)? HORDE : ALLIANCE);
        }
    }
    // must be called here, else it could display a negative value
    UpdateWorldState(((teamIdx == TEAM_INDEX_HORDE) ? BG_TEAM_HORDE_REINFORC : BG_TEAM_ALLIANCE_REINFORC), m_TeamScores[teamIdx]);
}

void BattleGroundIC::Update(uint32 diff)
{
    BattleGround::Update(diff);

    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    if (!doorsClosed)
    {
        if (closeFortressDoorsTimer <= diff)
        {
            // correct visual of closed gates is at "damaged" flag
            for (int i = BG_IC_GO_T_ALLIANCE_GATE_1; i <= BG_IC_GO_T_HORDE_GATE_3; ++i)
                GetBGObject(i)->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_DAMAGED);

            for (int i = BG_IC_GO_T_ALLIANCE_WEST; i <= BG_IC_GO_T_HORDE_FRONT; ++i)
                DelObject(i);

            doorsClosed = true;
        } else closeFortressDoorsTimer -= diff;
    }

    for (int node = 0; node < BG_IC_NODES_MAX; ++node)
    {
        // 3 sec delay to spawn new banner instead previous despawned one
        if (m_BannerTimers[node].timer)
        {
            if (m_BannerTimers[node].timer > diff)
                m_BannerTimers[node].timer -= diff;
            else
            {
                m_BannerTimers[node].timer = 0;
                _CreateBanner(node, m_BannerTimers[node].type, m_BannerTimers[node].teamIndex, false);
            }
        }

        // 1-minute to occupy a node from contested state
        if (m_NodeTimers[node])
        {
            if (m_NodeTimers[node] > diff)
                m_NodeTimers[node] -= diff;
            else
            {
                m_NodeTimers[node] = 0;
                // Change from contested to occupied !
                uint8 teamIndex = m_Nodes[node]-1;
                m_prevNodes[node] = m_Nodes[node];
                m_Nodes[node] += 2;
                // create new occupied banner
                _CreateBanner(node, BG_IC_NODE_TYPE_OCCUPIED, teamIndex, true);
                _SendNodeUpdate(node);
                // Message to chatlog
                if (teamIndex == TEAM_INDEX_ALLIANCE)
                {
                    SendMessage2ToAll(LANG_BG_IC_NODE_TAKEN,CHAT_MSG_BG_SYSTEM_ALLIANCE,NULL,LANG_BG_ALLY,_GetNodeNameId(node));
                    PlaySoundToAll(BG_IC_SOUND_NODE_CAPTURED_ALLIANCE);
                }
                else
                {
                    SendMessage2ToAll(LANG_BG_IC_NODE_TAKEN,CHAT_MSG_BG_SYSTEM_HORDE,NULL,LANG_BG_HORDE,_GetNodeNameId(node));
                    PlaySoundToAll(BG_IC_SOUND_NODE_CAPTURED_HORDE);
                }

                // gunship starting
                if (node == BG_IC_NODE_HANGAR)
                    (teamIndex == TEAM_INDEX_ALLIANCE ? gunshipAlliance : gunshipHorde)->BuildStartMovePacket(GetBgMap());
            }
        }
    }

    // add a point every 45 secs to quarry/refinery owner
    for (uint8 node = BG_IC_NODE_QUARRY; node <= BG_IC_NODE_REFINERY; node++)
    {
        if (m_Nodes[node] >= BG_IC_NODE_TYPE_OCCUPIED)
        {
            if (m_resource_Timer[node] <= diff)
            {
                UpdateScore(TeamIndex(m_Nodes[node] - BG_IC_NODE_TYPE_OCCUPIED) , 1);
                RewardHonorToTeam(GetBonusHonorFromKill(1), (m_Nodes[node] - BG_IC_NODE_TYPE_OCCUPIED == 0 ? ALLIANCE : HORDE));
                m_resource_Timer[node] = BG_IC_RESOURCE_TICK_TIMER;
            }
            else
                m_resource_Timer[node] -= diff;
        }
    }
    HandleBuffs();
}

void BattleGroundIC::StartingEventCloseDoors()
{
}

void BattleGroundIC::StartingEventOpenDoors()
{
    OpenDoorEvent(BG_EVENT_DOOR);                        // used for activating teleport effects + opening tower gates
    for (int i = BG_IC_GO_T_ALLIANCE_WEST; i <= BG_IC_GO_T_HORDE_FRONT; ++i)
        DoorOpen(m_BgObjects[i]);

    // make teleporters clickable
    MakeInteractive(IC_EVENT_ADD_TELEPORT, 0, true);
}

void BattleGroundIC::AddPlayer(Player *plr)
{
    BattleGround::AddPlayer(plr);
    //create score and add it to map, default values are set in constructor
    BattleGroundICScore* sc = new BattleGroundICScore;

    m_PlayerScores[plr->GetObjectGuid()] = sc;

    SendTransportInit(plr);

    if (GetStatus() != STATUS_IN_PROGRESS)
        MakeInteractive(IC_EVENT_ADD_TELEPORT, 0, false);
    else
        // default behaviour of teleports is "clickable", so this could be also skipped
        MakeInteractive(IC_EVENT_ADD_TELEPORT, 0, true);
}

void BattleGroundIC::RemovePlayer(Player* plr)
{
    if (plr)
    {
        plr->RemoveAurasDueToSpell(SPELL_QUARRY);
        plr->RemoveAurasDueToSpell(SPELL_REFINERY);
    }
}

void BattleGroundIC::HandleAreaTrigger(Player * Source, uint32 Trigger)
{
    // this is wrong way to implement these things. On official it done by gameobject spell cast.
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    switch (Trigger)
    {
        case 5535:
            if (Source->GetTeam() == ALLIANCE && hOpen == false)
                Source->UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET, 68502);
            break;
        case 5555:
            if (Source->GetTeam() == HORDE && aOpen == false)
                Source->UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET, 68502);
            break;
        case 5536:
            break;
        default:
            sLog.outError("WARNING: Unhandled AreaTrigger in Battleground: %u", Trigger);
            Source->GetSession()->SendAreaTriggerMessage("Warning: Unhandled AreaTrigger in Battleground: %u", Trigger);
            break;
    }
}

/*  type: 0-neutral, 1-contested, 3-occupied
    teamIndex: 0-ally, 1-horde                        */
void BattleGroundIC::_CreateBanner(uint8 node, uint8 type, uint8 teamIndex, bool delay)
{
    // Just put it into the queue
    if (delay)
    {
        m_BannerTimers[node].timer = 2000;
        m_BannerTimers[node].type = type;
        m_BannerTimers[node].teamIndex = teamIndex;
        return;
    }

    // cause the node-type is in the generic form
    // please see in the headerfile for the ids
    if (type != BG_IC_NODE_TYPE_NEUTRAL)
        type += teamIndex;

    SpawnEvent(node, type, true);                           // will automaticly despawn other events
}

int32 BattleGroundIC::_GetNodeNameId(uint8 node)
{
    switch (node)
    {
        case BG_IC_NODE_DOCKS:    return LANG_BG_IC_NODE_DOCKS;
        case BG_IC_NODE_HANGAR:   return LANG_BG_IC_NODE_HANGAR;
        case BG_IC_NODE_WORKSHOP: return LANG_BG_IC_NODE_WORKSHOP;
        case BG_IC_NODE_QUARRY:   return LANG_BG_IC_NODE_QUARRY;
        case BG_IC_NODE_REFINERY: return LANG_BG_IC_NODE_REFINERY;
        case BG_IC_NODE_A_KEEP:   return LANG_BG_IC_ALLIANCE_KEEP;
        case BG_IC_NODE_H_KEEP:   return LANG_BG_IC_HORDE_KEEP;
        default:
            MANGOS_ASSERT(0);
            break;
    }
    return 0;
}

void BattleGroundIC::UpdatePlayerScore(Player* Source, uint32 type, uint32 value, bool doAddHonor)
{
    BattleGroundScoreMap::iterator itr = m_PlayerScores.find(Source->GetObjectGuid());

    if (itr == m_PlayerScores.end())                         // player not found...
        return;

    switch(type)
    {
        case SCORE_BASES_ASSAULTED:
            ((BattleGroundICScore*)itr->second)->BasesAssaulted += value;
            break;
        case SCORE_BASES_DEFENDED:
            ((BattleGroundICScore*)itr->second)->BasesDefended += value;
            break;
        default:
            BattleGround::UpdatePlayerScore(Source, type, value);
            break;
    }
}

void BattleGroundIC::FillInitialWorldStates(WorldPacket& data, uint32& count)
{
    FillInitialWorldState(data, count, BG_TEAM_ALLIANCE_REINFORC_SET, BG_TEAM_ALLIANCE_REINFORC_SET);
    FillInitialWorldState(data, count, BG_TEAM_HORDE_RENFORC_SET,     BG_TEAM_HORDE_RENFORC_SET);
    FillInitialWorldState(data, count, BG_TEAM_ALLIANCE_REINFORC,     m_TeamScores[TEAM_INDEX_ALLIANCE]);
    FillInitialWorldState(data, count, BG_TEAM_HORDE_REINFORC,        m_TeamScores[TEAM_INDEX_HORDE]);

    // Gate icons
    for (uint8 z = 0; z < BG_IC_GATE_MAX; ++z)
        FillInitialWorldState(data, count, BG_IC_GateStatus[z][GateStatus[z] == BG_IC_GO_GATES_DAMAGE ? 1 : 0], 1);

    // Node icons
    for (uint8 node = 0; node < BG_IC_NODES_MAX; ++node)
        FillInitialWorldState(data, count, BG_IC_OP_NODEICONS[node], m_Nodes[node] == 0);

    for (uint8 i = 0; i < BG_IC_NODES_MAX; ++i)
        for (uint8 j = 0; j < 4; j++)
            FillInitialWorldState(data, count, BG_IC_NodeWorldStates[i][j], m_Nodes[i] == (j + 1));
}

bool BattleGroundIC::SetupBattleGround()
{
    gunshipHorde = CreateTransport(GO_HORDE_GUNSHIP,TRANSPORT_PERIOD_TIME);
    gunshipAlliance = CreateTransport(GO_ALLIANCE_GUNSHIP,TRANSPORT_PERIOD_TIME);

    if (!gunshipAlliance || !gunshipHorde)
    {
        sLog.outError("Isle of Conquest: There was an error creating gunships!");
        return false;
    }

    //Send transport init packet to all player in map
    for (BattleGroundPlayerMap::const_iterator itr = GetPlayers().begin(); itr != GetPlayers().end();itr++)
    {
        if (Player* player = sObjectMgr.GetPlayer(itr->first))
            SendTransportInit(player);
    }

    return true;
}

void BattleGroundIC::SpawnGates()
{
    // is making arrays for spawning these worth it ?
    AddObject(BG_IC_GO_T_ALLIANCE_GATE_1, BG_IC_GO_ALLIANCE_GATE_1, BG_IC_GATELOCS[0][0], BG_IC_GATELOCS[0][1], BG_IC_GATELOCS[0][2], BG_IC_GATELOCS[0][3], 0.0f, 0.0f, 0.0f, 0.0f, RESPAWN_IMMEDIATELY);
    AddObject(BG_IC_GO_T_ALLIANCE_GATE_2, BG_IC_GO_ALLIANCE_GATE_2, BG_IC_GATELOCS[1][0], BG_IC_GATELOCS[1][1], BG_IC_GATELOCS[1][2], BG_IC_GATELOCS[1][3], 0.0f, 0.0f, 0.0f, 0.0f, RESPAWN_IMMEDIATELY);
    AddObject(BG_IC_GO_T_ALLIANCE_GATE_3, BG_IC_GO_ALLIANCE_GATE_3, BG_IC_GATELOCS[2][0], BG_IC_GATELOCS[2][1], BG_IC_GATELOCS[2][2], BG_IC_GATELOCS[2][3], 0.0f, 0.0f, 0.0f, 0.0f, RESPAWN_IMMEDIATELY);
    AddObject(BG_IC_GO_T_HORDE_GATE_1, BG_IC_GO_HORDE_GATE_1, BG_IC_GATELOCS[3][0], BG_IC_GATELOCS[3][1], BG_IC_GATELOCS[3][2], BG_IC_GATELOCS[3][3], 0.0f, 0.0f, 0.0f, 0.0f, RESPAWN_IMMEDIATELY);
    AddObject(BG_IC_GO_T_HORDE_GATE_2, BG_IC_GO_HORDE_GATE_2, BG_IC_GATELOCS[4][0], BG_IC_GATELOCS[4][1], BG_IC_GATELOCS[4][2], BG_IC_GATELOCS[4][3], 0.0f, 0.0f, 0.0f, 0.0f, RESPAWN_IMMEDIATELY);
    AddObject(BG_IC_GO_T_HORDE_GATE_3, BG_IC_GO_HORDE_GATE_3, BG_IC_GATELOCS[5][0], BG_IC_GATELOCS[5][1], BG_IC_GATELOCS[5][2], BG_IC_GATELOCS[5][3], 0.0f, 0.0f, 0.0f, 0.0f, RESPAWN_IMMEDIATELY);

    AddObject(BG_IC_GO_T_ALLIANCE_WEST, BG_IC_GO_ALLIANCE_PORT, BG_IC_GATELOCS[0][0], BG_IC_GATELOCS[0][1], BG_IC_GATELOCS[0][2], BG_IC_GATELOCS[0][3], 0.0f, 0.0f, 0.0f, 0.0f, RESPAWN_IMMEDIATELY);
    AddObject(BG_IC_GO_T_ALLIANCE_EAST, BG_IC_GO_ALLIANCE_PORT, BG_IC_GATELOCS[1][0], BG_IC_GATELOCS[1][1], BG_IC_GATELOCS[1][2], BG_IC_GATELOCS[1][3], 0.0f, 0.0f, 0.0f, 0.0f, RESPAWN_IMMEDIATELY);
    AddObject(BG_IC_GO_T_ALLIANCE_FRONT, BG_IC_GO_ALLIANCE_PORT, BG_IC_GATELOCS[2][0], BG_IC_GATELOCS[2][1], BG_IC_GATELOCS[2][2], BG_IC_GATELOCS[2][3], 0.0f, 0.0f, 0.0f, 0.0f, RESPAWN_IMMEDIATELY);
    AddObject(BG_IC_GO_T_HORDE_WEST, BG_IC_GO_HORDE_PORT, BG_IC_GATELOCS[3][0], BG_IC_GATELOCS[3][1], BG_IC_GATELOCS[3][2], BG_IC_GATELOCS[3][3], 0.0f, 0.0f, 0.0f, 0.0f, RESPAWN_IMMEDIATELY);
    AddObject(BG_IC_GO_T_HORDE_EAST, BG_IC_GO_HORDE_PORT, BG_IC_GATELOCS[4][0], BG_IC_GATELOCS[4][1], BG_IC_GATELOCS[4][2], BG_IC_GATELOCS[4][3], 0.0f, 0.0f, 0.0f, 0.0f, RESPAWN_IMMEDIATELY);
    AddObject(BG_IC_GO_T_HORDE_FRONT, BG_IC_GO_HORDE_PORT, BG_IC_GATELOCS[5][0], BG_IC_GATELOCS[5][1], BG_IC_GATELOCS[5][2], BG_IC_GATELOCS[5][3], 0.0f, 0.0f, 0.0f, 0.0f, RESPAWN_IMMEDIATELY);

    for (int i = 0; i < BG_IC_MAXOBJ; ++i)
        SpawnBGObject(m_BgObjects[i], RESPAWN_IMMEDIATELY);
}

void BattleGroundIC::HandleKillUnit(Creature *creature, Player *killer)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
       return;

    uint8 event1 = (sBattleGroundMgr.GetCreatureEventIndex(creature->GetGUIDLow())).event1;
    if (event1 == BG_EVENT_NONE)
        return;

    switch (event1)
    {
        case IC_EVENT_ADD_A_BOSS:
            RewardHonorToTeam(GetBonusHonorFromKill(BG_IC_KILL_BOSS), HORDE);
            EndBattleGround(HORDE);
            break;
        case IC_EVENT_ADD_H_BOSS:
            RewardHonorToTeam(GetBonusHonorFromKill(BG_IC_KILL_BOSS), ALLIANCE);
            EndBattleGround(ALLIANCE);
            break;
    }

    if (creature->IsVehicle())
        // must be killing blow
        killer->GetAchievementMgr().UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET, 68357);
}

void BattleGroundIC::HandleKillPlayer(Player* player, Player* killer)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    BattleGround::HandleKillPlayer(player, killer);
    UpdateScore(GetTeamIndex(player->GetTeam()), -1);
}

void BattleGroundIC::EndBattleGround(Team winner)
{
    //win reward
    if (winner)
    {
        RewardHonorToTeam(GetBonusHonorFromKill(1), winner);
        RewardXpToTeam(0, 0.8f, winner);
    }

    //complete map_end rewards (even if no team wins)
    RewardHonorToTeam(GetBonusHonorFromKill(2), HORDE);
    RewardHonorToTeam(GetBonusHonorFromKill(2), ALLIANCE);
    RewardXpToTeam(0, 0.8f, ALLIANCE);
    RewardXpToTeam(0, 0.8f, HORDE);

    BattleGround::EndBattleGround(winner);
}

void BattleGroundIC::_SendNodeUpdate(uint8 node)
{
    // Needed to prevent client from bugging
    UpdateWorldState(BG_IC_OP_NODEICONS[node], m_Nodes[node] == 0);

    // Send node owner state update to refresh map icons on client
    for (uint8 j = 0; j < 4; j++)
        UpdateWorldState(BG_IC_NodeWorldStates[node][j], m_Nodes[node] == (j + 1));

    if ((node == BG_IC_NODE_QUARRY) || (node == BG_IC_NODE_REFINERY))
    {
        if (m_Nodes[node] >= BG_IC_NODE_TYPE_OCCUPIED)
            m_resource_Timer[node] = BG_IC_RESOURCE_TICK_TIMER;
    }
}

void BattleGroundIC::EventPlayerClickedOnFlag(Player *source, GameObject* target_obj)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    uint8 event = (sBattleGroundMgr.GetGameObjectEventIndex(target_obj->GetGUIDLow())).event1;
    if (event >= BG_IC_NODES_MAX)                           // not a node
        return;

    BG_IC_Nodes node = BG_IC_Nodes(event);

    TeamIndex teamIndex = GetTeamIndex(source->GetTeam());

    // Check if player really could use this banner, not cheated
    if (!(m_Nodes[node] == 0 || teamIndex == m_Nodes[node] % 2))
        return;

    source->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_ENTER_PVP_COMBAT);
    uint32 sound = 0;

    // TODO in the following code we should restructure a bit to avoid
    // duplication (or maybe write functions?)
    // If node is neutral, change to contested
    if (m_Nodes[node] == BG_IC_NODE_TYPE_NEUTRAL)
    {
        UpdatePlayerScore(source, SCORE_BASES_ASSAULTED, 1);
        source->UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BG_OBJECTIVE_CAPTURE,1,245);
        m_prevNodes[node] = m_Nodes[node];
        m_Nodes[node] = teamIndex + 1;
        // create new contested banner
        _CreateBanner(node, BG_IC_NODE_TYPE_CONTESTED, teamIndex, true);
        _SendNodeUpdate(node);
        m_NodeTimers[node] = BG_IC_FLAG_CAPTURING_TIME;

        if (teamIndex == TEAM_INDEX_ALLIANCE)
            SendMessage2ToAll(LANG_BG_IC_NODE_CLAIMED,CHAT_MSG_BG_SYSTEM_ALLIANCE, source, _GetNodeNameId(node), LANG_BG_ALLY);
        else
            SendMessage2ToAll(LANG_BG_IC_NODE_CLAIMED,CHAT_MSG_BG_SYSTEM_HORDE, source, _GetNodeNameId(node), LANG_BG_HORDE);

        sound = BG_IC_SOUND_NODE_CLAIMED;
    }
    // If node is contested
    else if ((m_Nodes[node] == BG_IC_NODE_STATUS_ALLY_CONTESTED) || (m_Nodes[node] == BG_IC_NODE_STATUS_HORDE_CONTESTED))
    {
        // If last state is NOT occupied, change node to enemy-contested
        if (m_prevNodes[node] < BG_IC_NODE_TYPE_OCCUPIED)
        {
            UpdatePlayerScore(source, SCORE_BASES_ASSAULTED, 1);
            m_prevNodes[node] = m_Nodes[node];
            m_Nodes[node] = teamIndex + BG_IC_NODE_TYPE_CONTESTED;
            // create new contested banner
            _CreateBanner(node, BG_IC_NODE_TYPE_CONTESTED, teamIndex, true);
            _SendNodeUpdate(node);
            m_NodeTimers[node] = BG_IC_FLAG_CAPTURING_TIME;

            if (teamIndex == TEAM_INDEX_ALLIANCE)
                SendMessage2ToAll(LANG_BG_IC_NODE_ASSAULTED,CHAT_MSG_BG_SYSTEM_ALLIANCE, source, _GetNodeNameId(node));
            else
                SendMessage2ToAll(LANG_BG_IC_NODE_ASSAULTED,CHAT_MSG_BG_SYSTEM_HORDE, source, _GetNodeNameId(node));
        }
        // If contested, change back to occupied
        else
        {
            UpdatePlayerScore(source, SCORE_BASES_DEFENDED, 1);
            source->UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BG_OBJECTIVE_CAPTURE,1,246);
            m_prevNodes[node] = m_Nodes[node];
            m_Nodes[node] = teamIndex + BG_IC_NODE_TYPE_OCCUPIED;
            // create new occupied banner
            _CreateBanner(node, BG_IC_NODE_TYPE_OCCUPIED, teamIndex, true);
            _SendNodeUpdate(node);
            m_NodeTimers[node] = 0;

            if (teamIndex == TEAM_INDEX_ALLIANCE)
                SendMessage2ToAll(LANG_BG_IC_NODE_DEFENDED,CHAT_MSG_BG_SYSTEM_ALLIANCE, source, _GetNodeNameId(node));
            else
                SendMessage2ToAll(LANG_BG_IC_NODE_DEFENDED,CHAT_MSG_BG_SYSTEM_HORDE, source, _GetNodeNameId(node));
        }
        sound = (teamIndex == TEAM_INDEX_ALLIANCE) ? BG_IC_SOUND_NODE_ASSAULTED_ALLIANCE : BG_IC_SOUND_NODE_ASSAULTED_HORDE;
    }

    // If node is occupied, change to enemy-contested
    else
    {
        UpdatePlayerScore(source, SCORE_BASES_ASSAULTED, 1);
        source->UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BG_OBJECTIVE_CAPTURE,1,245);
        m_prevNodes[node] = m_Nodes[node];
        m_Nodes[node] = teamIndex + BG_IC_NODE_TYPE_CONTESTED;
        // create new contested banner
        _CreateBanner(node, BG_IC_NODE_TYPE_CONTESTED, teamIndex, true);
        _SendNodeUpdate(node);
        m_NodeTimers[node] = BG_IC_FLAG_CAPTURING_TIME;

        if (teamIndex == TEAM_INDEX_ALLIANCE)
            SendMessage2ToAll(LANG_BG_IC_NODE_ASSAULTED,CHAT_MSG_BG_SYSTEM_ALLIANCE, source, _GetNodeNameId(node));
        else
            SendMessage2ToAll(LANG_BG_IC_NODE_ASSAULTED,CHAT_MSG_BG_SYSTEM_HORDE, source, _GetNodeNameId(node));

        sound = (teamIndex == TEAM_INDEX_ALLIANCE) ? BG_IC_SOUND_NODE_ASSAULTED_ALLIANCE : BG_IC_SOUND_NODE_ASSAULTED_HORDE;

        if (node == BG_IC_NODE_HANGAR)
            (teamIndex == TEAM_INDEX_ALLIANCE ? gunshipHorde : gunshipAlliance)->BuildStopMovePacket(GetBgMap());
    }
    PlaySoundToAll(sound);
}

void BattleGroundIC::EventPlayerDamageGO(Player *player, GameObject* target_obj, uint32 eventId, uint32 doneBy)
{
    TeamIndex teamIndex = GetTeamIndex(player->GetTeam());

    // Seaforium Charge Explosion (A-bomb-inable)
    if (doneBy == 66676)
        player->UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_CAST_SPELL, 68366);

    // Huge Seaforium Charge Explosion (A-bomb-ination)
    if (doneBy == 66672)
        player->UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_CAST_SPELL, 68367);

    uint32 type = NULL;
    switch (target_obj->GetEntry())
    {
        case BG_IC_GO_ALLIANCE_GATE_1:
        {
            type = BG_IC_GO_T_ALLIANCE_GATE_1;
            if (eventId == 22082)
            {
                SendMessage2ToAll(LANG_BG_IC_A_WEST_GATE_DESTROYED, CHAT_MSG_BG_SYSTEM_ALLIANCE, player, doneBy);
                UpdateWorldState(BG_IC_GateStatus[type][0], 0);             // needed for removing the old icon
                UpdateWorldState(BG_IC_GateStatus[type][1], 1);
                GateStatus[type] = BG_IC_GO_GATES_DAMAGE;                   // correct icon is at "damage" state (not flag), not "destroy"
                RewardHonorToTeam(85, (teamIndex == 0) ? ALLIANCE:HORDE);
                SpawnEvent(IC_EVENT_ADD_A_BOSS, 0, true);
                SpawnEvent(IC_EVENT_ADD_A_GUARDS, 0, true);

                // prevent closing of the boss gates by destroying another wall gate
                if (aOpen == false)
                {
                    OpenDoorEvent(IC_EVENT_BOSS_A);
                    aOpen = true;
                }
            }
            break;
        }
        case BG_IC_GO_ALLIANCE_GATE_2:
        {
            type = BG_IC_GO_T_ALLIANCE_GATE_2;
            if (eventId == 22078)
            {
                SendMessage2ToAll(LANG_BG_IC_A_EAST_GATE_DESTROYED, CHAT_MSG_BG_SYSTEM_ALLIANCE, player, doneBy);
                UpdateWorldState(BG_IC_GateStatus[type][0], 0);
                UpdateWorldState(BG_IC_GateStatus[type][1], 1);
                GateStatus[type] = BG_IC_GO_GATES_DAMAGE;
                RewardHonorToTeam(85, (teamIndex == 0) ? ALLIANCE:HORDE);
                SpawnEvent(IC_EVENT_ADD_A_BOSS, 0, true);
                SpawnEvent(IC_EVENT_ADD_A_GUARDS, 0, true);

                if (aOpen == false)
                {
                    OpenDoorEvent(IC_EVENT_BOSS_A);
                    aOpen = true;
                }
            }
            break;
        }
        case BG_IC_GO_ALLIANCE_GATE_3:
        {
            type = BG_IC_GO_T_ALLIANCE_GATE_3;
            if (eventId == 22080)
            {
                SendMessage2ToAll(LANG_BG_IC_A_FRONT_GATE_DESTROYED, CHAT_MSG_BG_SYSTEM_ALLIANCE, player, doneBy);
                UpdateWorldState(BG_IC_GateStatus[type][0], 0);
                UpdateWorldState(BG_IC_GateStatus[type][1], 1);
                GateStatus[type] = BG_IC_GO_GATES_DAMAGE;
                RewardHonorToTeam(85, (teamIndex == 0) ? ALLIANCE:HORDE);
                SpawnEvent(IC_EVENT_ADD_A_BOSS, 0, true);
                SpawnEvent(IC_EVENT_ADD_A_GUARDS, 0, true);

                if (aOpen == false)
                {
                    OpenDoorEvent(IC_EVENT_BOSS_A);
                    aOpen = true;
                }
            }
            break;
        }
        case BG_IC_GO_HORDE_GATE_1:
        {
            type = BG_IC_GO_T_HORDE_GATE_1;
            if (eventId == 22081)
            {
                SendMessage2ToAll(LANG_BG_IC_H_WEST_GATE_DESTROYED, CHAT_MSG_BG_SYSTEM_HORDE, player, doneBy);
                UpdateWorldState(BG_IC_GateStatus[type][0], 0);
                UpdateWorldState(BG_IC_GateStatus[type][1], 1);
                GateStatus[type] = BG_IC_GO_GATES_DAMAGE;
                RewardHonorToTeam(85, (teamIndex == 0) ? ALLIANCE:HORDE);
                SpawnEvent(IC_EVENT_ADD_H_BOSS, 0, true);
                SpawnEvent(IC_EVENT_ADD_H_GUARDS, 0, true);

                if (hOpen == false)
                {
                    OpenDoorEvent(IC_EVENT_BOSS_H);
                    hOpen = true;
                }
            }
            break;
        }
        case BG_IC_GO_HORDE_GATE_2:
        {
            type = BG_IC_GO_T_HORDE_GATE_2;
            if (eventId == 22083)
            {
                SendMessage2ToAll(LANG_BG_IC_H_EAST_GATE_DESTROYED, CHAT_MSG_BG_SYSTEM_HORDE, player, doneBy);
                UpdateWorldState(BG_IC_GateStatus[type][0], 0);
                UpdateWorldState(BG_IC_GateStatus[type][1], 1);
                GateStatus[type] = BG_IC_GO_GATES_DAMAGE;
                RewardHonorToTeam(85, (teamIndex == 0) ? ALLIANCE:HORDE);
                SpawnEvent(IC_EVENT_ADD_H_BOSS, 0, true);
                SpawnEvent(IC_EVENT_ADD_H_GUARDS, 0, true);

                if (hOpen == false)
                {
                    OpenDoorEvent(IC_EVENT_BOSS_H);
                    hOpen = true;
                }
            }
            break;
        }
        case BG_IC_GO_HORDE_GATE_3:
        {
            type = BG_IC_GO_T_HORDE_GATE_3;
            if (eventId == 22079)
            {
                SendMessage2ToAll(LANG_BG_IC_H_FRONT_GATE_DESTROYED, CHAT_MSG_BG_SYSTEM_HORDE, player, doneBy);
                UpdateWorldState(BG_IC_GateStatus[type][0], 0);
                UpdateWorldState(BG_IC_GateStatus[type][1], 1);
                GateStatus[type] = BG_IC_GO_GATES_DAMAGE;
                RewardHonorToTeam(85, (teamIndex == 0) ? ALLIANCE:HORDE);
                SpawnEvent(IC_EVENT_ADD_H_BOSS, 0, true);
                SpawnEvent(IC_EVENT_ADD_H_GUARDS, 0, true);

                if (hOpen == false)
                {
                    OpenDoorEvent(IC_EVENT_BOSS_H);
                    hOpen = true;
                }
            }
            break;
        }
    }
}

WorldSafeLocsEntry const* BattleGroundIC::GetClosestGraveYard(Player* player)
{
    TeamIndex teamIndex = GetTeamIndex(player->GetTeam());

    // Is there any occupied node for this team?
    std::vector<uint8> nodes;
    for (uint8 i = 0; i < BG_IC_NODES_MAX; ++i)
        if (m_Nodes[i] == teamIndex + 3)
            nodes.push_back(i);

    WorldSafeLocsEntry const* good_entry = NULL;
    // If so, select the closest node to place ghost on
    if (!nodes.empty())
    {
        float plr_x = player->GetPositionX();
        float plr_y = player->GetPositionY();

        float mindist = 999999.0f;
        for (uint8 i = 0; i < nodes.size(); ++i)
        {
            WorldSafeLocsEntry const*entry = sWorldSafeLocsStore.LookupEntry( BG_IC_GraveyardIds[nodes[i]] );
            if (!entry)
                continue;
            float dist = (entry->x - plr_x)*(entry->x - plr_x)+(entry->y - plr_y)*(entry->y - plr_y);
            if (mindist > dist)
            {
                mindist = dist;
                good_entry = entry;
            }
        }
        nodes.clear();
    }
    // If not, place ghost on starting location
    if (!good_entry)
        good_entry = sWorldSafeLocsStore.LookupEntry( BG_IC_GraveyardIds[teamIndex+5] );

    return good_entry;
}

Transport* BattleGroundIC::CreateTransport(uint32 goEntry, uint32 period)
{
    Transport* t = new Transport;

    const GameObjectInfo* goinfo = sObjectMgr.GetGameObjectInfo(goEntry);

    if (!goinfo)
    {
        sLog.outErrorDb("Transport ID: %u will not be loaded, gameobject_template missing", goEntry);
        delete t;
        return NULL;
    }

    std::set<uint32> mapsUsed;
    t->m_period = period;

    if (!t->GenerateWaypoints(goinfo->moTransport.taxiPathId, mapsUsed))
        // skip transports with empty waypoints list
    {
        sLog.outErrorDb("Transport (path id %u) path size = 0. Transport ignored, check DBC files or transport GO data0 field.",goinfo->moTransport.taxiPathId);
        delete t;
        return NULL;
    }

    uint32 mapid = t->m_WayPoints[0].mapid;

    float x = t->m_WayPoints[0].x;
    float y = t->m_WayPoints[0].y;
    float z =  t->m_WayPoints[0].z;
    float o = 1;

    // creates the Gameobject
    if (!t->Create(goEntry, mapid, x, y, z, o, GO_ANIMPROGRESS_DEFAULT, 0))
    {
        delete t;
        return NULL;
    }

    t->SetMap(GetBgMap());

    return t;
}

void BattleGroundIC::HandleBuffs()
{
    for (BattleGroundPlayerMap::const_iterator itr = GetPlayers().begin(); itr != GetPlayers().end(); ++itr)
    {
        Player *plr = sObjectMgr.GetPlayer(itr->first);
        if (plr)
        {
            // quarry / refinery buffs
            for (uint8 node = BG_IC_NODE_QUARRY; node <= BG_IC_NODE_REFINERY; node++)
            {
                if (m_Nodes[node] >= BG_IC_NODE_TYPE_OCCUPIED)
                {
                    if ((node == BG_IC_NODE_QUARRY) && (!plr->HasAura(SPELL_QUARRY)) && (plr->GetTeam() == (m_Nodes[node] - BG_IC_NODE_TYPE_OCCUPIED == 0 ? ALLIANCE : HORDE)))
                        plr->CastSpell(plr, SPELL_QUARRY, true);
                    else if ((node == BG_IC_NODE_REFINERY) && (!plr->HasAura(SPELL_REFINERY)) && (plr->GetTeam() == (m_Nodes[node] - BG_IC_NODE_TYPE_OCCUPIED == 0 ? ALLIANCE : HORDE)))
                        plr->CastSpell(plr, SPELL_REFINERY, true);
                }
                else
                {
                    if (node == BG_IC_NODE_QUARRY)
                        plr->RemoveAurasDueToSpell(SPELL_QUARRY);
                    else
                        plr->RemoveAurasDueToSpell(SPELL_REFINERY);
                }
            }
            // parachute handling
            float height = plr->GetPositionZ();
            if (height >= 180)
                continue;

            if (height < 180 && height > 140 && (!plr->HasAura(SPELL_PARACHUTE)))
                plr->CastSpell(plr, SPELL_PARACHUTE, true);
        }
    }
}

uint32 BattleGroundIC::GetCorrectFactionIC(uint8 vehicleType) const
{
    switch (vehicleType)
    {
        case VEHICLE_BG_DEMOLISHER:
        {
            if (m_Nodes[BG_IC_NODE_WORKSHOP] == BG_IC_NODE_STATUS_ALLY_OCCUPIED)
                return VEHICLE_FACTION_ALLIANCE;

            else if (m_Nodes[BG_IC_NODE_WORKSHOP] == BG_IC_NODE_STATUS_HORDE_OCCUPIED)
                return VEHICLE_FACTION_HORDE;
            break;
        }
        case VEHICLE_IC_CATAPULT:
        {
            if (m_Nodes[BG_IC_NODE_DOCKS] == BG_IC_NODE_STATUS_ALLY_OCCUPIED)
                return VEHICLE_FACTION_ALLIANCE;

            else if (m_Nodes[BG_IC_NODE_DOCKS] == BG_IC_NODE_STATUS_HORDE_OCCUPIED)
                return VEHICLE_FACTION_HORDE;
            break;
        }
        default:
            break;
    }
    return VEHICLE_FACTION_NEUTRAL;
}

bool BattleGroundIC::hasAllNodes(int8 team)
{
    for (int i = BG_IC_NODE_DOCKS; i <= BG_IC_NODE_REFINERY; ++i)
        if (m_Nodes[i] != BG_IC_NODE_TYPE_OCCUPIED + team)
            return false;

    return true;
}

bool BattleGroundIC::hasAllResNodes(int8 team)
{
    for (int i = BG_IC_NODE_QUARRY; i <= BG_IC_NODE_REFINERY; ++i)
        if (m_Nodes[i] != BG_IC_NODE_TYPE_OCCUPIED + team)
            return false;

    return true;
}
