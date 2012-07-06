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

#ifndef WORLD_PVP_MGR_H
#define WORLD_PVP_MGR_H


#include "WorldPvP.h"
#include "Common.h"
#include "Policies/Singleton.h"
#include "../SharedDefines.h"
#include "Platform/Define.h"
#include "../Map.h"

class Player;
class GameObject;
class Creature;
class ZoneScript;
class WorldPvP;

class WorldPvPMgr
{
    public:
        WorldPvPMgr();
        ~WorldPvPMgr();

        // create world pvp events
        void InitWorldPvP();

        // called when a player enters an world pvp area
        void HandlePlayerEnterZone(Player* pPlayer, uint32 uiZoneId);

        // called when player leaves an world pvp area
        void HandlePlayerLeaveZone(Player* pPlayer, uint32 uiZoneId);

        // return assigned world pvp
        WorldPvP* GetWorldPvPToZoneId(uint32 uiZoneId);

        // return assigned zone script
        ZoneScript* GetZoneScript(uint32 uiZoneId);

        // add zone id to world pvp handler
        void AddZone(uint32 uiZoneId, WorldPvP* pScriptHandler);

        // add capture poit id to pvp handler
        void AddCapturePoint(uint32 uiPointId, WorldPvP* pScriptHandler);

        void Update(uint32);

        // Handle cases when a player drops a flag
        void HandleDropFlag(Player* pPlayer, uint32 uiSpellId);

        // Handle cases when a gameobject is used
        bool HandleObjectUse(Player* pPlayer, GameObject* pGo);

        // Handle the complete credit for capture point win events
        void HandleObjectiveComplete(GuidSet m_sObjectivePlayers, uint32 uiEventId);

        // Handle the kill event inside the area
        void HandlePlayerKill(Player* pPlayer, Unit* pVictim);

        // Handle capture point stuff
        float GetCapturePointSlider(uint32 uiEntry);
        void SetCapturePointSlider(uint32 uiEntry, float fValue) { m_CapturePointSlider[uiEntry] = fValue; }

        bool GetCapturePointLockState(uint32 uiEntry);
        void SetCapturePointLockState(uint32 uiEntry, bool bLockState) { m_CapturePointState[uiEntry] = bLockState; }

        typedef std::vector<WorldPvP*> WorldPvPSet;
        typedef std::map<uint32 /* zoneid */, WorldPvP*> WorldPvPMap;

    private:
        // contains all initiated world pvp events
        // used when initing / cleaning up
        WorldPvPSet m_WorldPvPSet;

        // maps the zone ids to an world pvp event
        // used in player event handling
        WorldPvPMap m_WorldPvPMap;

        std::map<uint32 /*capture point entry*/, float /*capture ticks*/> m_CapturePointSlider;
        std::map<uint32 /*capture point entry*/, bool /*is active*/> m_CapturePointState;

        // update interval
        IntervalTimer m_UpdateTimer;
};

#define sWorldPvPMgr MaNGOS::Singleton<WorldPvPMgr>::Instance()

#endif
