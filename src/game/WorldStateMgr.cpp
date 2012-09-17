/*
 * Copyright (C) 2011-2012 /dev/rsa for MangosR2 <http://github.com/mangosR2>
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

#include "Map.h"
#include "World.h"
#include "WorldStateMgr.h"
#include "ProgressBar.h"
#include "Player.h"
#include "GameObject.h"
#include "GridNotifiers.h"
#include "SQLStorages.h"
#include "BattleGround/BattleGroundMgr.h"
#include "GridNotifiers.h"
#include "CellImpl.h"

INSTANTIATE_SINGLETON_1(WorldStateMgr);

void WorldStateMgr::Initialize()
{
    // for reload case - cleanup states first
    m_worldStateTemplates.clear();
    // Load some template types
    LoadTemplatesFromDB();
    LoadTemplatesFromObjectTemplateDB();
    // DBC templates loaded after DB - may be corrected in database
    LoadTemplatesFromDBC();
    // Load states data
    LoadFromDB();
    // Create all needed states (if not loaded)
    CreateWorldStatesIfNeed();
};

void WorldStateMgr::Update()
{
    {
        // Update part 1 - calculating (and mark for cleanup)
        ReadGuard guard(GetLock());
        for (WorldStateMap::iterator itr = m_worldState.begin(); itr != m_worldState.end(); ++itr)
        {
            WorldState* state = &itr->second;

            if (!state)
                continue;

            switch (state->GetType())
            {
                case WORLD_STATE_TYPE_BGWEEKEND:
                {
                    for (uint32 i = 1; i < sBattlemasterListStore.GetNumRows(); ++i)
                    {
                        BattlemasterListEntry const * bl = sBattlemasterListStore.LookupEntry(i);
                        if (bl && bl->HolidayWorldStateId == state->GetId())
                        {
                            if (BattleGroundMgr::IsBGWeekend(BattleGroundTypeId(bl->id)))
                                state->SetValue(WORLD_STATE_ADD);
                            else
                                state->SetValue(WORLD_STATE_REMOVE);
                        }
                    }
                    break;
                }
                case WORLD_STATE_TYPE_CUSTOM:
                case WORLD_STATE_TYPE_WORLD:
                case WORLD_STATE_TYPE_EVENT:
                case WORLD_STATE_TYPE_MAP:
                case WORLD_STATE_TYPE_ZONE:
                case WORLD_STATE_TYPE_AREA:
                case WORLD_STATE_TYPE_BATTLEGROUND:
                case WORLD_STATE_TYPE_CAPTURE_POINT:
                case WORLD_STATE_TYPE_WORLD_UNCOMMON:
                case WORLD_STATE_TYPE_DESTRUCTIBLE_OBJECT:
                default:
                    break;
            }

            if (state->GetRenewTime() < time(NULL) - (time_t)sWorld.getConfig(CONFIG_UINT32_WORLD_STATE_EXPIRETIME))
            {
                if (state->HasFlag(WORLD_STATE_FLAG_NOT_EXPIREABLE))
                    continue;

                if (state->HasFlag(WORLD_STATE_FLAG_INITIAL_STATE))
                {
                    state->Initialize();
                    continue;
                }

                state->RemoveFlag(WORLD_STATE_FLAG_ACTIVE);
                state->AddFlag(WORLD_STATE_FLAG_DELETED);
            }
        }
    }

    // Saving data (and DB cleanup)
    SaveToDB();

    {
        // Update part 2 - remove states with WORLD_STATE_FLAG_DELETED flag
        WriteGuard guard(GetLock());
        for (WorldStateMap::iterator itr = m_worldState.begin(); itr != m_worldState.end();)
        {
            if (itr->second.HasFlag(WORLD_STATE_FLAG_DELETED))
                m_worldState.erase(itr++);
            else
                ++itr;
        }
    }

};

void WorldStateMgr::LoadTemplatesFromDBC()
{
    uint32 count = 0;
    for (uint32 i = 1; i < sBattlemasterListStore.GetNumRows(); ++i)
    {
        BattlemasterListEntry const * bl = sBattlemasterListStore.LookupEntry(i);
        if (bl && bl->HolidayWorldStateId)
        {
            m_worldStateTemplates.insert(WorldStateTemplateMap::value_type(bl->HolidayWorldStateId, 
                WorldStateTemplate(bl->HolidayWorldStateId, WORLD_STATE_TYPE_BGWEEKEND, WORLD_STATE_TYPE_BGWEEKEND, (1 << WORLD_STATE_FLAG_INITIAL_STATE), BattleGroundMgr::IsBGWeekend(BattleGroundTypeId(bl->id)) ? 1 : 0, 0, 0)));
            ++count;
        }
    }

    for (uint32 i = 0; i < sWorldStateStore.GetNumRows(); ++i)
    {
        WorldStateEntry const* wsEntry = sWorldStateStore.LookupEntry(i);

        if (!wsEntry)
            continue;

        WorldStateType type = WORLD_STATE_TYPE_CUSTOM;

        uint32 id = wsEntry->m_state;

        if (!id)
            continue;

        uint32 stateId   = 0;
        uint32 condition = 0;
        uint32 phasemask = wsEntry->m_flags;

        WorldStatesLinkedSet linkedList;

        if (wsEntry->m_uiType == "CAPTUREPOINT")
        {
            stateId = id;
            type = WORLD_STATE_TYPE_CAPTURE_POINT;
            uint32 condition = 0;
            linkedList.insert(wsEntry->m_linked1);
            linkedList.insert(wsEntry->m_linked2);
        }
        else if (wsEntry->map_id && !wsEntry->m_zone)
        {
            stateId = id;
            condition = wsEntry->map_id;
            type = WORLD_STATE_TYPE_MAP;
        }
        else if (wsEntry->m_zone)
        {
            stateId = id;
            condition = wsEntry->m_zone;
            type = WORLD_STATE_TYPE_ZONE;
        }
        else if (!wsEntry->map_id && !wsEntry->m_zone)
        {
            stateId = id;
            condition = wsEntry->m_flags;   // Phase currently
            type = WORLD_STATE_TYPE_EVENT;
        }
        else
        {
            sLog.outErrorDb("WorldStateMgr::LoadTemplatesFromDBC unhandled template %u!",id);
            continue;
        }

        // parse linked worldstates here
        std::string message = wsEntry->m_uiMessage1[sWorld.GetDefaultDbcLocale()];
        if (!message.empty())
        {
            std::string::size_type pos1, pos2;
            pos1 = message.find_first_of("%");
            pos2 = message.find_first_of("w", pos1);
            while (pos1 != std::string::npos && pos2 != std::string::npos)
            {
                pos1 = message.find_first_of("%");
                pos2 = message.find_first_of("w", pos1);
                if ((pos2 - pos1) == 5)
                {
                    std::string digits = message.substr(pos1+1, 4);
                    uint32 linkedId = atoi(digits.c_str());
                    if (linkedId)
                        linkedList.insert(linkedId);
                }
                message.erase(0,pos2+1);
            }
        }

        WorldStateTemplate const* tmpl = FindTemplate(stateId, type, condition);

        if (type != WORLD_STATE_TYPE_CUSTOM)
        {
            if (!tmpl)
            {
                m_worldStateTemplates.insert(WorldStateTemplateMap::value_type(stateId,
                    WorldStateTemplate(stateId, type, condition, (1 << WORLD_STATE_FLAG_INITIAL_STATE), 0, 0, phasemask)));
                ++count;
            }
            else
            {
                const_cast<WorldStateTemplate*>(tmpl)->m_phasemask |= phasemask;
            }

            tmpl = FindTemplate(stateId, type, condition);
            MANGOS_ASSERT(tmpl);

            if (!linkedList.empty())
            {
                for (WorldStatesLinkedSet::const_iterator itr = linkedList.begin(); itr != linkedList.end(); ++itr)
                {
                    uint32 linkedstateId = *itr;
                    if (!linkedstateId || linkedstateId == stateId)
                        continue;

                    // Check linked templates
                    WorldStateTemplate const* downlinktmpl = FindTemplate(linkedstateId, type, condition);
                    if (downlinktmpl)
                    {
                        if (downlinktmpl->m_linkedId != stateId)
                        {
                            sLog.outDetail("WorldStateMgr::LoadTemplatesFromDBC template %u present, but linked to %u instead of %u (condition %u) in DBC, %s!",
                                linkedstateId, downlinktmpl->m_linkedId, stateId, condition, downlinktmpl->m_linkedId ? "need correct" : "corrected");

                            if (downlinktmpl->m_linkedId == 0)
                            {
                                const_cast<WorldStateTemplate*>(tmpl)->m_linkedList.insert(linkedstateId);
                                const_cast<WorldStateTemplate*>(downlinktmpl)->m_linkedId = stateId;
                            }
                        }
                    }
                    else
                    {
                        m_worldStateTemplates.insert(WorldStateTemplateMap::value_type(linkedstateId,
                            WorldStateTemplate(linkedstateId, type, condition, (1 << WORLD_STATE_FLAG_INITIAL_STATE), 0, stateId, tmpl->m_phasemask)));
                        ++count;
                        const_cast<WorldStateTemplate*>(tmpl)->m_linkedList.insert(linkedstateId);
                    }
                }
            }
        }

    }
    sLog.outString();
    sLog.outString( ">> Loaded static DBC templates for %u WorldStates", count);
};

void WorldStateMgr::LoadTemplatesFromDB()
{
    //                                                        0       1            2        3          4            5
    QueryResult* result = WorldDatabase.Query("SELECT `state_id`, `type`, `condition`, `flags`, `default`, `linked_id` FROM `worldstate_template`");
    if (!result)
    {
        sLog.outString(">> Table worldstate_template is empty:");
        sLog.outString();
        return;
    }

    std::map<uint32, WorldStatesLinkedSet> m_worldStateLink;
    uint32 count = 0;
    uint32 count2 = 0;
    BarGoLink bar((int)result->GetRowCount());
    do
    {
        Field* fields = result->Fetch();

        bar.step();

        uint32   stateId        = fields[0].GetUInt32();
        uint32   type           = fields[1].GetUInt32();
        uint32   condition      = fields[2].GetUInt32();
        uint32   flags          = fields[3].GetUInt32();
        uint32   default_value  = fields[4].GetUInt32();
        uint32   linkedId       = fields[5].GetUInt32();
        //uint32   phasemask       = fields[6].GetUInt32();

        // Store the state data
        m_worldStateTemplates.insert(WorldStateTemplateMap::value_type(stateId, WorldStateTemplate(stateId, type, condition, flags, default_value, linkedId, 0 /*phasemask*/)));


        ++count;
    }
    while (result->NextRow());

    for (WorldStateTemplateMap::const_iterator itr = m_worldStateTemplates.begin(); itr != m_worldStateTemplates.end(); ++itr)
    {
        if (itr->second.m_linkedId != 0)
        {
            if (WorldStateTemplate const* tmpl = FindTemplate(itr->second.m_linkedId, itr->second.m_stateType, itr->second.m_condition))
            {
                const_cast<WorldStateTemplate*>(tmpl)->m_linkedList.insert(itr->second.m_stateId);
                ++count2;
            }
        }
    }

    sLog.outString();
    sLog.outString( ">> Loaded static templates for %u WorldStates, %u - with uplinks", count, count2);
    delete result;

};

void WorldStateMgr::LoadTemplatesFromObjectTemplateDB()
{
    //                                                     0  
    QueryResult* result = WorldDatabase.PQuery("SELECT `entry` FROM `gameobject_template` WHERE `type` = %u",(uint32)GAMEOBJECT_TYPE_CAPTURE_POINT);
    if (!result)
    {
        sLog.outString(">> No templates for object type 29 found in DB!");
        sLog.outString();
        return;
    }
    uint32 count = 0;
    BarGoLink bar((int)result->GetRowCount());
    do
    {
        Field* fields = result->Fetch();

        bar.step();

        uint32   goEntry        = fields[0].GetUInt32();

        GameObjectInfo const* goInfo = sGOStorage.LookupEntry<GameObjectInfo>(goEntry);
        if (!goInfo)
            continue;

        // setup state 1
        if (!goInfo->capturePoint.worldState1)
            continue;

        m_worldStateTemplates.insert(WorldStateTemplateMap::value_type(goInfo->capturePoint.worldState1,
            WorldStateTemplate(goInfo->capturePoint.worldState1, WORLD_STATE_TYPE_CAPTURE_POINT, goEntry, (1 << WORLD_STATE_FLAG_ACTIVE), WORLD_STATE_ADD, 0, PHASEMASK_NONE)));
        ++count;

        WorldStateTemplate* tmpl = const_cast<WorldStateTemplate*>(FindTemplate(goInfo->capturePoint.worldState1,WORLD_STATE_TYPE_CAPTURE_POINT, goEntry));
        if (!tmpl)
            continue;

        // setup state 2
        if (!goInfo->capturePoint.worldState2)
            continue;

        m_worldStateTemplates.insert(WorldStateTemplateMap::value_type(goInfo->capturePoint.worldState2,
            WorldStateTemplate(goInfo->capturePoint.worldState2, WORLD_STATE_TYPE_CAPTURE_POINT, goEntry, (1 << WORLD_STATE_FLAG_ACTIVE), CAPTURE_SLIDER_NEUTRAL, goInfo->capturePoint.worldState1, PHASEMASK_NONE)));
        tmpl->m_linkedList.insert(goInfo->capturePoint.worldState2);
        ++count;

        // setup state 3
        if (!goInfo->capturePoint.worldState3)
            continue;

        m_worldStateTemplates.insert(WorldStateTemplateMap::value_type(goInfo->capturePoint.worldState3,
            WorldStateTemplate(goInfo->capturePoint.worldState3, WORLD_STATE_TYPE_CAPTURE_POINT, goEntry, (1 << WORLD_STATE_FLAG_ACTIVE), goInfo->capturePoint.neutralPercent, goInfo->capturePoint.worldState1, PHASEMASK_NONE)));
        tmpl->m_linkedList.insert(goInfo->capturePoint.worldState3);
        ++count;
    }
    while (result->NextRow());

    sLog.outString();
    sLog.outString( ">> Loaded static templates for %u GAMEOBJECT_TYPE_CAPTURE_POINT linked WorldStates", count);
    delete result;

};

void WorldStateMgr::LoadFromDB()
{
    // cannot be reloaded!
    m_worldState.clear();
    //                                                            0           1       2            3        4        5            6
    QueryResult* result = CharacterDatabase.Query("SELECT `state_id`, `instance`, `type`, `condition`, `flags`, `value`, `renewtime` FROM `worldstate_data`");

    if (!result)
    {
        sLog.outString(">> Table worldstate_data is empty:");
        sLog.outString();
        return;
    }

    BarGoLink bar((int)result->GetRowCount());
    do
    {
        Field* fields = result->Fetch();

        bar.step();

        uint32   stateId        = fields[0].GetUInt32();
        uint32   instanceId     = fields[1].GetUInt32();
        uint32   type           = fields[2].GetUInt32();
        uint32   condition      = fields[3].GetUInt32();
        uint32   flags          = fields[4].GetUInt32();
        uint32   _value         = fields[5].GetUInt32();
        time_t   renewtime      = time_t(fields[6].GetUInt64());

        // Store the state data
        WorldStateTemplate const* tmpl = FindTemplate(stateId, type, condition);
        if (tmpl)
        {
            // Some worldstates loaded after creating (linked). need only set value.
            if (WorldState const* state  = GetWorldState(tmpl, instanceId))
            {
                if (state->GetValue() != _value)
                    const_cast<WorldState*>(state)->SetValue(_value);
            }
            else
                m_worldState.insert(WorldStateMap::value_type(stateId, WorldState(tmpl, instanceId, flags, _value, renewtime)));
        }
        else if (type == WORLD_STATE_TYPE_CUSTOM)
        {
            DEBUG_FILTER_LOG(LOG_FILTER_DB_STRICTED_CHECK,"WorldStateMgr::LoadFromDB loaded custom state %u (%u %u %u %u %u %ld)",
                stateId, instanceId, type, condition, flags, _value, renewtime);
            m_worldState.insert(WorldStateMap::value_type(stateId, WorldState(stateId, instanceId, flags, _value, renewtime)));
        }
        else
        {
            sLog.outError("WorldStateMgr::LoadFromDB unknown state %u (%u %u %u %u %u %ld)",
                stateId, instanceId, type, condition, flags, _value, renewtime);
        }
    }
    while (result->NextRow());

    sLog.outString();
    sLog.outString( ">> Loaded data for %u WorldStates", m_worldState.size());
    delete result;

}

void WorldStateMgr::CreateWorldStatesIfNeed()
{
    for (WorldStateTemplateMap::const_iterator itr = m_worldStateTemplates.begin(); itr != m_worldStateTemplates.end(); ++itr)
    {
        if (itr->second.HasFlag(WORLD_STATE_FLAG_INITIAL_STATE) &&
            (itr->second.m_stateType == WORLD_STATE_TYPE_WORLD ||
            itr->second.m_stateType == WORLD_STATE_TYPE_BGWEEKEND))
        {
            if (GetWorldState(&itr->second, 0))
                continue;

            CreateWorldState(&itr->second, 0);
        }
    }
}

void WorldStateMgr::CreateLinkedWorldStatesIfNeed(WorldObject* object)
{
    if (!object)
        return;

    ObjectGuid guid = object->GetObjectGuid();
    uint32 instanceId = guid ? guid.GetCounter() : 0;

    switch (guid.GetHigh())
    {
        case HIGHGUID_GAMEOBJECT:
        {
            GameObjectInfo const* goInfo = sGOStorage.LookupEntry<GameObjectInfo>(guid.GetEntry());
            switch (goInfo->type)
            {
                case GAMEOBJECT_TYPE_CAPTURE_POINT:
                {
                    // state 1
                    if (goInfo->capturePoint.worldState1)
                    {
                        WorldState const* _state = NULL;
                        WorldStateTemplate const* tmpl = FindTemplate(goInfo->capturePoint.worldState1, WORLD_STATE_TYPE_CAPTURE_POINT, goInfo->id);
                        MANGOS_ASSERT(tmpl);
                        if (_state  = GetWorldState(tmpl, instanceId))
                        {
                            if (_state->GetValue() != WORLD_STATE_ADD)
                                DEBUG_LOG("WorldStateMgr::CreateLinkedWorldStatesIfNeed Warning - at load WorldState %u for %s current value %u not equal default %u!", 
                                    goInfo->capturePoint.worldState1,
                                    guid.GetString().c_str(),
                                    _state->GetValue(),
                                    WORLD_STATE_ADD
                                );
                        }
                        else
                            _state = CreateWorldState(tmpl, instanceId);

                        const_cast<WorldState*>(_state)->SetLinkedGuid(guid);
                    }

                    // state 2
                    if (goInfo->capturePoint.worldState2)
                    {
                        WorldState const* _state = NULL;
                        WorldStateTemplate const* tmpl = FindTemplate(goInfo->capturePoint.worldState2, WORLD_STATE_TYPE_CAPTURE_POINT, goInfo->id);
                        MANGOS_ASSERT(tmpl);
                        if (_state  = GetWorldState(tmpl, instanceId))
                        {
                            if (_state->GetValue() != CAPTURE_SLIDER_NEUTRAL)
                                DEBUG_LOG("WorldStateMgr::CreateLinkedWorldStatesIfNeed Warning - at load WorldState %u for %s current value %u not equal default %u!", 
                                    goInfo->capturePoint.worldState2,
                                    guid.GetString().c_str(),
                                    _state->GetValue(),
                                    CAPTURE_SLIDER_NEUTRAL
                                );
                        }
                        else
                             _state = CreateWorldState(tmpl, instanceId);

                        const_cast<WorldState*>(_state)->SetLinkedGuid(guid);
                    }

                    // state 3
                    if (goInfo->capturePoint.worldState3)
                    {
                        WorldState const* _state = NULL;
                        WorldStateTemplate const* tmpl = FindTemplate(goInfo->capturePoint.worldState3, WORLD_STATE_TYPE_CAPTURE_POINT, goInfo->id);
                        MANGOS_ASSERT(tmpl);
                        if (_state  = GetWorldState(tmpl, instanceId))
                        {
                            if (_state->GetValue() != goInfo->capturePoint.neutralPercent)
                                DEBUG_LOG("WorldStateMgr::CreateLinkedWorldStatesIfNeed Warning - at load WorldState %u for %s current value %u not equal default %u!", 
                                    goInfo->capturePoint.worldState3,
                                    guid.GetString().c_str(),
                                    _state->GetValue(),
                                    goInfo->capturePoint.neutralPercent
                                );
                        }
                        else
                            _state = CreateWorldState(tmpl, instanceId);

                        const_cast<WorldState*>(_state)->SetLinkedGuid(guid);
                    }
                    break;
                }
                case GAMEOBJECT_TYPE_DESTRUCTIBLE_BUILDING:
                {
                    if (CheckWorldState(goInfo->destructibleBuilding.linkedWorldState))
                    {
                        WorldState const* _state = NULL;
                        WorldStateTemplate const* tmpl = FindTemplate(goInfo->destructibleBuilding.linkedWorldState, WORLD_STATE_TYPE_DESTRUCTIBLE_OBJECT, object->GetZoneId());
                        MANGOS_ASSERT(tmpl);
                        if (_state  = GetWorldState(tmpl, instanceId))
                        {
                            if (_state->GetValue() != OBJECT_STATE_NONE)
                                DEBUG_LOG("WorldStateMgr::CreateLinkedWorldStatesIfNeed Warning - at load WorldState %u for %s current value %u not equal default %u!", 
                                    goInfo->destructibleBuilding.linkedWorldState,
                                    guid.GetString().c_str(),
                                    _state->GetValue(),
                                    OBJECT_STATE_NONE
                                );
                        }
                        else
                            _state = CreateWorldState(tmpl, instanceId);

                        if (_state)
                            const_cast<WorldState*>(_state)->SetLinkedGuid(guid);
                        else
                            sLog.outDetail("WorldStateMgr::CreateLinkedWorldStatesIfNeed unsupported state id %u for %s found",goInfo->destructibleBuilding.linkedWorldState, guid.GetString().c_str());
                    }
                    else
                        return;
                    break;
                }
                default:
                {
                    sLog.outError("WorldStateMgr::CreateLinkedWorldStatesIfNeed try create linked WorldStates for %s, but currently this GameObject type (%u) not supported!", guid.GetString().c_str(), goInfo->type);
                    break;
                }
            }
            break;
        }
        case HIGHGUID_UNIT:
        case HIGHGUID_VEHICLE:
        case HIGHGUID_PET:
        case HIGHGUID_PLAYER:
        default:
            sLog.outError("WorldStateMgr::CreateLinkedWorldStatesIfNeed try create linked WorldStates for %s, but currently this object type %u not supported!", guid.GetString().c_str(), object->GetTypeId());
            return;
    }
    DEBUG_LOG("WorldStateMgr::CreateLinkedWorldStatesIfNeed created linked WorldState(s) for %s", object->GetObjectGuid().GetString().c_str());
}

void WorldStateMgr::SaveToDB()
{
    CharacterDatabase.BeginTransaction();
    for (WorldStateMap::iterator iter = m_worldState.begin(); iter != m_worldState.end(); ++iter)
    {
        if (!iter->second.HasFlag(WORLD_STATE_FLAG_SAVED))
            Save(&iter->second);
    }
    CharacterDatabase.CommitTransaction();
}

void WorldStateMgr::Save(WorldState const* state)
{
    ReadGuard guard(GetLock());
    static SqlStatementID wsDel;

    SqlStatement stmt = CharacterDatabase.CreateStatement(wsDel, "DELETE FROM `worldstate_data` WHERE `state_id` = ? AND `instance` = ?");
    stmt.PExecute(state->GetId(), state->GetInstance());

    if (!state->HasFlag(WORLD_STATE_FLAG_DELETED))
    {
        static SqlStatementID wsSave;
        SqlStatement stmt1 = CharacterDatabase.CreateStatement(wsSave, "INSERT INTO `worldstate_data` (`state_id`, `instance`, `type`, `condition`, `flags`, `value`, `renewtime`) VALUES (?,?,?,?,?,?,?)");

        const_cast<WorldState*>(state)->AddFlag(WORLD_STATE_FLAG_SAVED);

        stmt1.addUInt32(state->GetId());
        stmt1.addUInt32(state->GetInstance());
        stmt1.addUInt32(state->GetType());
        stmt1.addUInt32(state->GetCondition());
        stmt1.addUInt32(state->GetFlags());
        stmt1.addUInt32(state->GetValue());
        stmt1.addUInt64(state->GetRenewTime());
        stmt1.Execute();
    }
}

void WorldStateMgr::DeleteWorldState(WorldState* state)
{
    if (!state)
        return;

    static SqlStatementID wsDel;

    SqlStatement stmt = CharacterDatabase.CreateStatement(wsDel, "DELETE FROM `worldstate_data` WHERE `state_id` = ? AND `instance` = ?");
    stmt.PExecute(state->GetId(), state->GetInstance());

    WriteGuard guard(GetLock());
    for (WorldStateMap::iterator iter = m_worldState.begin(); iter != m_worldState.end();)
    {
        if (&iter->second == state)
        {
            // currently not need remove states immediately, remove his in World update cycle.
            //m_worldState.erase(iter++);
            iter->second.RemoveFlag(WORLD_STATE_FLAG_ACTIVE);
            iter->second.AddFlag(WORLD_STATE_FLAG_DELETED);
            break;
        }
        else
            ++iter;
    }
}

WorldStateTemplate const* WorldStateMgr::FindTemplate(uint32 stateId, uint32 type, uint32 condition, uint32 linkedId)
{
    ReadGuard guard(GetLock());

    if (type == WORLD_STATE_TYPE_MAX && condition == 0 && linkedId == 0 && ((int)m_worldStateTemplates.count(stateId) > 1))
    {
        sLog.outError("WorldStateMgr::FindTemplate tru find template with simple rules, but in DB not one template Id %u!", stateId);
        return NULL;
    }

    WorldStateTemplateBounds bounds = m_worldStateTemplates.equal_range(stateId);

    if (bounds.first == bounds.second)
        return NULL;

    for (WorldStateTemplateMap::const_iterator iter = bounds.first; iter != bounds.second; ++iter)
    {
        if (iter->second.m_stateId == stateId
            && (type == WORLD_STATE_TYPE_MAX || iter->second.m_stateType == type)
            && (condition == 0 || iter->second.m_condition == condition)
            && (linkedId == 0 || iter->second.m_linkedId == linkedId))
            return &iter->second;
    }
    return NULL;
};

void WorldStateMgr::MapUpdate(Map* map)
{
//    if (!map)
//        return;

    // Currently this part disabled
    if (true)
        return;

    for (WorldStateMap::iterator itr = m_worldState.begin(); itr != m_worldState.end(); ++itr)
    {
        WorldState* state = &itr->second;

        if (!state || !IsFitToCondition(map, state))
            continue;

        switch (state->GetType())
        {
            case WORLD_STATE_TYPE_CAPTURE_POINT:
            {
                break;
            }
            case WORLD_STATE_TYPE_MAP:
            case WORLD_STATE_TYPE_BATTLEGROUND:
            {
                break;
            }
            case WORLD_STATE_TYPE_ZONE:
            case WORLD_STATE_TYPE_AREA:
            {
                for (GuidSet::const_iterator itr = state->GetClients().begin(); itr != state->GetClients().end();)
                {
                    Player* player = map->GetPlayer(*itr);
                    if (!player || !player->IsInWorld())
                    {
                        state->RemoveClient(*itr);
                    }
                    else
                    {
                        uint32 zone, area;
                        player->GetZoneAndAreaId(zone, area);
                        if (state->GetType() == WORLD_STATE_TYPE_ZONE && state->GetCondition() != zone)
                        {
                            // send state clean here
                            state->RemoveClient(*itr);
                        }
                        else if (state->GetType() == WORLD_STATE_TYPE_AREA && state->GetCondition() != area)
                        {
                            // send state clean here
                            state->RemoveClient(*itr);
                        }
                        else
                            ++itr;
                    }
                }
                break;
            }
            case WORLD_STATE_TYPE_EVENT:
            case WORLD_STATE_TYPE_BGWEEKEND:
            case WORLD_STATE_TYPE_CUSTOM:
            case WORLD_STATE_TYPE_WORLD:
            case WORLD_STATE_TYPE_WORLD_UNCOMMON:
            default:
                break;
        }
    }
}

WorldStateSet WorldStateMgr::GetWorldStatesFor(Player* player, uint32 flags)
{
    WorldStateSet statesSet;
    statesSet.clear();

    bool bFull = player ? !player->IsInWorld() : true;

    ReadGuard guard(GetLock());
    for (WorldStateMap::iterator itr = m_worldState.begin(); itr != m_worldState.end(); ++itr)
    {
        if (itr->second.GetFlags() & flags)
            if (bFull || IsFitToCondition(player, &itr->second))
                statesSet.push_back(&itr->second);
    }
    return statesSet;
};

WorldStateSet WorldStateMgr::GetUpdatedWorldStatesFor(Player* player, time_t updateTime)
{
    WorldStateSet statesSet;
    statesSet.clear();

    ReadGuard guard(GetLock());
    for (WorldStateMap::iterator itr = m_worldState.begin(); itr != m_worldState.end(); ++itr)
    {
            if (itr->second.HasFlag(WORLD_STATE_FLAG_ACTIVE) && 
                itr->second.GetRenewTime() >= updateTime &&
                itr->second.GetRenewTime() != time(NULL) &&
                IsFitToCondition(player, &itr->second))
                {
                    // Always send UpLinked worldstate with own chains
                    // Attention! possible need sent ALL linked chain in this case. need tests.
                    if (itr->second.GetTemplate() && itr->second.GetTemplate()->m_linkedId)
                        if (WorldStateTemplate const* tmpl = FindTemplate(itr->second.GetTemplate()->m_linkedId, itr->second.GetType(), itr->second.GetCondition()))
                            if (WorldState const* state = GetWorldState(tmpl, itr->second.GetInstance()))
                                statesSet.push_back(state);

                    statesSet.push_back(&itr->second);
                }
    }
    return statesSet;
};

bool WorldStateMgr::IsFitToCondition(Player* player, WorldState const* state)
{
    if (!player || !state)
        return false;

    if (state->HasFlag(WORLD_STATE_FLAG_DELETED))
        return false;

    if (state->GetPhaseMask() && !(state->GetPhaseMask() & player->GetPhaseMask()))
        return false;

    switch (state->GetType())
    {
        case WORLD_STATE_TYPE_WORLD:
        case WORLD_STATE_TYPE_EVENT:
            return true;

        case WORLD_STATE_TYPE_BGWEEKEND:
        {
            if (player->IsPvP())
                return true;
            break;
        }
        case WORLD_STATE_TYPE_MAP:
        case WORLD_STATE_TYPE_BATTLEGROUND:
        {
            if (player->GetMapId() == state->GetCondition() && player->GetInstanceId() == state->GetInstance())
                return true;
//            else if (player->GetMapId() != state->GetCondition() && state->HasFlag(WORLD_STATE_FLAG_INITIAL_STATE) && state->GetInstance() == 0)
//                return true;
            break;
        }
        case WORLD_STATE_TYPE_ZONE:
        {
            if (player->GetZoneId() == state->GetCondition() && player->GetInstanceId() == state->GetInstance())
                return true;
            break;
        }
        case WORLD_STATE_TYPE_AREA:
        {
            if (player->GetAreaId() == state->GetCondition() && player->GetInstanceId() == state->GetInstance())
                return true;
            break;
        }
        case WORLD_STATE_TYPE_CAPTURE_POINT:
        {
            if (state->HasClient(player))
                return true;
            if (GameObject* point = player->GetMap()->GetGameObject(state->GetLinkedGuid()))
            {
                GameObjectInfo const* goInfo = point->GetGOInfo();
                if (!goInfo || goInfo->type != GAMEOBJECT_TYPE_CAPTURE_POINT)
                    return false;

                if (player->IsWithinDistInMap(point, goInfo->capturePoint.radius, true))
                    return true;
            }
            return false;
            break;
        }
        case  WORLD_STATE_TYPE_DESTRUCTIBLE_OBJECT:
        {
            // Need more correct limitation
            if (player->GetZoneId() == state->GetCondition())
                return true;
            break;
        }
        case WORLD_STATE_TYPE_CUSTOM:
        {
            if (!state->GetCondition())
                return true;
            else if (
            (player->GetMapId() == state->GetCondition() ||
            player->GetAreaId() == state->GetCondition() || 
            player->GetZoneId() == state->GetCondition()) &&
            player->GetInstanceId() == state->GetInstance())
                return true;
            break;
        }
        default:
            break;
    }
    return false;
};

bool WorldStateMgr::IsFitToCondition(Map* map, WorldState const* state)
{
    if (!map || !state)
        return false;
    return IsFitToCondition(map->GetId(), map->GetInstanceId(), 0, 0, state);
}

bool WorldStateMgr::IsFitToCondition(uint32 mapId, uint32 instanceId, uint32 zoneId, uint32 areaId, WorldState const* state)
{
    if (!state)
        return false;

    if (state->HasFlag(WORLD_STATE_FLAG_DELETED))
        return false;

    switch (state->GetType())
    {
        case WORLD_STATE_TYPE_WORLD:
        case WORLD_STATE_TYPE_EVENT:
        case WORLD_STATE_TYPE_BGWEEKEND:
            return true;
        case WORLD_STATE_TYPE_MAP:
        case WORLD_STATE_TYPE_BATTLEGROUND:
        {
            if (mapId == state->GetCondition() && instanceId == state->GetInstance())
                return true;
            break;
        }
        case WORLD_STATE_TYPE_ZONE:
        {
            if (zoneId == 0)
                return false;

            if (zoneId == state->GetCondition() && instanceId == state->GetInstance())
                return true;
            break;
        }
        case WORLD_STATE_TYPE_AREA:
        {
            if (areaId == 0)
                return false;

            if (areaId == state->GetCondition() && instanceId == state->GetInstance())
                return true;
            break;
        }
        case WORLD_STATE_TYPE_CAPTURE_POINT:
        {
            return (instanceId == state->GetInstance());
            break;
        }
        case  WORLD_STATE_TYPE_DESTRUCTIBLE_OBJECT:
        {
            if (instanceId)
                return (instanceId == state->GetInstance());
            else
                return zoneId == state->GetCondition();
            break;
        }
        case WORLD_STATE_TYPE_CUSTOM:
        {
            if (!state->GetCondition())
                return true;
            else if (mapId == state->GetCondition() &&
                instanceId == state->GetInstance())
                return true;
            break;
        }
        default:
            break;
    }
    return false;
};

uint32 WorldStateMgr::GetWorldStateValue(uint32 stateId)
{
    ReadGuard guard(GetLock());
    WorldStateBounds bounds = m_worldState.equal_range(stateId);

    if (bounds.first == bounds.second)
        return UINT32_MAX;

    return bounds.first->second.GetValue();
};

uint32 WorldStateMgr::GetWorldStateValueFor(Player* player, uint32 stateId)
{
    if (!player)
        return UINT32_MAX;

    ReadGuard guard(GetLock());
    WorldStateBounds bounds = m_worldState.equal_range(stateId);
    if (bounds.first == bounds.second)
        return UINT32_MAX;

    for (WorldStateMap::const_iterator iter = bounds.first; iter != bounds.second; ++iter)
    {
        if (IsFitToCondition(player, &iter->second))
            return iter->second.GetValue();
    }
    return UINT32_MAX;
};

uint32 WorldStateMgr::GetWorldStateValueFor(Map* map, uint32 stateId)
{
    if (!map)
        return UINT32_MAX;

    ReadGuard guard(GetLock());
    WorldStateBounds bounds = m_worldState.equal_range(stateId);
    if (bounds.first == bounds.second)
        return UINT32_MAX;

    for (WorldStateMap::const_iterator iter = bounds.first; iter != bounds.second; ++iter)
    {
        if (IsFitToCondition(map, &iter->second))
            return iter->second.GetValue();
    }
    return UINT32_MAX;
};

uint32 WorldStateMgr::GetWorldStateValueFor(uint32 mapId, uint32 instanceId, uint32 zoneId, uint32 areaId, uint32 stateId)
{
    ReadGuard guard(GetLock());
    WorldStateBounds bounds = m_worldState.equal_range(stateId);
    if (bounds.first == bounds.second)
        return UINT32_MAX;

    for (WorldStateMap::const_iterator iter = bounds.first; iter != bounds.second; ++iter)
    {
        if (IsFitToCondition(mapId, instanceId, zoneId, areaId, &iter->second))
            return iter->second.GetValue();
    }
    return UINT32_MAX;
};

uint32 WorldStateMgr::GetWorldStateValueFor(WorldObject* object, uint32 stateId)
{
    if (!object)
        return UINT32_MAX;

    if (!object->GetObjectGuid().IsGameObject())
        return object->GetObjectGuid().IsPlayer() ? 
            GetWorldStateValueFor(((Player*)object), stateId) : GetWorldStateValueFor(object->GetMap(), stateId);


    GameObjectInfo const* goInfo = ((GameObject*)object)->GetGOInfo();

    if (!goInfo || goInfo->type != GAMEOBJECT_TYPE_CAPTURE_POINT)
        return GetWorldStateValueFor(object->GetMap(), stateId);

    ReadGuard guard(GetLock());
    WorldStateBounds bounds = m_worldState.equal_range(stateId);

    if (bounds.first != bounds.second)
    {
        for (WorldStateMap::const_iterator iter = bounds.first; iter != bounds.second; ++iter)
        {
            if (IsFitToCondition(object->GetMap()->GetId(), object->GetObjectGuid().GetCounter(), 0, 0, &iter->second))
                return iter->second.GetValue();
        }
    }
    return UINT32_MAX;
};

uint32 WorldStateMgr::GetWorldStateValueFor(uint32 zoneId, uint32 stateId)
{
    if (!zoneId || !CheckWorldState(stateId))
        return UINT32_MAX;

    uint32 mapId = GetMapIdByZoneId(zoneId);

    return GetWorldStateValueFor(mapId, 0, zoneId, 0, stateId);
};

void WorldStateMgr::SetWorldStateValueFor(Player* player, uint32 stateId, uint32 value)
{
    if (!player)
        return;

    WorldStateBounds bounds = m_worldState.equal_range(stateId);
    if (bounds.first != bounds.second)
    {
        for (WorldStateMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
        {
            if (IsFitToCondition(player, &itr->second))
            {
                if ((&itr->second)->GetValue() != value)
                    const_cast<WorldState*>(&itr->second)->SetValue(value);
                return;
            }
        }
    }

    CreateWorldState(stateId, player->GetInstanceId(), value);
};

void WorldStateMgr::SetWorldStateValueFor(Map* map, uint32 stateId, uint32 value)
{
    if (!map)
        return;

    WorldStateBounds bounds = m_worldState.equal_range(stateId);
    if (bounds.first != bounds.second)
    {
        for (WorldStateMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
        {
            if (IsFitToCondition(map, &itr->second))
            {
                if ((&itr->second)->GetValue() != value)
                    const_cast<WorldState*>(&itr->second)->SetValue(value);
                return;
            }
        }
    }

    CreateWorldState(stateId, map->GetInstanceId(), value);
};

void WorldStateMgr::SetWorldStateValueFor(uint32 zoneId, uint32 stateId, uint32 value)
{
    if (!zoneId || !CheckWorldState(stateId))
        return;

    uint32 mapId = GetMapIdByZoneId(zoneId);

    WorldStateBounds bounds = m_worldState.equal_range(stateId);
    if (bounds.first != bounds.second)
    {
        for (WorldStateMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
        {
            if (IsFitToCondition(mapId, 0, zoneId, 0, &itr->second))
            {
                if ((&itr->second)->GetValue() != value)
                    const_cast<WorldState*>(&itr->second)->SetValue(value);
                return;
            }
        }
    }

    CreateWorldState(stateId, 0, value);
};

void WorldStateMgr::SetWorldStateValueFor(WorldObject* object, uint32 stateId, uint32 value)
{
    if (!object)
        return;

    if (!object->GetObjectGuid().IsGameObject())
    {
        object->GetObjectGuid().IsPlayer() ? 
            SetWorldStateValueFor(((Player*)object), stateId, value) : SetWorldStateValueFor(object->GetMap(), stateId, value);
        return;
    }

    GameObjectInfo const* goInfo = ((GameObject*)object)->GetGOInfo();

    if (!goInfo || 
        (goInfo->type != GAMEOBJECT_TYPE_CAPTURE_POINT &&
        goInfo->type != GAMEOBJECT_TYPE_DESTRUCTIBLE_BUILDING))
    {
        SetWorldStateValueFor(object->GetMap(), stateId, value);
        return;
    }

    WorldStateBounds bounds = m_worldState.equal_range(stateId);
    if (bounds.first != bounds.second)
    {
        for (WorldStateMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
        {
            WorldState const* _state = &itr->second;
            if (!_state)
                continue;

            if (IsFitToCondition(object->GetMap()->GetId(), object->GetObjectGuid().GetCounter(), 0, 0, _state))
            {
                if (_state->GetValue() != value)
                    const_cast<WorldState*>(_state)->SetValue(value);

                DEBUG_LOG("WorldStateMgr::SetWorldStateValueFor tru set state %u instance %u, type %u  value %u (%u)  for %s",
                    _state->GetId(), _state->GetInstance(),
                    _state->GetType(),
                    value, _state->GetValue(),
                    object->GetObjectGuid().GetString().c_str());

                return;
            }
        }
    }

    CreateWorldState(stateId, object->GetObjectGuid().GetCounter(), value);
};


WorldState const* WorldStateMgr::CreateWorldState(uint32 stateId, uint32 instanceId, uint32 value)
{
    // Don't create special states as custom!
    if (stateId == 0)
        return NULL;
    WorldStateTemplate const* tmpl = FindTemplate(stateId);
    return CreateWorldState(tmpl, instanceId, value);
};

WorldState const* WorldStateMgr::CreateWorldState(WorldStateTemplate const* tmpl, uint32 instanceId, uint32 value)
{
    if (!tmpl)
        return NULL;

    if (tmpl->IsGlobal() && instanceId > 0)
    {
        sLog.outError("WorldStateMgr::CreateWorldState tru create GLOBAL state %u  with instance Id %u.",tmpl->m_stateId, instanceId);
        return NULL;
    }

    if (WorldState const* _state  = GetWorldState(tmpl, instanceId))
    {
        DEBUG_LOG("WorldStateMgr::CreateWorldState tru create  state %u  instance %u type %u (value %u) but state exists (value %u).",
            tmpl->m_stateId, instanceId, tmpl->m_stateType, value, _state->GetValue());
        const_cast<WorldState*>(_state)->SetValue(value);
        return _state;
    }

    // Store the state data
    {
        WriteGuard guard(GetLock());
        m_worldState.insert(WorldStateMap::value_type(tmpl->m_stateId, WorldState(tmpl, instanceId)));
    }
    WorldState* _state  = const_cast<WorldState*>(GetWorldState(tmpl, instanceId));

    if (value != UINT32_MAX)
        _state->SetValue(value);
    else
        _state->RemoveFlag(WORLD_STATE_FLAG_SAVED);

    if (!tmpl->HasFlag(WORLD_STATE_FLAG_PASSIVE_AT_CREATE))
        _state->AddFlag(WORLD_STATE_FLAG_ACTIVE);

    DEBUG_LOG("WorldStateMgr::CreateWorldState state %u instance %u created, type %u (%u) flags %u (%u) value %u (%u, %u)",
        _state->GetId(), _state->GetInstance(),
        _state->GetType(), tmpl->m_stateType,
        _state->GetFlags(), tmpl->m_flags,
        _state->GetValue(), value, tmpl->m_defaultValue
        );

    return _state;
}

WorldState const* WorldStateMgr::GetWorldState(uint32 stateId, uint32 instanceId, WorldStateType type, uint32 condition)
{
    ReadGuard guard(GetLock());
    WorldStateBounds bounds = m_worldState.equal_range(stateId);
    if (bounds.first == bounds.second)
        return NULL;

    for (WorldStateMap::const_iterator iter = bounds.first; iter != bounds.second; ++iter)
    {
        if (iter->second.GetInstance() == instanceId 
            && type == iter->second.GetType()
            && condition == iter->second.GetCondition())
            return &iter->second;
    }
    return NULL;
};

WorldState const* WorldStateMgr::GetWorldState(uint32 stateId, uint32 instanceId, Player* player)
{
    ReadGuard guard(GetLock());
    WorldStateBounds bounds = m_worldState.equal_range(stateId);
    if (bounds.first == bounds.second)
        return NULL;

    for (WorldStateMap::const_iterator iter = bounds.first; iter != bounds.second; ++iter)
    {
        if (iter->second.GetInstance() == instanceId
            && (!player || IsFitToCondition(player, &iter->second)))
            return &iter->second;
    }
    return NULL;
};

WorldState const* WorldStateMgr::GetWorldState(WorldStateTemplate const* tmpl, uint32 instanceId)
{
    if (!tmpl)
        return NULL;

    ReadGuard guard(GetLock());
    WorldStateBounds bounds = m_worldState.equal_range(tmpl->m_stateId);
    if (bounds.first == bounds.second)
        return NULL;

    for (WorldStateMap::const_iterator iter = bounds.first; iter != bounds.second; ++iter)
    {
        if (iter->second.GetInstance() == instanceId && iter->second.GetTemplate() == tmpl)
            return &iter->second;
    }
    return NULL;
};

void WorldStateMgr::AddWorldStateFor(Player* player, uint32 stateId, uint32 instanceId)
{

    if (!player)
        return;

    WorldState const* state = GetWorldState(stateId,instanceId,player);

    if (state && !state->HasClient(player))
    {
        const_cast<WorldState*>(state)->AddClient(player);

        if (player->IsInWorld())
        {
            // DownLinked states sended always before main!
            if (state->HasDownLink())
            {
                WorldStateSet statesSet = GetDownLinkedWorldStates(state);
                if (!statesSet.empty())
                {
                    for (WorldStateSet::const_iterator itr = statesSet.begin(); itr != statesSet.end(); ++itr)
                    {
                        const_cast<WorldState*>(*itr)->AddClient(player);
                        player->_SendUpdateWorldState((*itr)->GetId(), (*itr)->GetValue());
                        DEBUG_LOG("WorldStateMgr::AddWorldStateFor  send linked state %u value %u for %s",
                        (*itr)->GetId(), (*itr)->GetValue(),
                        player->GetObjectGuid().GetString().c_str());
                    };
                }
            }
            player->_SendUpdateWorldState(stateId, WORLD_STATE_ADD);
            DEBUG_LOG("WorldStateMgr::AddWorldStateFor send main state %u value %u for %s",
                stateId, WORLD_STATE_ADD,
                player->GetObjectGuid().GetString().c_str());
        }
    }
}

void WorldStateMgr::RemoveWorldStateFor(Player* player, uint32 stateId, uint32 instanceId)
{
    if (!player || !player->IsInWorld())
        return;

    WorldState const* state = GetWorldState(stateId, instanceId, player);

    if (state && state->HasClient(player))
    {
            // DownLinked states - only client removed
        if (state->HasDownLink())
        {
            WorldStateSet statesSet = GetDownLinkedWorldStates(state);
            if (!statesSet.empty())
            {
                for (WorldStateSet::const_iterator itr = statesSet.begin(); itr != statesSet.end(); ++itr)
                        const_cast<WorldState*>(*itr)->RemoveClient(player);
            }
        }
        const_cast<WorldState*>(state)->RemoveClient(player);
        player->_SendUpdateWorldState(stateId, WORLD_STATE_REMOVE);
        DEBUG_LOG("WorldStateMgr::RemoveWorldStateFor remove main state %u (value %u) for %s",
            stateId, WORLD_STATE_REMOVE,
            player->GetObjectGuid().GetString().c_str());
    }
}

void WorldStateMgr::CreateInstanceState(uint32 mapId, uint32 instanceId)
{
    for (WorldStateTemplateMap::const_iterator itr = m_worldStateTemplates.begin(); itr != m_worldStateTemplates.end(); ++itr)
    {
        if (itr->second.HasFlag(WORLD_STATE_FLAG_INITIAL_STATE) &&
            (itr->second.m_stateType == WORLD_STATE_TYPE_MAP || itr->second.m_stateType == WORLD_STATE_TYPE_BATTLEGROUND) &&
            itr->second.m_condition == mapId)
        {
            CreateWorldState(&itr->second, instanceId);
        }
    }
}

void WorldStateMgr::CreateZoneAreaStateIfNeed(Player* player, uint32 zone, uint32 area)
{
    if (!player)
        return;

    // temporary - not create zone/area states for instances!
    if (player->GetInstanceId() != 0)
        return;

    for (WorldStateTemplateMap::const_iterator itr = m_worldStateTemplates.begin(); itr != m_worldStateTemplates.end(); ++itr)
    {
        if (itr->second.HasFlag(WORLD_STATE_FLAG_ACTIVE))
        {
            if (itr->second.m_stateType == WORLD_STATE_TYPE_ZONE && itr->second.m_condition == zone)
            {
                if (GetWorldState(&itr->second, player->GetInstanceId()))
                    continue;
                CreateWorldState(&itr->second, player->GetInstanceId());
            }
            else if (itr->second.m_stateType == WORLD_STATE_TYPE_AREA && itr->second.m_condition == area)
            {
                if (GetWorldState(&itr->second, player->GetInstanceId()))
                    continue;
                CreateWorldState(&itr->second, player->GetInstanceId());
            }
        }
    }
}

void WorldStateMgr::DeleteInstanceState(uint32 mapId, uint32 instanceId)
{
    // Not delete states for 0 instance by standart way! only cleanup in ::Update
    if (instanceId == 0)
        return;

    MapEntry const* targetMapEntry = sMapStore.LookupEntry(mapId);

    if (!targetMapEntry || targetMapEntry->IsContinent() || !targetMapEntry->Instanceable())
    {
        sLog.outError("WorldStateMgr::DeleteInstanceState map %u not exists or not instanceable!", mapId);
        return;
    }

    WorldStateSet statesSet = GetInstanceStates(mapId,instanceId);
    if (statesSet.empty())
        return;

    for (WorldStateSet::const_iterator itr = statesSet.begin(); itr != statesSet.end(); ++itr)
    {
        DeleteWorldState(const_cast<WorldState*>(*itr));
    }
}

WorldStateSet WorldStateMgr::GetInstanceStates(Map* map, uint32 flags, bool full)
{
    WorldStateSet statesSet;
    statesSet.clear();

    if (!map)
        return statesSet;

    return GetInstanceStates(map->GetId(), map->GetInstanceId(), flags, full);
}

WorldStateSet WorldStateMgr::GetInstanceStates(uint32 mapId, uint32 instanceId, uint32 flags, bool full)
{
    WorldStateSet statesSet;
    statesSet.clear();

    ReadGuard guard(GetLock());
    for (WorldStateMap::iterator itr = m_worldState.begin(); itr != m_worldState.end(); ++itr)
    {
        if (!flags || (itr->second.GetFlags() & flags))
        {
            if (itr->second.GetType() == WORLD_STATE_TYPE_MAP &&
                itr->second.GetCondition() == mapId &&
                itr->second.GetInstance() == instanceId)
                statesSet.push_back(&itr->second);
            else if (full)
            {
                Map* map = sMapMgr.FindMap(mapId, instanceId);
                if (IsFitToCondition(map, &itr->second))
                    statesSet.push_back(&itr->second);
            }
        }
    }
    return statesSet;
}

WorldStateSet WorldStateMgr::GetInitWorldStates(uint32 mapId, uint32 instanceId, uint32 zoneId, uint32 areaId)
{
    WorldStateSet statesSet;
    statesSet.clear();

    ReadGuard guard(GetLock());
    for (WorldStateMap::const_iterator itr = m_worldState.begin(); itr != m_worldState.end(); ++itr)
    {
        WorldState const* state = &itr->second;
        if (!state)
            continue;

        if ((state->HasFlag(WORLD_STATE_FLAG_INITIAL_STATE) ||
            state->HasFlag(WORLD_STATE_FLAG_ACTIVE)) &&
            IsFitToCondition(mapId, instanceId, zoneId, areaId, state))
        {
            // DownLinked states sended always before main!
            if (state->HasDownLink())
            {
                WorldStateSet linkedStatesSet = GetDownLinkedWorldStates(state);
                if (!linkedStatesSet.empty())
                    std::copy(linkedStatesSet.begin(), linkedStatesSet.end(), std::back_inserter(statesSet));
            }
            statesSet.push_back(&itr->second);
        }
    }
    return statesSet;
};

WorldStateSet WorldStateMgr::GetDownLinkedWorldStates(WorldState const* state)
{
    // This method get DownLinked worldstates with this
    WorldStateSet statesSet;
    statesSet.clear();
    if (!state->HasDownLink())
        return statesSet;

    for (WorldStatesLinkedSet::const_iterator itr = state->GetLinkedSet()->begin(); itr != state->GetLinkedSet()->end(); ++itr)
    {
        WorldStateTemplate const* tmpl = FindTemplate(*itr, state->GetType(), state->GetCondition(), state->GetId());

        if (!tmpl)
            continue;

        if (WorldState const* linkedState = GetWorldState(tmpl, state->GetInstance()))
            statesSet.push_back(linkedState);
    }
    return statesSet;
}

WorldState const* WorldStateMgr::GetUpLinkWorldState(WorldState const* state)
{
    if (!state->HasUpLink())
        return NULL;

    WorldStateTemplate const* tmpl = FindTemplate(state->GetTemplate()->m_linkedId, state->GetType(), state->GetCondition());

    if (!tmpl)
        return NULL;

    return GetWorldState(tmpl, state->GetInstance());
}

uint32 WorldStateMgr::GetMapIdByZoneId(uint32 zoneId) const
{
    if (zoneId)
    {
        for(uint32 i = 1; i < sAreaStore.GetNumRows(); ++i)
        {
            if (AreaTableEntry const* areaEntry = sAreaStore.LookupEntry(i))
                if (areaEntry->zone == zoneId)
                    return areaEntry->mapid;
        }
    }
    return 451; /*Programmers Isle. possible need assert here.*/
}

bool WorldState::IsExpired() const
{
    return time(NULL) > time_t(m_renewTime + sWorld.getConfig(CONFIG_UINT32_WORLD_STATE_EXPIRETIME));
};

void WorldState::AddClient(Player* player)
{
    if (player)
        AddClient(player->GetObjectGuid());
};

bool WorldState::HasClient(Player* player) const
{
    return player ? HasClient(player->GetObjectGuid()) : false;
};

void WorldState::RemoveClient(Player* player)
{
    if (player)
        RemoveClient(player->GetObjectGuid());
};
