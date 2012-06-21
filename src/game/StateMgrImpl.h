/*
 * Copyright (C) 2011-2012 /dev/rsa for MangosR2 <http://github.com/MangosR2>
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

#ifndef _STATEMGRIMPL_H
#define _STATEMGRIMPL_H

#include "Common.h"
#pragma once

// values 0 ... MAX_DB_MOTION_TYPE-1 used in DB
enum MovementGeneratorType
{
    IDLE_MOTION_TYPE                = 0,                    // IdleMovementGenerator.h
    RANDOM_MOTION_TYPE              = 1,                    // RandomMovementGenerator.h
    WAYPOINT_MOTION_TYPE            = 2,                    // WaypointMovementGenerator.h
    MAX_DB_MOTION_TYPE              = 3,                    // *** this and below motion types can't be set in DB.

    CONFUSED_MOTION_TYPE            = 4,                    // ConfusedMovementGenerator.h
    CHASE_MOTION_TYPE               = 5,                    // TargetedMovementGenerator.h
    HOME_MOTION_TYPE                = 6,                    // HomeMovementGenerator.h
    FLIGHT_MOTION_TYPE              = 7,                    // WaypointMovementGenerator.h
    POINT_MOTION_TYPE               = 8,                    // PointMovementGenerator.h
    FLEEING_MOTION_TYPE             = 9,                    // FleeingMovementGenerator.h
    DISTRACT_MOTION_TYPE            = 10,                   // IdleMovementGenerator.h
    ASSISTANCE_MOTION_TYPE          = 11,                   // PointMovementGenerator.h (first part of flee for assistance)
    ASSISTANCE_DISTRACT_MOTION_TYPE = 12,                   // IdleMovementGenerator.h (second part of flee for assistance)
    TIMED_FLEEING_MOTION_TYPE       = 13,                   // FleeingMovementGenerator.h (alt.second part of flee for assistance)
    FOLLOW_MOTION_TYPE              = 14,                   // TargetedMovementGenerator.h
    EFFECT_MOTION_TYPE              = 15,
};

/** List of default unit's state providen by MaNGOS */
enum UnitActionId
{
    UNIT_ACTION_IDLE,
    UNIT_ACTION_DOWAYPOINTS,
    UNIT_ACTION_HOME,
    UNIT_ACTION_CHASE,
    UNIT_ACTION_ASSISTANCE,
    UNIT_ACTION_CONTROLLED,
    UNIT_ACTION_CONFUSED,
    UNIT_ACTION_FEARED,
    UNIT_ACTION_ROOT,
    UNIT_ACTION_STUN,
    UNIT_ACTION_FEIGNDEATH,
    UNIT_ACTION_ONVEHICLE,
    UNIT_ACTION_TAXI,
    UNIT_ACTION_EFFECT,
    UNIT_ACTION_END,
};

/** List of default unit's state priorityes */
enum UnitActionPriority
{
    UNIT_ACTION_PRIORITY_NONE        = -1,
    UNIT_ACTION_PRIORITY_IDLE        =  0,
    UNIT_ACTION_PRIORITY_DOWAYPOINTS =  1,
    UNIT_ACTION_PRIORITY_CHASE       =  2,
    UNIT_ACTION_PRIORITY_HOME        =  3,
    UNIT_ACTION_PRIORITY_ASSISTANCE  =  4,
    UNIT_ACTION_PRIORITY_CONTROLLED  =  5,
    UNIT_ACTION_PRIORITY_CONFUSED    =  6,
    UNIT_ACTION_PRIORITY_FEARED      =  7,
    UNIT_ACTION_PRIORITY_ROOT        =  8,
    UNIT_ACTION_PRIORITY_STUN        =  9,
    UNIT_ACTION_PRIORITY_FEIGNDEATH  = 10,
    UNIT_ACTION_PRIORITY_ONVEHICLE   = 11,
    UNIT_ACTION_PRIORITY_TAXI        = 12,
    UNIT_ACTION_PRIORITY_EFFECT      = 13,
    UNIT_ACTION_PRIORITY_IMMEDIATE   = 14,
    UNIT_ACTION_PRIORITY_END,
};

enum eActionType
{
    ACTION_TYPE_NONRESTOREABLE = 0,                   // Action NOT be restored after interrupt (effect type)
    ACTION_TYPE_RESTOREABLE    = 1,                   // Action be restored after interrupt (normal type)
    ACTION_TYPE_REPLACEABLE    = 2,                   // Action be restored after interrupt, some attributes 
                                                      // removed only on finalize, not in interrupted state
};

enum ActionUpdateState
{
    ACTION_STATE_ACTIVE      = 0,                     // updated at least one time and not interrupted
    ACTION_STATE_INITIALIZED = 1,                     // Already initialized one time
    ACTION_STATE_EXECUTED    = 2,                     // Executed in current time (NUN)
    ACTION_STATE_INTERRUPTED = 3,                     // In stack, but interrupted
    ACTION_STATE_FINALIZED   = 4,                     // Finalized, awaiting delete
    ACTION_STATE_END
};

struct StaticActionInfo
{
    explicit StaticActionInfo() : priority(UNIT_ACTION_PRIORITY_IDLE), restoreable(ACTION_TYPE_RESTOREABLE) {}

    explicit StaticActionInfo(UnitActionPriority _priority, eActionType _restoreable = ACTION_TYPE_RESTOREABLE) : priority(_priority), restoreable(_restoreable) {}

    void operator()(UnitActionPriority _priority, eActionType _restoreable = ACTION_TYPE_RESTOREABLE) 
    {
        priority = _priority;
        restoreable = _restoreable;
    }

    UnitActionPriority priority;
    eActionType        restoreable;
};

class Unit;
class UnitAction
{
    public:
    virtual ~UnitAction() {}

    virtual void Interrupt(Unit &) = 0;
    virtual void Reset(Unit &) = 0;
    virtual void Initialize(Unit &) = 0;
    virtual void Finalize(Unit &) = 0;

    virtual bool IsReachable() const { return true; };
    virtual const char* Name() const { return "<Uninitialized>"; };
    virtual MovementGeneratorType GetMovementGeneratorType() const = 0;

    /* Returns true to show that state expired and can be finalized. */
    virtual bool Update(Unit &, const uint32& diff) = 0;
};

#endif