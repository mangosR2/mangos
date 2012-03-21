/*
 * Copyright (C) 2009-2012 /dev/rsa for MaNGOS <http://getmangos.com/>
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
/* StateMgr based on idea and part of code from SilverIce (http:://github.com/SilverIce
*/
#include "ConfusedMovementGenerator.h"
#include "TargetedMovementGenerator.h"
#include "IdleMovementGenerator.h"
#include "Timer.h"
#include "StateMgr.h"
#include "Player.h"
#include "Creature.h"

static const class staticActionInfo
{
    public:
    staticActionInfo()
    {
        actionInfo[UNIT_ACTION_IDLE](UNIT_ACTION_PRIORITY_IDLE);
        actionInfo[UNIT_ACTION_DOWAYPOINTS](UNIT_ACTION_PRIORITY_DOWAYPOINTS);
        actionInfo[UNIT_ACTION_CHASE](UNIT_ACTION_PRIORITY_CHASE);
        actionInfo[UNIT_ACTION_ASSISTANCE](UNIT_ACTION_PRIORITY_ASSISTANCE,ACTION_TYPE_NONRESTOREABLE);
        actionInfo[UNIT_ACTION_CONTROLLED](UNIT_ACTION_PRIORITY_CONTROLLED);
        actionInfo[UNIT_ACTION_CONFUSED](UNIT_ACTION_PRIORITY_CONFUSED);
        actionInfo[UNIT_ACTION_FEARED]( UNIT_ACTION_PRIORITY_FEARED);
        actionInfo[UNIT_ACTION_STUN](UNIT_ACTION_PRIORITY_STUN);
        actionInfo[UNIT_ACTION_ROOT](UNIT_ACTION_PRIORITY_ROOT);
        actionInfo[UNIT_ACTION_ONVEHICLE](UNIT_ACTION_PRIORITY_ONVEHICLE);
        actionInfo[UNIT_ACTION_TAXI](UNIT_ACTION_PRIORITY_TAXI,ACTION_TYPE_NONRESTOREABLE);
        actionInfo[UNIT_ACTION_EFFECT](UNIT_ACTION_PRIORITY_EFFECT,ACTION_TYPE_NONRESTOREABLE);
    }

    const StaticActionInfo& operator[](UnitActionId i) const { return actionInfo[i];}

    private:
    StaticActionInfo actionInfo[UNIT_ACTION_END];
} staticActionInfo;

// derived from IdleState_ to not write new GetMovementGeneratorType, Update
class StunnedState : public IdleMovementGenerator
{
public:

    const char* Name() const { return "<Stunned>"; }
    void Interrupt(Unit &u) {Finalize(u);}
    void Reset(Unit &u) {Initialize(u);}
    void Initialize(Unit &u)
    {
        Unit* const target = &u;
        if (!target)
            return;

        target->addUnitState(UNIT_STAT_STUNNED);
        target->SetTargetGuid(ObjectGuid());

        target->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
        //Clear unit movement flags
        target->m_movementInfo.RemoveMovementFlag(movementFlagsMask);
        target->m_movementInfo.AddMovementFlag(MOVEFLAG_ROOT);

        // Creature specific
        if (target->GetTypeId() != TYPEID_PLAYER)
            target->StopMoving();
        else
        {
            target->SetStandState(UNIT_STAND_STATE_STAND);// in 1.5 client
        }

        WorldPacket data(SMSG_FORCE_MOVE_ROOT, target->GetPackGUID().size() + 4);
        data << target->GetPackGUID();
        data << uint32(0);
        target->SendMessageToSet(&data, true);
    }

    void Finalize(Unit &u)
    {
        Unit* const target = &u;
        if (!target)
            return;
        target->clearUnitState(UNIT_STAT_STUNNED);
        target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);

        if(target->getVictim())
            target->SetTargetGuid(target->getVictim()->GetObjectGuid());

        WorldPacket data(SMSG_FORCE_MOVE_UNROOT, target->GetPackGUID().size() + 4);
        data << target->GetPackGUID();
        data << uint32(0);
        target->SendMessageToSet(&data, true);
        target->m_movementInfo.RemoveMovementFlag(MOVEFLAG_ROOT);
    }

};

class RootState : public IdleMovementGenerator
{
public:

    const char* Name() const { return "<Rooted>"; }
    void Interrupt(Unit &u) {Finalize(u);}
    void Reset(Unit &u) {Initialize(u);}
    void Initialize(Unit &u)
    {
        Unit* const target = &u;
        if (!target)
            return;
        target->addUnitState(UNIT_STAT_ROOT);
        target->SetTargetGuid(ObjectGuid());
        //Save last orientation
        if(target->getVictim())
            target->SetOrientation(target->GetAngle(target->getVictim()));

        //Clear unit movement flags
        target->m_movementInfo.RemoveMovementFlag(movementFlagsMask);
        target->m_movementInfo.AddMovementFlag(MOVEFLAG_ROOT);

        if(target->GetTypeId() == TYPEID_PLAYER)
        {
            WorldPacket data(SMSG_FORCE_MOVE_ROOT, target->GetPackGUID().size() + 4);
            data << target->GetPackGUID();
            data << target->GetUnitStateMgr().GetCounter(UNIT_ACTION_ROOT);
            target->SendMessageToSet(&data, true);
        }
        else
        {
            target->StopMoving();
            WorldPacket data(SMSG_SPLINE_MOVE_ROOT, target->GetPackGUID().size());
            data << target->GetPackGUID();
            target->SendMessageToSet(&data, true);
        }

    }

    void Finalize(Unit &u)
    {
        Unit* const target = &u;
        if (!target)
            return;
        target->clearUnitState(UNIT_STAT_ROOT);
        if(target->GetTypeId() == TYPEID_PLAYER)
        {
            WorldPacket data(SMSG_FORCE_MOVE_UNROOT, target->GetPackGUID().size() + 4);
            data << target->GetPackGUID();
            data << target->GetUnitStateMgr().GetCounter(UNIT_ACTION_ROOT);
            target->SendMessageToSet(&data, true);
        }
        else
        {
            WorldPacket data(SMSG_SPLINE_MOVE_UNROOT, target->GetPackGUID().size());
            data << target->GetPackGUID();
            target->SendMessageToSet(&data, true);
        }
        target->m_movementInfo.RemoveMovementFlag(MOVEFLAG_ROOT);

        if(target->getVictim())
            target->SetTargetGuid(target->getVictim()->GetObjectGuid());
    }
};

class OnVehicleState : public IdleMovementGenerator
{
public:
    OnVehicleState(int32 _type) : m_seatId(int8(_type))
    {};

    const char* Name() const { return "<OnVehicle>"; }
    void Interrupt(Unit &u) {Finalize(u);}
    void Reset(Unit &u) {Initialize(u);}
    void Initialize(Unit &u)
    {
        Unit* const target = &u;
        if (!target)
            return;
    }

    void Finalize(Unit &u)
    {
        Unit* const target = &u;
        if (!target)
            return;
    }

private:
    int8 m_seatId;
};

class ControlledState : public IdleMovementGenerator
{

public:
    ControlledState(int32 _type) : m_state(uint8(_type))
    {};

    const char* Name() const { return "<Controlled>"; }
    void Interrupt(Unit &u) {Finalize(u);}
    void Reset(Unit &u) {Initialize(u);}
    void Initialize(Unit &u)
    {
        Unit* const target = &u;
        if (!target)
            return;
    }

    void Finalize(Unit &u)
    {
        Unit* const target = &u;
        if (!target)
            return;
    }

private:
    uint8 m_state;
};

UnitActionPtr UnitStateMgr::CreateStandartState(UnitActionId stateId, int32 param)
{
    UnitActionPtr state = UnitActionPtr(NULL);
    switch (stateId)
    {
        case UNIT_ACTION_CONFUSED:
        case UNIT_ACTION_FEARED:
        case UNIT_ACTION_CHASE:
            break;
        case UNIT_ACTION_STUN:
            state = UnitActionPtr(new StunnedState());
            break;
        case UNIT_ACTION_ROOT:
            state = UnitActionPtr(new RootState());
            break;
        case UNIT_ACTION_ONVEHICLE:
            state = UnitActionPtr(new OnVehicleState(param));
            break;
        case UNIT_ACTION_CONTROLLED:
            state = UnitActionPtr(new ControlledState(param));
            break;
        default:
            break;
    }

    if (!state)
        state = UnitActionPtr(new IdleMovementGenerator());

    return state;
}

UnitStateMgr::UnitStateMgr(Unit* owner) : m_owner(owner)
{
    for (int32 i = UNIT_ACTION_IDLE; i != UNIT_ACTION_END; ++i)
        m_stateCounter[i] = 0;

    InitDefaults();
}

UnitStateMgr::~UnitStateMgr()
{
}

void UnitStateMgr::InitDefaults()
{
    m_oldAction = NULL;
    m_actions.clear();
    PushAction(UNIT_ACTION_IDLE,UNIT_ACTION_PRIORITY_NONE);
}

void UnitStateMgr::Update(uint32 diff)
{
    ActionInfo* state = CurrentState();

    if (!m_oldAction || m_oldAction != state)
    {
        if (m_oldAction &&
            m_oldAction->HasFlag(ACTION_STATE_ACTIVE) &&
            !m_oldAction->HasFlag(ACTION_STATE_FINALIZED) &&
            !m_oldAction->HasFlag(ACTION_STATE_INTERRUPTED))
            m_oldAction->Interrupt(this);
        m_oldAction = state;
    }

    if (!state->Update(this, diff))
        DropAction(state->priority);
}

void UnitStateMgr::DropAction(UnitActionId actionId)
{
    DropAction(actionId, staticActionInfo[actionId].priority);
}

void UnitStateMgr::DropAction(UnitActionId actionId, UnitActionPriority priority)
{
    for (UnitActionStorage::iterator itr = m_actions.begin(); itr != m_actions.end();)
    {
        if (itr->second.Id == actionId)
        {
            UnitActionPriority _priority = itr->first;
            ++itr;
            if (_priority <= priority)
                DropAction(_priority);
        }
        else
            ++itr;
    }
}

void UnitStateMgr::DropAction(UnitActionPriority priority)
{
    // Don't remove action with NONE priority - static
    if (priority < UNIT_ACTION_PRIORITY_IDLE)
        return;

    MAPLOCK_WRITE(GetOwner(), MAP_LOCK_TYPE_MOVEMENT);
    ActionInfo* oldInfo = CurrentState();
    UnitActionStorage::iterator itr = m_actions.find(priority);
    if (itr != m_actions.end())
    {
        bool bActiveActionChanged = false;
        UnitActionPtr oldAction = oldInfo ? oldInfo->Action() : UnitActionPtr();
        // if dropped current active state...
        if (oldInfo && &itr->second == oldInfo && !oldInfo->HasFlag(ACTION_STATE_FINALIZED))
            bActiveActionChanged = true;

        if (&itr->second == m_oldAction)
            m_oldAction = NULL;

        m_actions.erase(itr);

        // Finalized not ActionInfo, but real action (saved before), due to ActionInfo wrapper already deleted.
        if (bActiveActionChanged && oldAction)
        {
            oldAction->Finalize(*GetOwner());
        }

        // in this point we delete last link to UnitActionPtr, after this UnitAction be auto-deleted...
    }
}

void UnitStateMgr::PushAction(UnitActionId actionId, int32 param)
{
    UnitActionPtr state = CreateStandartState(actionId, param);
    PushAction(actionId, state, staticActionInfo[actionId].priority, staticActionInfo[actionId].restoreable); 
}

void UnitStateMgr::PushAction(UnitActionId actionId, UnitActionPriority priority, int32 param)
{
    UnitActionPtr state = CreateStandartState(actionId, param);
    PushAction(actionId, state, priority, ACTION_TYPE_NONRESTOREABLE);
}

void UnitStateMgr::PushAction(UnitActionId actionId, UnitActionPtr state)
{
    PushAction(actionId, state, staticActionInfo[actionId].priority, staticActionInfo[actionId].restoreable); 
}

void UnitStateMgr::PushAction(UnitActionId actionId, UnitActionPtr state, UnitActionPriority priority, eActionType restoreable)
{
    ActionInfo* oldInfo = CurrentState();
    UnitActionPriority _priority = oldInfo ? oldInfo->priority : UNIT_ACTION_PRIORITY_IDLE;

    // Only interrupt action, if not drop his below and action lower by priority
    if (oldInfo &&
        oldInfo->HasFlag(ACTION_STATE_ACTIVE) && 
        oldInfo->Id != actionId &&
        _priority < priority)
        oldInfo->Interrupt(this);

    DropAction(actionId, priority);
    DropAction(priority);

    m_actions.insert(UnitActionStorage::value_type(priority,ActionInfo(actionId, state, priority, restoreable)));
    IncreaseCounter(actionId);

/*
    ActionInfo* newInfo = CurrentState();
    if (newInfo && newInfo != oldInfo)
    {
        if (!newInfo->HasFlag(ACTION_STATE_INITIALIZED))
            newInfo->Initialize(this);
    }
*/
}

ActionInfo* UnitStateMgr::GetAction(UnitActionPriority priority)
{
    UnitActionStorage::iterator itr = m_actions.find(priority);
    if (itr != m_actions.end())
        return &itr->second;
    return NULL;
}

UnitActionPtr UnitStateMgr::CurrentAction()
{
    return CurrentState() ? CurrentState()->Action() : UnitActionPtr(NULL);
}

ActionInfo* UnitStateMgr::CurrentState()
{
    return m_actions.empty() ? NULL : &m_actions.rbegin()->second;
}

void UnitStateMgr::DropAllStates()
{
    for (int32 i = UNIT_ACTION_PRIORITY_IDLE; i != UNIT_ACTION_PRIORITY_END; ++i)
        DropAction(UnitActionPriority(i));
}

std::string const UnitStateMgr::GetOwnerStr() 
{
    return GetOwner()->IsInWorld() ? GetOwner()->GetGuidStr() : "<Uninitialized>"; 
};

bool ActionInfo::operator < (const ActionInfo& val) const
{
    if (priority > val.priority)
        return true;
    return false;
};

void ActionInfo::Delete()
{
    delete this;
}

void ActionInfo::Initialize(UnitStateMgr* mgr)
{
    if (HasFlag(ACTION_STATE_FINALIZED))
        return;

    MAPLOCK_READ(mgr->GetOwner(), MAP_LOCK_TYPE_MOVEMENT);
    if (!HasFlag(ACTION_STATE_INITIALIZED) && Action())
    {
        DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "ActionInfo: %s initialize action %s", mgr->GetOwnerStr().c_str(), TypeName());
        Action()->Initialize(*mgr->GetOwner());
        AddFlag(ACTION_STATE_INITIALIZED);
    }
    else if (Action())
    {
        DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "ActionInfo: %s reset action %s", mgr->GetOwnerStr().c_str(), TypeName());
        Action()->Reset(*mgr->GetOwner());
        RemoveFlag(ACTION_STATE_INTERRUPTED);
    }
    RemoveFlag(ACTION_STATE_INTERRUPTED);
}

void ActionInfo::Finalize(UnitStateMgr* mgr)
{
    if (!HasFlag(ACTION_STATE_INITIALIZED) || 
        HasFlag(ACTION_STATE_FINALIZED))
        return;

    MAPLOCK_READ(mgr->GetOwner(), MAP_LOCK_TYPE_MOVEMENT);
    AddFlag(ACTION_STATE_FINALIZED);
    RemoveFlag(ACTION_STATE_ACTIVE);

    DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "ActionInfo: %s finalize action %s", mgr->GetOwnerStr().c_str(), TypeName());

    if (Action())
        Action()->Finalize(*mgr->GetOwner());
}

void ActionInfo::Interrupt(UnitStateMgr* mgr)
{
    if (!HasFlag(ACTION_STATE_INITIALIZED) || 
        HasFlag(ACTION_STATE_FINALIZED) ||
        HasFlag(ACTION_STATE_INTERRUPTED))
        return;

    MAPLOCK_READ(mgr->GetOwner(), MAP_LOCK_TYPE_MOVEMENT);
    AddFlag(ACTION_STATE_INTERRUPTED);
    RemoveFlag(ACTION_STATE_ACTIVE);

    DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "ActionInfo: %s interrupt action %s", mgr->GetOwnerStr().c_str(), TypeName());

    if (Action())
        Action()->Interrupt(*mgr->GetOwner());
}

bool ActionInfo::Update(UnitStateMgr* mgr, uint32 diff)
{
    if (Action() && 
        (!HasFlag(ACTION_STATE_INITIALIZED) ||
        HasFlag(ACTION_STATE_INTERRUPTED)))
        Initialize(mgr);

    AddFlag(ACTION_STATE_ACTIVE);

    // DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "ActionInfo: %s update action %s", mgr->GetOwnerStr().c_str(), TypeName());

    if (Action())
        return Action()->Update(*mgr->GetOwner(), diff);
    else
        return false;
}

const char* ActionInfo::TypeName() const 
{
    return (action ? action->Name() : "<empty>");
}
