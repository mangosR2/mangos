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

#include "GameObject.h"
#include "BattleGround.h"
#include "BattleGroundSA.h"
#include "WorldPacket.h"
#include "Language.h"
#include "Player.h"
#include "Object.h"
#include "Creature.h"
#include "BattleGroundMgr.h"
#include "Util.h"
#include "MapManager.h"
#include "ObjectMgr.h"

/*
* BattleGround Strand of the Ancients:
* TODO:
*   - Move all the harcoded variables such coords to header BattleGroundSA.h
*   - Cosmetics & avoid hacks.
*/

static uint32 const BG_SA_GateStatus[6] = {3849, 3623, 3620, 3614, 3617, 3638};
static uint32 const BG_SA_WorldStatusA[4] = {4352, 3631, 3627, 3626};         // alliance attacking
static uint32 const BG_SA_WorldStatusH[4] = {4353, 3630, 3628, 3629};         // horde attacking

// WorldSafeLocs ids for 5 gyd, and for ally, and horde starting location
static uint32 const BG_SA_GraveyardIdsPhase[3] = {1347, 1346, 1348};
static uint32 const BG_SA_GraveyardIds[2] = {1349, 1350};

static int32 const GrraveYardWS[3][2]=
{
    {3636, 3632},
    {3635, 3633},
    {3637, 3634},
};

static float const BG_SA_START_LOCATIONS[7][4] = {
    {1804.10f, -168.46f, 60.55f, 2.65f},                    // Pillar 1 - don't used now
    {1803.71f, 118.61f, 59.83f, 3.56f},                     // Pillar 2 - don't used now
    {1597.64f, -106.35f, 8.89f, 4.13f},                     // Dock 1
    {1606.61f, 50.13f, 7.58f, 2.39f},                       // Dock 2
    {1209.70f, -65.16f, 70.10f, 0.00f},                     // Defenders start loc
    //Ships
    {2679.696777f, -826.891235f, 3.712860f, 5.78367f},     //rot2 1 rot3 0.0002f
    {2574.003662f, 981.261475f, 2.603424f, 0.807696f}
};

BattleGroundSA::BattleGroundSA()
{
    m_StartMessageIds[BG_STARTING_EVENT_FIRST]  = LANG_BG_SA_START_TWO_MINUTE;
    m_StartMessageIds[BG_STARTING_EVENT_SECOND] = LANG_BG_SA_START_ONE_MINUTE;
    m_StartMessageIds[BG_STARTING_EVENT_THIRD]  = LANG_BG_SA_START_HALF_MINUTE;
    m_StartMessageIds[BG_STARTING_EVENT_FOURTH] = LANG_BG_SA_HAS_BEGUN;

    m_BgObjects.resize(BG_SA_MAXOBJ);
    shipsStarted = false;
    shipsSpawned = false;
    isDemolisherDestroyed[0] = false; // ALLIANCE
    isDemolisherDestroyed[1] = false; // HORDE
    shipsTimer = BG_SA_BOAT_START;

    for (int32 i = 0; i < BG_SA_GATE_MAX; ++i)
        GateStatus[i] = BG_SA_GO_GATES_NORMAL;

    TimerEnabled = false;
    TimeST2Round = 120000;
    Round_timer = 0;
    Phase = SA_ROUND_ONE;

    GateRoomAncientShrineDamaged = false;
    GateGreenEmeraldDamaged = false;
    GateBlueSaphireDamaged = false;
    GateMauveAmethystDamaged = false;
    GateRedSunDamaged = false;
    GateYellowMoonDamaged = false;
}

BattleGroundSA::~BattleGroundSA()
{
}

void BattleGroundSA::FillInitialWorldStates(WorldPacket& data, uint32& count)
{
    for (uint8 i = 0; i < BG_SA_GRY_MAX; ++i)
    {
        if (m_Gyd[i] == BG_SA_GRAVE_STATUS_HORDE_OCCUPIED || m_Gyd[i] == BG_SA_GRAVE_STATUS_HORDE_CONTESTED)
            _GydOccupied(i, HORDE);
        else if (m_Gyd[i] == BG_SA_GRAVE_STATUS_ALLY_OCCUPIED || m_Gyd[i] == BG_SA_GRAVE_STATUS_ALLY_CONTESTED)
            _GydOccupied(i, ALLIANCE);
    }

    for (uint8 i = 0; i < BG_SA_MAX_WS; ++i)
    {
        FillInitialWorldState(data, count, BG_SA_WorldStatusA[i], (GetDefender() == HORDE) ? 1 : 0);
        FillInitialWorldState(data, count, BG_SA_WorldStatusH[i], (GetDefender() == HORDE) ? 0 : 1);
    }

    for (uint32 z = 0; z < BG_SA_GATE_MAX; ++z)
    {
        FillInitialWorldState(data, count, BG_SA_GateStatus[z], GateStatus[z]);
        if ((z == 0) && (GetDefender() == HORDE))                                               // Ancient gate changes color depending on the defender
            FillInitialWorldState(data, count, BG_SA_GateStatus[z], (GateStatus[z] + 3));
    }

    //Time will be sent on first update...
    FillInitialWorldState(data, count, BG_SA_ENABLE_TIMER, TimerEnabled ? uint32(1) : uint32(0));
    FillInitialWorldState(data, count, BG_SA_TIMER_MINUTES, uint32(0));
    FillInitialWorldState(data, count, BG_SA_TIMER_10SEC, uint32(0));
    FillInitialWorldState(data, count, BG_SA_TIMER_SEC, uint32(0));
}

void BattleGroundSA::StartShips()
{
    if (shipsStarted)
        return;

    DoorOpen(m_BgObjects[BG_SA_BOAT_ONE]);
    DoorOpen(m_BgObjects[BG_SA_BOAT_TWO]);

    for (int i = BG_SA_BOAT_ONE; i <= BG_SA_BOAT_TWO; i++)
    {
        for (BattleGroundPlayerMap::const_iterator itr = GetPlayers().begin(); itr != GetPlayers().end(); ++itr)
        {
            Player* p = sObjectMgr.GetPlayer(itr->first);
            if (p)
            {
                UpdateData data;
                WorldPacket pkt;
                GetBGObject(i)->BuildValuesUpdateBlockForPlayer(&data, p);
                data.BuildPacket(&pkt);
                p->GetSession()->SendPacket(&pkt);
            }
        }
    }
    shipsStarted = true;
}

void BattleGroundSA::ToggleTimer()
{
    TimerEnabled = !TimerEnabled;
    UpdateWorldState(BG_SA_ENABLE_TIMER, (TimerEnabled) ? 1 : 0);
}

void BattleGroundSA::EndBattleGround(Team winner)
{
    //win reward
    if(winner)
    {
        RewardHonorToTeam(GetBonusHonorFromKill(1), winner);
        RewardXpToTeam(0, 0.8f, winner);
    }

    //complete map_end rewards (even if no team wins)
    RewardHonorToTeam(GetBonusHonorFromKill(2), ALLIANCE);
    RewardHonorToTeam(GetBonusHonorFromKill(2), HORDE);
    RewardXpToTeam(0, 0.8f, ALLIANCE);
    RewardXpToTeam(0, 0.8f, HORDE);
    
    BattleGround::EndBattleGround(winner);
}

void BattleGroundSA::Update(uint32 diff)
{
    BattleGround::Update(diff);

    if (GetStatus() == STATUS_WAIT_JOIN && !shipsStarted)
        if (Phase == SA_ROUND_ONE) // Round one not started yet
        {
            if (shipsTimer <= diff)
                StartShips();
            else
                shipsTimer -= diff;
        }

    if (GetStatus() == STATUS_IN_PROGRESS) // Battleground already in progress
    {
        if (Round_timer >= BG_SA_ROUNDLENGTH)
        {
            if (Phase == SA_ROUND_ONE) // Timeout of first round
            {
                PlaySoundToAll(BG_SA_SOUND_GYD_VICTORY);
                SendMessageToAll(defender == ALLIANCE ? LANG_BG_SA_ALLIANCE_TIMEOUT_END_1ROUND : LANG_BG_SA_HORDE_TIMEOUT_END_1ROUND, CHAT_MSG_BG_SYSTEM_NEUTRAL, NULL);
                SendWarningToAll(LANG_BG_SA_END_1ROUND);
                RoundScores[0].winner = GetDefender();
                RoundScores[0].time = BG_SA_ROUNDLENGTH;

                for (BattleGroundPlayerMap::const_iterator itr = GetPlayers().begin(); itr != GetPlayers().end(); ++itr)
                {
                    Player* plr = sObjectMgr.GetPlayer(itr->first);
                    if (plr)
                        plr->GetAchievementMgr().UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET, BG_SA_END_OF_ROUND);
                }

                ResetBattle(0, defender);
            }
            else // Timeout of second round
            {
                SendMessageToAll(defender == ALLIANCE ? LANG_BG_SA_ALLIANCE_TIMEOUT_END_2ROUND : LANG_BG_SA_HORDE_TIMEOUT_END_2ROUND, CHAT_MSG_BG_SYSTEM_NEUTRAL, NULL);
                RoundScores[1].winner = GetDefender();

                for (BattleGroundPlayerMap::const_iterator itr = GetPlayers().begin(); itr != GetPlayers().end(); ++itr)
                {
                    Player* plr = sObjectMgr.GetPlayer(itr->first);
                    if (plr)
                        plr->GetAchievementMgr().UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET, BG_SA_END_OF_ROUND);
                }

                if (RoundScores[0].winner == GetDefender())
                    EndBattleGround(GetDefender());
                else
                    EndBattleGround(TEAM_NONE);
                return;
            }
        }
        else
            Round_timer += diff;

        for (int gyd = 0; gyd < BG_SA_GRY_MAX; ++gyd)
        {
            // 3 sec delay to spawn new banner instead previous despawned one
            if (m_BannerTimers[gyd].timer)
            {
                if (m_BannerTimers[gyd].timer > diff)
                    m_BannerTimers[gyd].timer -= diff;
                else
                {
                    m_BannerTimers[gyd].timer = 0;
                    _CreateBanner(gyd, m_BannerTimers[gyd].type, m_BannerTimers[gyd].teamIndex, false);
                }
            }
        }
        UpdateTimer();
    }

    if (GetStatus() == STATUS_WAIT_JOIN && Phase == SA_ROUND_TWO) // Round two, not yet started
    {
        if (!shipsStarted)
        {
            if (shipsTimer <= diff)
            {
                SendMessageToAll(LANG_BG_SA_START_ONE_MINUTE, CHAT_MSG_BG_SYSTEM_NEUTRAL, NULL);
                StartShips();
            }
            else
                shipsTimer -= diff;
        }

        if (TimeST2Round < diff)
        {
            Phase = SA_ROUND_TWO;
            SpawnEvent(SA_EVENT_ADD_NPC, 0, true);
            SpawnEvent(SA_EVENT_ADD_BOMB_B, (GetDefender() == ALLIANCE ? BG_SA_GRAVE_STATUS_HORDE_OCCUPIED : BG_SA_GRAVE_STATUS_ALLY_OCCUPIED), true);
            ToggleTimer();
            SetStatus(STATUS_IN_PROGRESS); // Start round two
            PlaySoundToAll(SOUND_BG_START);
            SendWarningToAll(LANG_BG_SA_HAS_BEGUN);
            StartTimedAchievement(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET, BG_SA_EVENT_START_BATTLE_2);

            for (BattleGroundPlayerMap::const_iterator itr = GetPlayers().begin(); itr != GetPlayers().end(); ++itr)
            {
                if (Player* plr = sObjectMgr.GetPlayer(itr->first))
                    plr->RemoveAurasDueToSpell(SPELL_PREPARATION);
            }
        }
        else
            TimeST2Round -= diff;
    }
}

void BattleGroundSA::ResetWorldStates()
{
    for (uint8 i = 0; i < BG_SA_GRY_MAX; ++i)
    {
        if (m_Gyd[i] == BG_SA_GRAVE_STATUS_HORDE_OCCUPIED || m_Gyd[i] == BG_SA_GRAVE_STATUS_HORDE_CONTESTED)
            _GydOccupied(i, HORDE);
        else if (m_Gyd[i] == BG_SA_GRAVE_STATUS_ALLY_OCCUPIED || m_Gyd[i] == BG_SA_GRAVE_STATUS_ALLY_CONTESTED)
            _GydOccupied(i, ALLIANCE);
    }

    // beach graveyard
    _GydOccupied(SA_EVENT_ADD_GRAVE_B, (GetDefender() == HORDE) ? ALLIANCE : HORDE);

    // Reset world-state of gates
    for (uint32 z = 0; z < BG_SA_GATE_MAX; ++z)
    {
        UpdateWorldState(BG_SA_GateStatus[z], GateStatus[z]);
        if ((z == 0) && (GetDefender() == HORDE))
            UpdateWorldState(BG_SA_GateStatus[z], (GateStatus[z] + 3));
    }

    for (uint8 i = 0; i < BG_SA_MAX_WS; ++i)
    {
        UpdateWorldState(BG_SA_WorldStatusA[i], (GetDefender() == HORDE) ? 1 : 0);
        UpdateWorldState(BG_SA_WorldStatusH[i], (GetDefender() == HORDE) ? 0 : 1);
    }
}

void BattleGroundSA::UpdateTimer()
{
    uint32 end_of_round = (BG_SA_ROUNDLENGTH - Round_timer);
    UpdateWorldState(BG_SA_TIMER_MINUTES, end_of_round/60000);
    UpdateWorldState(BG_SA_TIMER_10SEC, (end_of_round%60000)/10000);
    UpdateWorldState(BG_SA_TIMER_SEC, ((end_of_round%60000)%10000)/1000);
}

void BattleGroundSA::StartingEventCloseDoors()
{
    // runs just in 1st phase
}

void BattleGroundSA::StartingEventOpenDoors()
{
    // runs just in 1st round
    SpawnEvent(SA_EVENT_ADD_NPC, 0, true);
    SpawnEvent(SA_EVENT_ADD_BOMB_B, (GetDefender() == ALLIANCE ? BG_SA_GRAVE_STATUS_HORDE_OCCUPIED : BG_SA_GRAVE_STATUS_ALLY_OCCUPIED), true);
    ToggleTimer();
    HandleInteractivity();
    StartTimedAchievement(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET, BG_SA_EVENT_START_BATTLE_1);
}

void BattleGroundSA::RemovePlayer(Player* /*plr*/, ObjectGuid /*guid*/)
{
}

void BattleGroundSA::AddPlayer(Player *plr)
{
    BattleGround::AddPlayer(plr);

    TeleportPlayerToCorrectLoc(plr);

    BattleGroundSAScore* sc = new BattleGroundSAScore;

    m_PlayerScores[plr->GetObjectGuid()] = sc;
}

void BattleGroundSA::HandleAreaTrigger(Player * /*Source*/, uint32 /*Trigger*/)
{
    // this is wrong way to implement these things. On official it done by gameobject spell cast.
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
}

void BattleGroundSA::UpdatePlayerScore(Player* Source, uint32 type, uint32 value)
{
    BattleGroundScoreMap::iterator itr = m_PlayerScores.find(Source->GetObjectGuid());
    if(itr == m_PlayerScores.end())                         // player not found...
        return;

    switch(type)
    {
        case SCORE_DEMOLISHERS_DESTROYED:
            ((BattleGroundSAScore*)itr->second)->DemolishersDestroyed += value;
            break;
        case SCORE_GATES_DESTROYED:
            ((BattleGroundSAScore*)itr->second)->GatesDestroyed += value;
            break;
        default:
            BattleGround::UpdatePlayerScore(Source,type,value);
            break;
    }
}

void BattleGroundSA::ResetBattle(uint32 winner, Team teamDefending)
{
    Phase = SA_ROUND_TWO;
    shipsTimer = BG_SA_BOAT_START;
    shipsStarted = false;

    for (int32 i = 0; i < BG_SA_GATE_MAX; ++i)
        GateStatus[i] = BG_SA_GO_GATES_NORMAL;

    SetStartTime(0);
    defender = (teamDefending  == ALLIANCE) ?  HORDE : ALLIANCE;
    relicGateDestroyed = false;
    ToggleTimer();

    SetupShips();

    for (BattleGroundPlayerMap::const_iterator itr = GetPlayers().begin(); itr != GetPlayers().end(); ++itr)
    {
        Player *plr = sObjectMgr.GetPlayer(itr->first);

        if (!plr)
            continue;

        TeleportPlayerToCorrectLoc(plr, true);

        if (plr->GetBGTeam() == defender && plr->GetItemByEntry(39213) != NULL)
            plr->DestroyItemCount(39213, 1, true);
    }

    UpdatePhase();
    ResetWorldStates();
}

void BattleGroundSA::Reset()
{
    //call parent's class reset
    BattleGround::Reset();

    defender = ((urand(0,1)) ? ALLIANCE : HORDE);
    relicGateDestroyed = false;

    for (uint8 i = 0; i <= SA_EVENT_ADD_YELLOW_SIGIL; ++i)
        m_ActiveEvents[i] = BG_EVENT_NONE;

    UpdatePhase();
}

void BattleGroundSA::UpdatePhase()
{
    if (Phase == SA_ROUND_TWO)
    {
        // despawn everything
        for (uint8 i = 0; i <= SA_EVENT_ADD_YELLOW_SIGIL; ++i)
            for (uint8 j = 0; j < 5; ++j)
                SpawnEvent(i, j, false);

        Round_timer = (BG_SA_ROUNDLENGTH - RoundScores[0].time);
        SetStatus(STATUS_WAIT_JOIN);
        SendMessageToAll(LANG_BG_SA_START_TWO_MINUTE, CHAT_MSG_BG_SYSTEM_NEUTRAL, NULL);

        // adding Preparation buff for the 2nd round, has to be added in status STATUS_WAIT_JOIN
        for (BattleGroundPlayerMap::const_iterator itr = GetPlayers().begin(); itr != GetPlayers().end(); ++itr)
        {
            Player* plr = sObjectMgr.GetPlayer(itr->first);
            if (plr)
                plr->CastSpell(plr, SPELL_PREPARATION, true);
        }
        HandleInteractivity();
    }

    // Spawn banners and graveyards
    for (uint8 i = 0; i < BG_SA_GRY_MAX; ++i)
    {
        m_BannerTimers[i].timer = 0;
        SpawnEvent(i, (GetDefender() == ALLIANCE) ? BG_SA_GRAVE_STATUS_ALLY_CONTESTED : BG_SA_GRAVE_STATUS_HORDE_CONTESTED, true);
        m_Gyd[i] = ((GetDefender() == ALLIANCE) ? BG_SA_GRAVE_STATUS_ALLY_CONTESTED : BG_SA_GRAVE_STATUS_HORDE_CONTESTED);
    }

    // spirit healers at the relic
    SpawnEvent(SA_EVENT_ADD_GRAVE_A, (GetDefender() == ALLIANCE ? BG_SA_GRAVE_STATUS_ALLY_OCCUPIED : BG_SA_GRAVE_STATUS_HORDE_OCCUPIED), true);
    /*TODO: fix next line, because now the array is out of bounds */
    m_Gyd[SA_EVENT_ADD_GRAVE_A] = ((GetDefender() == ALLIANCE) ? BG_SA_GRAVE_STATUS_ALLY_CONTESTED : BG_SA_GRAVE_STATUS_HORDE_CONTESTED);

    // (Re)spawn graveyard at the beach.
    SpawnEvent(SA_EVENT_ADD_GRAVE_B, (GetDefender() == ALLIANCE ? BG_SA_GRAVE_STATUS_HORDE_OCCUPIED : BG_SA_GRAVE_STATUS_ALLY_OCCUPIED), true);

    SpawnEvent(SA_EVENT_ADD_GO, 0, true);
    SpawnEvent(SA_EVENT_ADD_CANNON, 0, true);
    SpawnEvent(SA_EVENT_ADD_RELIC, (GetDefender() == ALLIANCE) ? 2 : 1, true);
    MakeInteractive(SA_EVENT_ADD_RELIC, (GetDefender() == ALLIANCE) ? 2 : 1, false);

    // spawn gate sigils
    for (uint8 i = SA_EVENT_ADD_GREEN_SIGIL; i <= SA_EVENT_ADD_YELLOW_SIGIL; ++i)
        SpawnEvent(i, 0, true);
}

void BattleGroundSA::HandleInteractivity()
{
    for (int i = 0; i < BG_SA_GRY_MAX; i++)
        MakeInteractive(i, (GetDefender() == ALLIANCE) ? BG_SA_GRAVE_STATUS_ALLY_CONTESTED : BG_SA_GRAVE_STATUS_HORDE_CONTESTED, false);
}

bool BattleGroundSA::SetupBattleGround()
{
    return SetupShips();
}

bool BattleGroundSA::SetupShips()
{
    if (Phase == SA_ROUND_TWO)
    {
        for (BattleGroundPlayerMap::const_iterator itr = GetPlayers().begin(); itr != GetPlayers().end(); ++itr)
        {
            if (Player* plr = sObjectMgr.GetPlayer(itr->first))
                SendTransportsRemove(plr);
        }
    }

    for (uint8 i = BG_SA_BOAT_ONE; i <= BG_SA_BOAT_TWO; ++i)
    {
        uint32 boatid=0;
        switch (i)
        {
            case BG_SA_BOAT_ONE:
                boatid = GetDefender() == ALLIANCE ? BG_SA_BOAT_ONE_H : BG_SA_BOAT_ONE_A;
                if (!(AddObject(i, boatid, BG_SA_START_LOCATIONS[i + 5][0], BG_SA_START_LOCATIONS[i + 5][1], BG_SA_START_LOCATIONS[i + 5][2]+ (GetDefender() == ALLIANCE ? -3.750f: 0) , BG_SA_START_LOCATIONS[i + 5][3], 0.0f, 0.0f, 0.0f, 0.0f, RESPAWN_ONE_DAY)))
                {
                    sLog.outError("SA_ERROR: Can't spawn ships!");
                    return false;
                }

                if (GameObject* boat = GetBGObject(i))
                    boat->SetTransportPathRotation(QuaternionData(0.0f, 0.0f, 1.0f, 0.0002f));
                break;
            case BG_SA_BOAT_TWO:
                boatid = GetDefender() == ALLIANCE ? BG_SA_BOAT_TWO_H : BG_SA_BOAT_TWO_A;
                if (!(AddObject(i, boatid, BG_SA_START_LOCATIONS[i + 5][0], BG_SA_START_LOCATIONS[i + 5][1], BG_SA_START_LOCATIONS[i + 5][2]+ (GetDefender() == ALLIANCE ? -3.750f: 0) , BG_SA_START_LOCATIONS[i + 5][3], 0.0f, 0.0f, 0.0f, 0.0f, RESPAWN_ONE_DAY)))
                {
                    sLog.outError("SA_ERROR: Can't spawn ships!");
                    return false;
                }

                if (GameObject* boat = GetBGObject(i))
                    boat->SetTransportPathRotation(QuaternionData(0, 0, 1.0f, 0.00001f));
                break;
        }
    }

    SpawnBGObject(m_BgObjects[BG_SA_BOAT_ONE], RESPAWN_IMMEDIATELY);
    SpawnBGObject(m_BgObjects[BG_SA_BOAT_TWO], RESPAWN_IMMEDIATELY);
    shipsSpawned = true;

    for (BattleGroundPlayerMap::const_iterator itr = GetPlayers().begin(); itr != GetPlayers().end(); ++itr)
    {
        if (Player* plr = sObjectMgr.GetPlayer(itr->first))
            SendTransportInit(plr);
    }
    return true;
}

/*  type: 0-neutral, 1-contested, 3-occupied
    team: 0-ally, 1-horde                        */
void BattleGroundSA::_CreateBanner(uint8 gry, uint8 type, uint8 teamIndex, bool delay)
{
    // Just put it into the queue
    if (delay)
    {
        m_BannerTimers[gry].timer = 2000;
        m_BannerTimers[gry].type = type;
        m_BannerTimers[gry].teamIndex = teamIndex;
        return;
    }

    SpawnEvent(gry, type, true);                           // will automaticly despawn other events
}

void BattleGroundSA::EventPlayerClickedOnFlag(Player *source, GameObject* target_obj)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    uint8 objectEvent = (sBattleGroundMgr.GetGameObjectEventIndex(target_obj->GetGUIDLow())).event1;
    if (objectEvent >= BG_SA_GRY_MAX)                           // not a node
        return;

    BG_SA_Events gyd = BG_SA_Events(objectEvent);

    TeamIndex teamIndex = GetTeamIndex(source->GetTeam());

    //make the new banner not capturable by defenders
    m_Gyd[gyd] = BG_SA_GRAVE_STATUS_OCCUPIED + teamIndex;
    // create new occupied banner
    _CreateBanner(gyd, (GetDefender() == ALLIANCE ? BG_SA_GRAVE_STATUS_HORDE_OCCUPIED : BG_SA_GRAVE_STATUS_ALLY_OCCUPIED), teamIndex, true);
    // make the new occupied banner not clickable by anyone
    MakeInteractive(gyd, (GetDefender() == ALLIANCE) ? BG_SA_GRAVE_STATUS_HORDE_OCCUPIED : BG_SA_GRAVE_STATUS_ALLY_OCCUPIED, false);
    _GydOccupied(gyd, (teamIndex == 0) ? ALLIANCE : HORDE);

    RewardHonorToTeam(85, (teamIndex == 0) ? ALLIANCE : HORDE);
    RewardXpToTeam(0, 0.6f, (teamIndex == 0) ? ALLIANCE : HORDE);

    if (teamIndex == TEAM_INDEX_ALLIANCE)
    {
        SendWarningToAllSA(gyd, ALLIANCE);
        PlaySoundToAll(BG_SA_SOUND_GYD_CAPTURED_ALLIANCE);
    }
    else
    {
        SendWarningToAllSA(gyd, HORDE);
        PlaySoundToAll(BG_SA_SOUND_GYD_CAPTURED_HORDE);
    }
    switch(gyd)
    {
        // east base
        case SA_EVENT_ADD_GRAVE_E:
            SpawnEvent(SA_EVENT_ADD_VECH_E, 0, true);
            SpawnEvent(SA_EVENT_ADD_BOMB_E, (GetDefender() == ALLIANCE) ? BG_SA_GRAVE_STATUS_HORDE_OCCUPIED : BG_SA_GRAVE_STATUS_ALLY_OCCUPIED, true);
            break;
        // west base
        case SA_EVENT_ADD_GRAVE_W:
            SpawnEvent(SA_EVENT_ADD_VECH_W, 0, true);
            SpawnEvent(SA_EVENT_ADD_BOMB_W, (GetDefender() == ALLIANCE) ? BG_SA_GRAVE_STATUS_HORDE_OCCUPIED : BG_SA_GRAVE_STATUS_ALLY_OCCUPIED, true);
            break;
        // central base
        case SA_EVENT_ADD_GRAVE_C:
            SpawnEvent(SA_EVENT_ADD_BOMB_C, (GetDefender() == ALLIANCE) ? BG_SA_GRAVE_STATUS_HORDE_OCCUPIED : BG_SA_GRAVE_STATUS_ALLY_OCCUPIED, true);
            break;
        default:
            break;
    }
}

void BattleGroundSA::SendMessageSA(Player *player, uint32 type, uint32 name)
{
    uint32 entryMSG = 0;
    TeamIndex teamIndex = GetTeamIndex(player->GetTeam());
    switch (type)
    {
        case 0: entryMSG = LANG_BG_SA_GATE_ATTACK; break;
        case 1: entryMSG = LANG_BG_SA_GATE_DAMAGE; break;
        case 2: entryMSG = LANG_BG_SA_GATE_DETROYED; break;
    }
    if (teamIndex == TEAM_INDEX_ALLIANCE)
        SendMessage2ToAll(entryMSG,CHAT_MSG_BG_SYSTEM_ALLIANCE, player, name);
    else
        SendMessage2ToAll(entryMSG,CHAT_MSG_BG_SYSTEM_HORDE, player, name);
}

void BattleGroundSA::EventPlayerDamageGO(Player *player, GameObject* target_obj, uint32 eventId, uint32 doneBy)
{
    TeamIndex teamIndex = GetTeamIndex(player->GetTeam());

    // Seaforium Charge Explosion
    if (doneBy == 52408)
        player->UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET, BG_SA_PLANT_SEAFORIUM_CHARGE);

    BG_SA_GoType type = BG_SA_GO_GATES_T_NONE;
    switch (target_obj->GetEntry())
    {
        case BG_SA_GO_GATES_ROOM_ANCIENT_SHRINE:
        {
            type = BG_SA_GO_GATES_T_ROOM_ANCIENT_SHRINE;
            switch (eventId)
            {
                case 21630:
                    if (!GateRoomAncientShrineDamaged)
                    {
                        SendMessageSA(player, BG_SA_ATTACK, _GatesName(target_obj));
                        GateRoomAncientShrineDamaged = true;
                    }
                    break;
                case 19836:
                    SendWarningToAllSA(SA_EVENT_NONE, TEAM_NONE, true, type);
                    UpdateWorldState(BG_SA_GateStatus[type], (GetDefender() == HORDE) ? 5 : 2);
                    GateStatus[type] = BG_SA_GO_GATES_DAMAGE;
                    break;
                case 19837:
                    SendWarningToAllSA(SA_EVENT_NONE, TEAM_NONE, true, type, true);
                    UpdateWorldState(BG_SA_GateStatus[type], (GetDefender() == HORDE) ? 6 : 3);
                    GateStatus[type] = BG_SA_GO_GATES_DESTROY;
                    UpdatePlayerScore(player, SCORE_GATES_DESTROYED, 1);
                    RewardHonorToTeam(100, (teamIndex == 0) ? ALLIANCE : HORDE);
                    MakeInteractive(SA_EVENT_ADD_RELIC, (GetDefender() == ALLIANCE) ? 2 : 1, true);
                    relicGateDestroyed = true;
                    break;
            }
            break;
        }
        case BG_SA_GO_GATES_GREEN_EMERALD:
        {
            type = BG_SA_GO_GATES_T_GREEN_EMERALD;
            switch (eventId)
            {
                case 21630:
                    if (!GateGreenEmeraldDamaged)
                    {
                        SendMessageSA(player, BG_SA_ATTACK, _GatesName(target_obj));
                        GateGreenEmeraldDamaged = true;
                    }
                    break;
                case 19041:
                    SendWarningToAllSA(SA_EVENT_NONE, TEAM_NONE, true, type);
                    UpdateWorldState(BG_SA_GateStatus[type], GateStatus[type] = BG_SA_GO_GATES_DAMAGE);
                    break;
                case 19046:
                    SendWarningToAllSA(SA_EVENT_NONE, TEAM_NONE, true, type, true);
                    UpdateWorldState(BG_SA_GateStatus[type], GateStatus[type] = BG_SA_GO_GATES_DESTROY);
                    UpdatePlayerScore(player, SCORE_GATES_DESTROYED, 1);
                    RewardHonorToTeam(85, (teamIndex == 0) ? ALLIANCE : HORDE);
                    // make western/eastern graveyard capturable
                    for (int i = SA_EVENT_ADD_GRAVE_E; i <= SA_EVENT_ADD_GRAVE_W; i++)
                        MakeInteractive(i, (GetDefender() == ALLIANCE) ? BG_SA_GRAVE_STATUS_ALLY_CONTESTED : BG_SA_GRAVE_STATUS_HORDE_CONTESTED, true);
                    SpawnEvent(SA_EVENT_ADD_GREEN_SIGIL, 0, false);
                    break;
            }
            break;
        }
        case BG_SA_GO_GATES_BLUE_SAPHIRE:
        {
            type = BG_SA_GO_GATES_T_BLUE_SAPHIRE;
            switch (eventId)
            {
                case 21630:
                    if (!GateBlueSaphireDamaged)
                    {
                        SendMessageSA(player, BG_SA_ATTACK, _GatesName(target_obj));
                        GateBlueSaphireDamaged = true;
                    }
                    break;
                case 19040:
                    SendWarningToAllSA(SA_EVENT_NONE, TEAM_NONE, true, type);
                    UpdateWorldState(BG_SA_GateStatus[type], GateStatus[type] = BG_SA_GO_GATES_DAMAGE);
                    break;
                case 19045:
                    SendWarningToAllSA(SA_EVENT_NONE, TEAM_NONE, true, type, true);
                    UpdateWorldState(BG_SA_GateStatus[type], GateStatus[type] = BG_SA_GO_GATES_DESTROY);
                    UpdatePlayerScore(player, SCORE_GATES_DESTROYED, 1);
                    RewardHonorToTeam(85, (teamIndex == 0) ? ALLIANCE : HORDE);
                    // make western/eastern graveyard capturable
                    for (int i = SA_EVENT_ADD_GRAVE_E; i <= SA_EVENT_ADD_GRAVE_W; i++)
                        MakeInteractive(i, (GetDefender() == ALLIANCE) ? BG_SA_GRAVE_STATUS_ALLY_CONTESTED : BG_SA_GRAVE_STATUS_HORDE_CONTESTED, true);
                    SpawnEvent(SA_EVENT_ADD_BLUE_SIGIL, 0, false);
                    break;
            }
            break;
        }
        case BG_SA_GO_GATES_MAUVE_AMETHYST:
        {
            type = BG_SA_GO_GATES_T_MAUVE_AMETHYST;
            switch (eventId)
            {
                case 21630:
                    if (!GateMauveAmethystDamaged)
                    {
                        SendMessageSA(player, BG_SA_ATTACK, _GatesName(target_obj));
                        GateMauveAmethystDamaged = true;
                    }
                    break;
                case 19043:
                    SendWarningToAllSA(SA_EVENT_NONE, TEAM_NONE, true, type);
                    UpdateWorldState(BG_SA_GateStatus[type], GateStatus[type] = BG_SA_GO_GATES_DAMAGE);
                    break;
                case 19048:
                    SendWarningToAllSA(SA_EVENT_NONE, TEAM_NONE, true, type, true);
                    UpdateWorldState(BG_SA_GateStatus[type], GateStatus[type] = BG_SA_GO_GATES_DESTROY);
                    UpdatePlayerScore(player, SCORE_GATES_DESTROYED, 1);
                    RewardHonorToTeam(85, (teamIndex == 0) ? ALLIANCE : HORDE);
                    // make the central graveyard capturable
                    MakeInteractive(SA_EVENT_ADD_GRAVE_C, (GetDefender() == ALLIANCE) ? BG_SA_GRAVE_STATUS_ALLY_CONTESTED : BG_SA_GRAVE_STATUS_HORDE_CONTESTED, true);
                    SpawnEvent(SA_EVENT_ADD_PURPLE_SIGIL, 0, false);
                    break;
            }
            break;
        }
        case BG_SA_GO_GATES_RED_SUN:
        {
            type = BG_SA_GO_GATES_T_RED_SUN;
            switch (eventId)
            {
                case 21630:
                    if (!GateRedSunDamaged)
                    {
                        SendMessageSA(player, BG_SA_ATTACK, _GatesName(target_obj));
                        GateRedSunDamaged = true;
                    }
                    break;
                case 19042:
                    SendWarningToAllSA(SA_EVENT_NONE, TEAM_NONE, true, type);
                    UpdateWorldState(BG_SA_GateStatus[type], GateStatus[type] = BG_SA_GO_GATES_DAMAGE);
                    break;
                case 19047:
                    SendWarningToAllSA(SA_EVENT_NONE, TEAM_NONE, true, type, true);
                    UpdateWorldState(BG_SA_GateStatus[type], GateStatus[type] = BG_SA_GO_GATES_DESTROY);
                    UpdatePlayerScore(player, SCORE_GATES_DESTROYED, 1);
                    RewardHonorToTeam(85, (teamIndex == 0) ? ALLIANCE : HORDE);
                    // make the central graveyard capturable
                    MakeInteractive(SA_EVENT_ADD_GRAVE_C, (GetDefender() == ALLIANCE) ? BG_SA_GRAVE_STATUS_ALLY_CONTESTED : BG_SA_GRAVE_STATUS_HORDE_CONTESTED, true);
                    SpawnEvent(SA_EVENT_ADD_RED_SIGIL, 0, false);
                    break;
            }
            break;
        }
        case BG_SA_GO_GATES_YELLOW_MOON:
        {
            type = BG_SA_GO_GATES_T_YELLOW_MOON;
            switch (eventId)
            {
                case 21630:
                    if (!GateYellowMoonDamaged)
                    {
                        SendMessageSA(player, BG_SA_ATTACK, _GatesName(target_obj));
                        GateYellowMoonDamaged = true;
                    }
                    break;
                case 19044:
                    SendWarningToAllSA(SA_EVENT_NONE, TEAM_NONE, true, type);
                    UpdateWorldState(BG_SA_GateStatus[type], GateStatus[type] = BG_SA_GO_GATES_DAMAGE);
                    break;
                case 19049:
                    SendWarningToAllSA(SA_EVENT_NONE, TEAM_NONE, true, type, true);
                    UpdateWorldState(BG_SA_GateStatus[type], GateStatus[type] = BG_SA_GO_GATES_DESTROY);
                    UpdatePlayerScore(player, SCORE_GATES_DESTROYED, 1);
                    RewardHonorToTeam(85, (teamIndex == 0) ? ALLIANCE : HORDE);
                    SpawnEvent(SA_EVENT_ADD_YELLOW_SIGIL, 0, false);
                    break;
            }
            break;
        }
        case BG_SA_GO_TITAN_RELIC_A:
        case BG_SA_GO_TITAN_RELIC_H:
        {
            if (eventId == 20572 && player->GetTeam() != GetDefender())
            {
                if (!relicGateDestroyed)
                {
                    player->GetSession()->KickPlayer();
                    sLog.outError("Player %s has clicked SOTA Relic without Relic gate being destroyed", player->GetName());
                    return;
                }

                //Achievement Storm the Beach (1310)
                for (BattleGroundPlayerMap::const_iterator itr = GetPlayers().begin(); itr != GetPlayers().end(); ++itr)
                {
                    if (Player *plr = sObjectMgr.GetPlayer(itr->first))
                        if (plr->GetTeam() != defender)
                            plr->UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET, BG_SA_STORM_THE_BEACH);
                }

                if (Phase == SA_ROUND_ONE) // Victory at first round
                {
                    RoundScores[0].winner = GetDefender() == ALLIANCE ? HORDE : ALLIANCE;
                    RoundScores[0].time = Round_timer;
                    PlaySoundToAll(BG_SA_SOUND_GYD_VICTORY);
                    SendMessageToAll(defender == HORDE ? LANG_BG_SA_ALLIANCE_END_1ROUND : LANG_BG_SA_HORDE_END_1ROUND, CHAT_MSG_BG_SYSTEM_NEUTRAL, NULL);
                    SendWarningToAll(LANG_BG_SA_END_1ROUND);
                    RewardHonorToTeam(150, (teamIndex == 0) ? ALLIANCE : HORDE);
                    ResetBattle(player->GetTeam(), GetDefender());
                }
                else // Victory at second round
                {
                    RoundScores[1].winner = GetDefender() == ALLIANCE ? HORDE : ALLIANCE;
                    SendMessageToAll(defender == HORDE ? LANG_BG_SA_ALLIANCE_END_2ROUND : LANG_BG_SA_HORDE_END_2ROUND, CHAT_MSG_BG_SYSTEM_NEUTRAL, NULL);
                    RewardHonorToTeam(150, (teamIndex == 0) ? ALLIANCE : HORDE);
                    EndBattleGround(player->GetTeam());
                }
            }
            break;
        }
    }
}

void BattleGroundSA::HandleKillPlayer(Player* player, Player* killer)
{

    player->CastSpell(player, 52417, false);

    BattleGround::HandleKillPlayer(player, killer);
}

void BattleGroundSA::HandleKillUnit(Creature* unit, Player* killer)
{
    if (!unit)
        return;

    if (unit->GetEntry() == 28781) // Demolisher
    {
        UpdatePlayerScore(killer, SCORE_DEMOLISHERS_DESTROYED, 1);
        isDemolisherDestroyed[killer->GetTeam() == HORDE ? 0 : 1] = true;
    }
}

int32 BattleGroundSA::_GatesName(GameObject* obj)
{
    if (!obj)
        return 0;

    switch (obj->GetEntry())
    {
        case BG_SA_GO_GATES_ROOM_ANCIENT_SHRINE:  return LANG_BG_SA_GATE_ROOM_ANCIENT_SHRINE;
        case BG_SA_GO_GATES_GREEN_EMERALD:  return LANG_BG_SA_GATE_GREEN_EMERALD;
        case BG_SA_GO_GATES_BLUE_SAPHIRE:  return LANG_BG_SA_GATE_BLUE_SAPHIRE;
        case BG_SA_GO_GATES_MAUVE_AMETHYST:  return LANG_BG_SA_GATE_MAUVE_AMETHYST;
        case BG_SA_GO_GATES_RED_SUN:  return LANG_BG_SA_GATE_RED_SUN_;
        case BG_SA_GO_GATES_YELLOW_MOON:  return LANG_BG_SA_GATE_YELLOW_MOON;
        default:
            MANGOS_ASSERT(0);
            break;
    }
    return 0;
}

int32 BattleGroundSA::_GydName(uint8 gyd)
{
    switch (gyd)
    {
        case 0: return LANG_BG_SA_EAST_GRAVEYARD;
        case 1: return LANG_BG_SA_WEST_GRAVEYARD;
        case 2: return LANG_BG_SA_SOUTH_GRAVEYARD;
        default:
            MANGOS_ASSERT(0);
            break;
    }
    return 0;
}

WorldSafeLocsEntry const* BattleGroundSA::GetClosestGraveYard(Player* player)
{
    TeamIndex teamIndex = GetTeamIndex(player->GetTeam());

    // Is there any occupied node for this team?
    std::vector<uint8> gyd;
    for (uint8 i = 0; i <= BG_SA_GRY_MAX; ++i)
        // players should be able to ressurect at their faction's contested/occupied graveyards too
        if ((m_Gyd[i] == teamIndex + BG_SA_GRAVE_STATUS_CONTESTED) || (m_Gyd[i] == teamIndex + BG_SA_GRAVE_STATUS_OCCUPIED))
            gyd.push_back(i);

    WorldSafeLocsEntry const* good_entry = NULL;
    // If so, select the closest node to place ghost on
    if (!gyd.empty())
    {
        float plr_x = player->GetPositionX();
        float plr_y = player->GetPositionY();

        float mindist = 999999.0f;
        for (uint8 i = 0; i < gyd.size(); ++i)
        {
            WorldSafeLocsEntry const*entry = sWorldSafeLocsStore.LookupEntry(BG_SA_GraveyardIdsPhase[gyd[i]]);

            if (!entry)
                continue;

            float dist = (entry->x - plr_x)*(entry->x - plr_x)+(entry->y - plr_y)*(entry->y - plr_y);
            if (mindist > dist)
            {
                mindist = dist;
                good_entry = entry;
            }
        }
        gyd.clear();
    }
    // If not, place ghost on starting location
    if (!good_entry)
    {
        if (GetDefender() == HORDE)
        {
            if (teamIndex == 0)
                good_entry = sWorldSafeLocsStore.LookupEntry(BG_SA_GraveyardIds[1]);
            else
                good_entry = sWorldSafeLocsStore.LookupEntry(BG_SA_GraveyardIds[0]);
        }
        if (GetDefender() == ALLIANCE)
        {
            if (teamIndex == 0)
                good_entry = sWorldSafeLocsStore.LookupEntry(BG_SA_GraveyardIds[0]);
            else
                good_entry = sWorldSafeLocsStore.LookupEntry(BG_SA_GraveyardIds[1]);
        }
    }
    return good_entry;
}

void BattleGroundSA::_GydOccupied(uint8 node, Team team)
{
    if (node >= 0 && node < BG_SA_GRY_MAX)                                  // theres 4 defender graveyards, but the one at relic has no worldstate
    {
        UpdateWorldState(GrraveYardWS[node][0], team == HORDE ? 0 : 1);
        UpdateWorldState(GrraveYardWS[node][1], team == HORDE ? 1 : 0);
    }
    else
    {
        for (int8 i = 0; i < BG_SA_MAX_WS; ++i)
        {
            UpdateWorldState(BG_SA_WorldStatusH[i], (team == HORDE) ? 1 : 0);
            UpdateWorldState(BG_SA_WorldStatusA[i], (team == HORDE) ? 1 : 0);
        }
    }
}

void BattleGroundSA::SendWarningToAllSA(BG_SA_Events gyd, Team team, bool isDoor, BG_SA_GoType door, bool destroyed)
{
    if (!isDoor)
    {
        if (team == HORDE)
        {
            switch (gyd)
            {
                case SA_EVENT_ADD_GRAVE_E: SendWarningToAll(LANG_BG_SA_HORDE_EAST_CONQUESTED); break;
                case SA_EVENT_ADD_GRAVE_W: SendWarningToAll(LANG_BG_SA_HORDE_WEST_CONQUESTED); break;
                case SA_EVENT_ADD_GRAVE_C: SendWarningToAll(LANG_BG_SA_HORDE_SOUTH_CONQUESTED); break;
                default: sLog.outError("Error in SA strings: Unknown graveyard %u", gyd); break;
            }
        }
        else
        {
            switch (gyd)
            {
                case SA_EVENT_ADD_GRAVE_E: SendWarningToAll(LANG_BG_SA_ALLIANCE_EAST_CONQUESTED); break;
                case SA_EVENT_ADD_GRAVE_W: SendWarningToAll(LANG_BG_SA_ALLIANCE_WEST_CONQUESTED); break;
                case SA_EVENT_ADD_GRAVE_C: SendWarningToAll(LANG_BG_SA_ALLIANCE_SOUTH_CONQUESTED); break;
                default: sLog.outError("Error in SA strings: Unknown graveyard %u", gyd); break;
            }
        }
    }
    else
    {
        if (destroyed)
        {
            switch (door)
            {
                case BG_SA_GO_GATES_T_ROOM_ANCIENT_SHRINE: SendWarningToAll(LANG_BG_SA_GATE_ROOM_ANCIENT_SHRINE_DESTROYED); break;
                case BG_SA_GO_GATES_T_GREEN_EMERALD: SendWarningToAll(LANG_BG_SA_GATE_GREEN_EMERALD_DESTROYED); break;
                case BG_SA_GO_GATES_T_BLUE_SAPHIRE: SendWarningToAll(LANG_BG_SA_GATE_BLUE_SAPHIRE_DESTROYED); break;
                case BG_SA_GO_GATES_T_MAUVE_AMETHYST: SendWarningToAll(LANG_BG_SA_GATE_MAUVE_AMETHYST_DESTROYED); break;
                case BG_SA_GO_GATES_T_RED_SUN: SendWarningToAll(LANG_BG_SA_GATE_RED_SUN_DESTROYED); break;
                case BG_SA_GO_GATES_T_YELLOW_MOON: SendWarningToAll(LANG_BG_SA_GATE_YELLOW_MOON_DESTROYED); break;
                default:
                    sLog.outError("Error in SA strings: Unknown door %d", door); break;
            }
        }
        else
        {
            switch (door)
            {
                case BG_SA_GO_GATES_T_ROOM_ANCIENT_SHRINE: SendWarningToAll(LANG_BG_SA_GATE_ROOM_ANCIENT_SHRINE_DAMAGED); break;
                case BG_SA_GO_GATES_T_GREEN_EMERALD: SendWarningToAll(LANG_BG_SA_GATE_GREEN_EMERALD_DAMAGED); break;
                case BG_SA_GO_GATES_T_BLUE_SAPHIRE: SendWarningToAll(LANG_BG_SA_GATE_BLUE_SAPHIRE_DAMAGED); break;
                case BG_SA_GO_GATES_T_MAUVE_AMETHYST: SendWarningToAll(LANG_BG_SA_GATE_MAUVE_AMETHYST_DAMAGED); break;
                case BG_SA_GO_GATES_T_RED_SUN: SendWarningToAll(LANG_BG_SA_GATE_RED_SUN_DAMAGED); break;
                case BG_SA_GO_GATES_T_YELLOW_MOON: SendWarningToAll(LANG_BG_SA_GATE_YELLOW_MOON_DAMAGED); break;
                default:
                    sLog.outError("Error in SA strings: Unknown door %d", door); break;
            }
        }
    }
}

void BattleGroundSA::TeleportPlayerToCorrectLoc(Player *plr, bool resetBattle)
{
    if (!plr)
        return;

    if (resetBattle)
    {
        if (!plr->isAlive())
        {
            plr->ResurrectPlayer(1.0f);
            plr->SpawnCorpseBones();
        }

        plr->RemoveArenaAuras(true);
        plr->SetHealth(plr->GetMaxHealth());
        plr->SetPower(POWER_MANA, plr->GetMaxPower(POWER_MANA));
        plr->CombatStopWithPets(true);
    }

    if (!shipsStarted)
    {
        if (plr->GetTeam() != GetDefender())
        {
            if (urand(0,1))
                plr->TeleportTo(607, 2682.936f, -830.368f, 15.0f, 2.895f, 0);
            else
                plr->TeleportTo(607, 2577.003f, 980.261f, 15.0f, 0.807f, 0);

        }
        else
            plr->TeleportTo(607, 1209.7f, -65.16f, 70.1f, 0.0f, 0);
    }
    else if (GetStartTime() < (2 * MINUTE * IN_MILLISECONDS))
    {
        if (plr->GetTeam() != GetDefender())
        {
            if (urand(0,1))
                plr->TeleportTo(607, 1804.10f, -168.46f, 60.55f, 2.65f, 0);
            else
                plr->TeleportTo(607, 1803.71f, 118.61f, 59.83f, 3.56f, 0);
        }
        else
            plr->TeleportTo(607, 1209.7f, -65.16f, 70.1f, 0.0f, 0);
    }
    else
    {
        if (plr->GetTeam() != GetDefender())
        {
            if (urand(0,1))
                plr->TeleportTo(607, 1597.64f, -106.35f, 8.89f, 4.13f, 0);
            else
                plr->TeleportTo(607, 1606.61f, 50.13f, 7.58f, 2.39f, 0);
        }
        else
            plr->TeleportTo(607, 1209.7f, -65.16f, 70.1f, 0.0f, 0);
    }
    // AddPlayer is called before SetupShips, so this check is needed for the 1st round to prevent console spam
    if (shipsSpawned)
        SendTransportInit(plr);
}

void BattleGroundSA::SendTransportInit(Player *player)
{
    if (GetBGObject(BG_SA_BOAT_ONE) || GetBGObject(BG_SA_BOAT_TWO))
    {
        UpdateData transData;
        if (GetBGObject(BG_SA_BOAT_ONE))
            GetBGObject(BG_SA_BOAT_ONE)->BuildCreateUpdateBlockForPlayer(&transData, player);
        if (GetBGObject(BG_SA_BOAT_TWO))
            GetBGObject(BG_SA_BOAT_TWO)->BuildCreateUpdateBlockForPlayer(&transData, player);
        WorldPacket packet;
        transData.BuildPacket(&packet);
        player->GetSession()->SendPacket(&packet);
    }
}

void BattleGroundSA::SendTransportsRemove(Player * player)
{
    if (GetBGObject(BG_SA_BOAT_ONE) || GetBGObject(BG_SA_BOAT_TWO))
    {
        UpdateData transData;
        if (GetBGObject(BG_SA_BOAT_ONE))
            GetBGObject(BG_SA_BOAT_ONE)->BuildOutOfRangeUpdateBlock(&transData);
        if (GetBGObject(BG_SA_BOAT_TWO))
            GetBGObject(BG_SA_BOAT_TWO)->BuildOutOfRangeUpdateBlock(&transData);
        WorldPacket packet;
        transData.BuildPacket(&packet);
        player->GetSession()->SendPacket(&packet);
    }
}

uint32 BattleGroundSA::GetCorrectFactionSA(uint8 vehicleType) const
{
    switch(vehicleType)
    {
        case VEHICLE_BG_DEMOLISHER:
        {
            if (GetDefender() == ALLIANCE)
                return VEHICLE_FACTION_HORDE;
            else
                return VEHICLE_FACTION_ALLIANCE;
        }
        case VEHICLE_SA_CANNON:
        {
            if (GetDefender() == ALLIANCE)
                return VEHICLE_FACTION_ALLIANCE;
            else
                return VEHICLE_FACTION_HORDE;
        }
        default:
            return VEHICLE_FACTION_NEUTRAL;
    }
    return VEHICLE_FACTION_NEUTRAL;
}

bool BattleGroundSA::winSAwithAllWalls(Team team)
{
   if (GetDefender() != team)
        return false;

    bool allNotDestroyed = true;

    for (uint32 i = 0; i < BG_SA_GATE_MAX; ++i)
        if (GateStatus[i] == BG_SA_GO_GATES_DESTROY)
            allNotDestroyed = false;

    return allNotDestroyed;
}
