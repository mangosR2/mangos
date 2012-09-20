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
#include "WaypointMovementGenerator.h"
#include "Timer.h"
#include "StateMgr.h"
#include "Player.h"
#include "Creature.h"
#include "DBCStores.h"

static const class staticActionInfo
{
    public:
    staticActionInfo()
    {
        actionInfo[UNIT_ACTION_IDLE](UNIT_ACTION_PRIORITY_IDLE,ACTION_TYPE_RESTOREABLE);
        actionInfo[UNIT_ACTION_DOWAYPOINTS](UNIT_ACTION_PRIORITY_DOWAYPOINTS,ACTION_TYPE_NONRESTOREABLE);
        actionInfo[UNIT_ACTION_HOME](UNIT_ACTION_PRIORITY_HOME,ACTION_TYPE_NONRESTOREABLE);
        actionInfo[UNIT_ACTION_CHASE](UNIT_ACTION_PRIORITY_CHASE,ACTION_TYPE_NONRESTOREABLE);
        actionInfo[UNIT_ACTION_ASSISTANCE](UNIT_ACTION_PRIORITY_ASSISTANCE,ACTION_TYPE_NONRESTOREABLE);
        actionInfo[UNIT_ACTION_CONTROLLED](UNIT_ACTION_PRIORITY_CONTROLLED,ACTION_TYPE_NONRESTOREABLE);
        actionInfo[UNIT_ACTION_CONFUSED](UNIT_ACTION_PRIORITY_CONFUSED,ACTION_TYPE_NONRESTOREABLE);
        actionInfo[UNIT_ACTION_FEARED]( UNIT_ACTION_PRIORITY_FEARED,ACTION_TYPE_NONRESTOREABLE);
        actionInfo[UNIT_ACTION_ROOT](UNIT_ACTION_PRIORITY_ROOT,ACTION_TYPE_RESTOREABLE);
        actionInfo[UNIT_ACTION_STUN](UNIT_ACTION_PRIORITY_STUN,ACTION_TYPE_RESTOREABLE);
        actionInfo[UNIT_ACTION_FEIGNDEATH](UNIT_ACTION_PRIORITY_FEIGNDEATH,ACTION_TYPE_NONRESTOREABLE);
        actionInfo[UNIT_ACTION_ONVEHICLE](UNIT_ACTION_PRIORITY_ONVEHICLE,ACTION_TYPE_NONRESTOREABLE);
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

        target->SendMeleeAttackStop(NULL);

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
        target->AddEvent(new AttackResumeEvent(*target), ATTACK_DISPLAY_DELAY);
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

        target->SendMeleeAttackStop(NULL);

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
        target->AddEvent(new AttackResumeEvent(*target), ATTACK_DISPLAY_DELAY);
    }
};

class FeignDeathState : public IdleMovementGenerator
{
public:

    const char* Name() const { return "<FeignDeath>"; }
    void Interrupt(Unit &u) {Finalize(u);}
    void Reset(Unit &u) {Initialize(u);}
    void Initialize(Unit &u)
    {
        Unit* const target = &u;
        if (!target)
            return;

        if (target->GetTypeId() != TYPEID_PLAYER)
            target->StopMoving();

        target->m_movementInfo.RemoveMovementFlag(movementFlagsMask);
        target->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
        target->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);
        target->SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);

        target->InterruptNonMeleeSpells(true);
        target->CombatStop();
        target->getHostileRefManager().deleteReferences();
        target->addUnitState(UNIT_STAT_DIED);
        target->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_IMMUNE_OR_LOST_SELECTION);

    }

    void Finalize(Unit &u)
    {
        Unit* const target = &u;
        if (!target)
            return;

        target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
        target->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);
        target->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);
        target->clearUnitState(UNIT_STAT_DIED);
    }
};

class TaxiState : public FlightPathMovementGenerator
{
public:
    TaxiState(uint32 mountDisplayId, uint32 path, uint32 startNode = 0) :
        m_displayId(mountDisplayId), FlightPathMovementGenerator(sTaxiPathNodesByPath[path], startNode), m_previewDisplayId(0)
    {
    };

public:
    const char* Name() const { return "<FlightPath>"; }
    void Interrupt(Player &u) 
    {
        _Interrupt(u);
        u.clearUnitState(UNIT_STAT_TAXI_FLIGHT);
        if (m_displayId)
            u.Unmount();
        u.RemoveFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_TAXI_FLIGHT);
        if (m_previewDisplayId)
        {
            u.Mount(m_previewDisplayId);
        }
    };

    void Reset(Player &u) 
    {
        Initialize(u);
    };

    void Initialize(Player &u)
    {
        if (m_displayId)
        {
            if (!m_previewDisplayId)
                m_previewDisplayId = u.GetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID);
            u.Mount(m_displayId);
        }
        u.getHostileRefManager().setOnlineOfflineState(false);
        u.addUnitState(UNIT_STAT_TAXI_FLIGHT);
        u.SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_TAXI_FLIGHT);
        _Initialize(u);
    };

    void Finalize(Player &u)
    {
        // remove flag to prevent send object build movement packets for flight state and crash (movement generator already not at top of stack)
        if (m_displayId)
            u.Unmount();
        u.clearUnitState(UNIT_STAT_TAXI_FLIGHT);
        u.RemoveFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_TAXI_FLIGHT);
        u.getHostileRefManager().setOnlineOfflineState(true);
        if(u.pvpInfo.inHostileArea)
            u.CastSpell(&u, 2479, true);

        _Finalize(u);

        if (m_previewDisplayId)
        {
            u.Mount(m_previewDisplayId);
        }
    };

private:
    uint32 m_displayId;
    uint32 m_previewDisplayId;
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

UnitActionPtr UnitStateMgr::CreateStandartState(UnitActionId stateId, ...)
{
    va_list vargs;
    va_start(vargs, stateId);

    UnitActionPtr state = UnitActionPtr(NULL);
    switch (stateId)
    {
        case UNIT_ACTION_IDLE:
            state = UnitActionPtr(new IdleMovementGenerator());
            break;
        case UNIT_ACTION_CONFUSED:
        case UNIT_ACTION_FEARED:
        case UNIT_ACTION_CHASE:
            break;
        case UNIT_ACTION_STUN:
            state = UnitActionPtr(new StunnedState());
            break;
        case UNIT_ACTION_FEIGNDEATH:
            state = UnitActionPtr(new FeignDeathState());
            break;
        case UNIT_ACTION_ROOT:
            state = UnitActionPtr(new RootState());
            break;
        case UNIT_ACTION_ONVEHICLE:
        {
            uint32 param = va_arg(vargs,int32);
            state = UnitActionPtr(new OnVehicleState(param));
            break;
        }
        case UNIT_ACTION_CONTROLLED:
        {
            uint32 param = va_arg(vargs,int32);
            state = UnitActionPtr(new ControlledState(param));
            break;
        }
        case UNIT_ACTION_TAXI:
        {
            uint32 mountDisplayId = va_arg(vargs,uint32);
            uint32 path           = va_arg(vargs,uint32);
            uint32 startNode      = va_arg(vargs,uint32);
            state = UnitActionPtr(new TaxiState(mountDisplayId, path, startNode));
            break;
        }
        default:
            sLog.outError("UnitStateMgr: attempt to create unknown standart state %u, creating IDLE state instead", stateId);
            state = UnitActionPtr(new IdleMovementGenerator());
            break;
    }

    va_end(vargs);

    MANGOS_ASSERT(state);

    return state;
}

UnitStateMgr::UnitStateMgr(Unit* owner) : m_owner(owner), m_needReinit(false)
{
    m_actions.clear();

    for (int32 i = UNIT_ACTION_IDLE; i != UNIT_ACTION_END; ++i)
        m_stateCounter[i] = 0;

    InitDefaults(true);
}

UnitStateMgr::~UnitStateMgr()
{
}

void UnitStateMgr::InitDefaults(bool immediate)
{
    if (immediate)
    {
        m_oldAction = UnitActionPtr(NULL);
        DropAllStates();
    }
    else
        m_needReinit = true;
}

void UnitStateMgr::Update(uint32 diff)
{
    if (m_needReinit)
    {
        m_needReinit = false;
        InitDefaults(true);
    }

    ActionInfo* state = CurrentState();

    if (!m_oldAction)
        m_oldAction = state->Action();
    else if (m_oldAction && m_oldAction != state->Action())
    {
        if (ActionInfo* oldAction = GetAction(m_oldAction))
        {
            if (oldAction->HasFlag(ACTION_STATE_ACTIVE) &&
                !oldAction->HasFlag(ACTION_STATE_FINALIZED) &&
                !oldAction->HasFlag(ACTION_STATE_INTERRUPTED))
                oldAction->Interrupt(this);
        }
        // else do nothing - action be deleted without interrupt/finalize (may be need correct?)
        m_oldAction = state->Action();
    }

    if (!state->Update(this, diff))
    {
        DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "UnitStateMgr: %s finished action %s", GetOwnerStr().c_str(), state->TypeName());
        DropAction(state->priority);
    }
}

void UnitStateMgr::DropAction(UnitActionId actionId)
{
    DropAction(actionId, staticActionInfo[actionId].priority);
}

void UnitStateMgr::DropAction(UnitActionId actionId, UnitActionPriority priority)
{
    if (!m_actions.empty())
    {
        std::vector<UnitActionPriority> priorityToDrop;
        for (UnitActionStorage::const_iterator itr = m_actions.begin(); itr != m_actions.end(); ++itr)
            if (itr->first <= priority && itr->second.Id == actionId)
                priorityToDrop.push_back(itr->first);

        while (!priorityToDrop.empty())
        {
            DropAction(priorityToDrop.back());
            priorityToDrop.pop_back();
        }
    }
}

void UnitStateMgr::DropAction(UnitActionPriority priority)
{
    // Don't remove action with NONE priority - static
    if (priority < UNIT_ACTION_PRIORITY_IDLE)
        return;

    UnitActionStorage::iterator itr = m_actions.find(priority);

    if (itr != m_actions.end())
    {
        bool bActiveActionChanged = false;
        ActionInfo* oldInfo = CurrentState();
        UnitActionPtr oldAction = oldInfo ? oldInfo->Action() : UnitActionPtr();

        // if dropped current active state...
        if (oldInfo && itr->second.Action() == oldInfo->Action() && !oldInfo->HasFlag(ACTION_STATE_FINALIZED))
            bActiveActionChanged = true;

        // in first - erasing current action, if his active
        if (itr->second.Action() == m_oldAction)
            m_oldAction = UnitActionPtr(NULL);

        // Possible erasing by iterator more fast and logic, but by Key much more safe
        m_actions.erase(priority);

        // Finalized not ActionInfo, but real action (saved before), due to ActionInfo wrapper already deleted.
        if (bActiveActionChanged && oldAction)
        {
            DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "DropAction: %s finalize (direct) action %s", GetOwnerStr().c_str(), oldAction->Name());
            oldAction->Finalize(*GetOwner());
        }
        // in this point we delete last link to UnitActionPtr, after this UnitAction be auto-deleted...
    }
}

void UnitStateMgr::DropActionHigherThen(UnitActionPriority priority)
{
    for (int32 i = priority + 1; i != UNIT_ACTION_PRIORITY_END; ++i)
        DropAction(UnitActionPriority(i));
}

void UnitStateMgr::PushAction(UnitActionId actionId)
{
    UnitActionPtr state = CreateStandartState(actionId);
    PushAction(actionId, state, staticActionInfo[actionId].priority, staticActionInfo[actionId].restoreable); 
}

void UnitStateMgr::PushAction(UnitActionId actionId, UnitActionPriority priority)
{
    UnitActionPtr state = CreateStandartState(actionId);
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

    if (_priority > UNIT_ACTION_PRIORITY_IDLE)
    {
        // Some speedup - testing - not need drop Idle/None actions
        DropAction(actionId, priority);
        DropAction(priority);
    }

    bool needInsert = true;

    if (restoreable != ACTION_TYPE_NONRESTOREABLE)
    {
        // Don't replace (only interrupt and reset!) restoreable actions
        UnitActionStorage::iterator itr = m_actions.find(priority);
        if (itr != m_actions.end())
        {
            if (itr->second.Id == actionId)
            {
                itr->second.Reset(this);
                needInsert = false;
            }
        }
    }

    if (needInsert)
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
    for (UnitActionStorage::reverse_iterator itr = m_actions.rbegin(); itr != m_actions.rend(); ++itr)
        if (itr->first == priority)
            return &itr->second;
    return NULL;
}

ActionInfo* UnitStateMgr::GetAction(UnitActionPtr _action)
{
    for (UnitActionStorage::iterator itr = m_actions.begin(); itr != m_actions.end(); ++itr)
        if (itr->second.Action() == _action)
            return &itr->second;
    return NULL;
}

UnitActionPtr UnitStateMgr::CurrentAction()
{
    ActionInfo* action = CurrentState();
    return action ? action->Action() : UnitActionPtr(NULL);
}

ActionInfo* UnitStateMgr::CurrentState()
{
    return m_actions.empty() ? NULL : &m_actions.rbegin()->second;
}

void UnitStateMgr::DropAllStates()
{
    // Assume, that if only one action - that IDLE appears (rechecked later).
    if (m_actions.size() > 1 )
    {
        DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "UnitStateMgr:DropAllStates %s drop all active states (count = %u)", GetOwnerStr().c_str(), m_actions.size());
        DropActionHigherThen(UNIT_ACTION_PRIORITY_IDLE);
    }
    // Unique action after dropping may be not UNIT_ACTION_IDLE
    if (m_actions.empty() || GetCurrentState() != UNIT_ACTION_IDLE)
        PushAction(UNIT_ACTION_IDLE);
}

std::string const UnitStateMgr::GetOwnerStr() 
{
    return GetOwner()->IsInWorld() ? GetOwner()->GetGuidStr() : "<Uninitialized>"; 
};

bool ActionInfo::operator == (ActionInfo& val)
{
    return (Action() == val.Action());
};

bool ActionInfo::operator == (UnitActionPtr _action)
{
    return (Action() == _action);
};

bool ActionInfo::operator != (ActionInfo& val)
{
    return (Action() != val.Action());
};

bool ActionInfo::operator != (UnitActionPtr _action)
{
    return (Action() != _action);
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

void ActionInfo::Reset(UnitStateMgr* mgr)
{
    if (!HasFlag(ACTION_STATE_INITIALIZED))
        return;

    if (!HasFlag(ACTION_STATE_INTERRUPTED) && 
        HasFlag(ACTION_STATE_ACTIVE))
        Interrupt(mgr);

    RemoveFlag(ACTION_STATE_INITIALIZED);
    DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "ActionInfo: %s reset action %s", mgr->GetOwnerStr().c_str(), TypeName());
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
