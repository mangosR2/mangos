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

#ifndef MANGOS_MOTIONMASTER_H
#define MANGOS_MOTIONMASTER_H

#include "Common.h"
#include "StateMgrImpl.h"
#include <stack>
#include <vector>

class MovementGenerator;
class Unit;

// Creature Entry ID used for waypoints show, visible only for GMs
#define VISUAL_WAYPOINT 1

class MANGOS_DLL_SPEC MotionMaster 
{
    public:

        explicit MotionMaster(Unit *unit);
        ~MotionMaster();

        void Initialize();
        void Clear(bool reset = true, bool all = false);
        void MovementExpired(bool reset = true) { Clear(); }

        void MoveIdle();
        void MoveRandom();
        void MoveTargetedHome();
        void MoveFollow(Unit* target, float dist, float angle);
        void MoveChase(Unit* target, float dist = 0.0f, float angle = 0.0f);
        void MoveConfused();
        void MoveFleeing(Unit* enemy, uint32 timeLimit = 0);
        void MovePoint(uint32 id, float x,float y,float z, bool generatePath = true, bool lowPriority = false);
        void MoveSeekAssistance(float x,float y,float z);
        void MoveSeekAssistanceDistract(uint32 timer);
        void MoveWaypoint();
        void MoveDistract(uint32 timeLimit);
        void MoveJump(float x, float y, float z, float horizontalSpeed, float max_height, uint32 id = 0);
        void MoveToDestination(float x, float y, float z, float o, Unit* target, float horizontalSpeed, float max_height, uint32 id = 0);
        void MoveSkyDiving(float x, float y, float z, float o, float horizontalSpeed, float max_height, bool eject = false);
        void MoveFall();

        MovementGeneratorType GetCurrentMovementGeneratorType() const;

        void propagateSpeedChange();

        // will only work in MMgens where we have a target (TARGETED_MOTION_TYPE)
        void UpdateFinalDistanceToTarget(float fDistance);

        class UnitStateMgr* impl();
        MovementGenerator*  top();
        Unit* GetOwner() { return m_owner; };
        bool  empty();

        bool GetDestination(float &x, float &y, float &z);

    private:
        void Mutate(MovementGenerator* mgen, UnitActionId slot);                  // use Move* functions instead

        Unit*       m_owner;
        uint8       m_cleanFlag;
};

#define DEFAULT_WALK_SPEED 24.0f

#endif
