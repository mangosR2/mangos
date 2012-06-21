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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

#ifndef OUTDOOR_PVP_H
#define OUTDOOR_PVP_H

#include "WorldPvPMgr.h"
#include "../Language.h"
#include "../World.h"
#include "../ZoneScript.h"
#include "../Player.h"
#include "Common.h"
#include "Policies/Singleton.h"
#include "../SharedDefines.h"
#include "../GameObject.h"
#include "../ObjectMgr.h"


enum WorldPvPTypes
{
    WORLD_PVP_TYPE_SI = 1,
    WORLD_PVP_TYPE_EP,
    WORLD_PVP_TYPE_HP,
    WORLD_PVP_TYPE_ZM,
    WORLD_PVP_TYPE_TF,
    WORLD_PVP_TYPE_NA,
    WORLD_PVP_TYPE_GH,
};

enum GameObjectArtKits
{
    GO_ARTKIT_BANNER_ALLIANCE               = 2,
    GO_ARTKIT_BANNER_HORDE                  = 1,
    GO_ARTKIT_BANNER_NEUTRAL                = 21,
};

enum CaptureState
{
    NEUTRAL     = 0,
    PROGRESS    = 1,
    CONTESTED   = 2,
    WIN         = 3
};

class WorldPvP : public ZoneScript
{
    friend class WorldPvPMgr;

    public:
        WorldPvP() {}
        virtual ~WorldPvP() {}

        // called when the zone is initialized
        virtual void FillInitialWorldStates(WorldPacket& /*data*/, uint32& /*count*/) {}

        // called when a player triggers an areatrigger
        virtual bool HandleAreaTrigger(Player* /*pPlayer*/, uint32 /*uiTriggerId*/) { return false; }

        // called when a playerd drops a flag
        virtual bool HandleDropFlag(Player* /*pPlayer*/, uint32 /*uiSpellId*/) { return false; }

        // called when a playerd uses a gameobject related to world pvp events
        virtual bool HandleObjectUse(Player* /*pPlayer*/, GameObject* /*pGo*/) { return false; }

        // handle npc/player kill
        virtual void HandlePlayerKillInsideArea(Player* /*pKiller*/, Unit* /*pVictim*/) {}

        // handle capture objective complete
        virtual void HandleObjectiveComplete(ObjectGuidSet /*m_sObjectivePlayers*/, uint32 /*uiEventId*/) {}

        // init all the outdoor pvp area relates stuff
        virtual bool InitWorldPvPArea() { return false; }

        // send world state update to all players present
        void SendUpdateWorldState(uint32 field, uint32 value);

        // awards rewards for player kill
        virtual void AwardKillBonus(Player* /*pPlayer*/) {}

        // update - called by the WorldPvPMgr
        virtual void Update(uint32 diff) {}

        // applies buff to a team inside the specific zone
        void DoProcessTeamBuff(Team uiTeam, uint32 spellId, bool bRemove = false);

        // return outdoor pvp type
        uint32 GetTypeId() { return m_uiTypeId; }

        // Get a Player from the zone
        Player* GetPlayerInZone(bool bOnlyAlive = false, bool bCanBeGamemaster = true);
    protected:
        // Player related stuff
        virtual void HandlePlayerEnterZone(Player* pPlayer);
        virtual void HandlePlayerLeaveZone(Player* pPlayer);
        virtual void HandlePlayerKill(Player* pKiller, Unit* pVictim);

        // remove world states
        virtual void SendRemoveWorldStates(Player* pPlayer) {}

        void RegisterZone(uint32 zoneId);
        bool HasPlayer(Player* pPlayer) const;
        void LockCapturePoint(uint32 pointEntry, bool isLocked);
        void ResetCapturePoint(uint32 pointEntry, float fValue);

        // store the players inside the area depending on the faction
        ObjectGuidSet m_sZonePlayers;

        uint32 m_uiTypeId;
};

#endif
