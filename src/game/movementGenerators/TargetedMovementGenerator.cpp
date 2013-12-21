/*
 * Copyright (C) 2005-2012 MaNGOS <http://getmangos.com/>
 * Copyright (c) 2013 MangosR2 <http://github.com/MangosR2>
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

#include "TargetedMovementGenerator.h"
#include "ByteBuffer.h"
#include "Errors.h"
#include "Creature.h"
#include "CreatureAI.h"
#include "Player.h"
#include "World.h"
#include "movement/MoveSplineInit.h"
#include "movement/MoveSpline.h"

//-----------------------------------------------//

// some spells should be able to be cast while moving
// maybe some attribute? here, check the entry of creatures useing these spells
bool IsAbleMoveWhenCast(uint32 npcId)
{
    switch (npcId)
    {
        case 36633: // Ice Sphere (Lich King)
        case 37562: // Volatile Ooze and Gas Cloud (Putricide)
        case 37697: // Volatile Ooze
            return true;
    }
    return false;
}

//-----------------------------------------------//

template<class T, typename D>
void TargetedMovementGeneratorMedium<T, D>::_setTargetLocation(T& owner, bool updateDestination)
{
    if (!m_target.isValid() || !m_target->IsInWorld())
        return;

    if (owner.hasUnitState(UNIT_STAT_NOT_MOVE))
        return;

    if (owner.IsNonMeleeSpellCasted(false) && !IsAbleMoveWhenCast(owner.GetEntry()))
        return;

    if (!m_target->isInAccessablePlaceFor(&owner))
        return;

    float x, y, z;

    // m_path can be NULL in case this is the first call for this MMGen (via Update)
    // Can happen for example if no path was created on MMGen-Initialize because of the owner being stunned
    if (updateDestination || !m_path)
    {
        owner.GetPosition(x, y, z);

        // Prevent redundant micro-movement for pets, other followers.
        if (!RequiresNewPosition(owner, x, y, z))
        {
            if (!owner.movespline->Finalized())
                return;
        }
        else
        {
            float absAngle;

            // Chase Movement and angle == 0 case: Chase to current angle
            if (this->GetMovementGeneratorType() == CHASE_MOTION_TYPE && m_angle == 0.0f)
                absAngle = m_target->GetAngle(&owner);
            // Targeted movement to at m_offset distance from target and m_angle from target facing
            else
                absAngle = m_target->GetOrientation() + m_angle;

            m_target->GetNearPoint(&owner, x, y, z, owner.GetObjectBoundingRadius(),
                static_cast<D*>(this)->GetDynamicTargetDistance(owner, false), absAngle);

            // Add hover height
            if (owner.IsLevitating())
                z += owner.GetFloatValue(UNIT_FIELD_HOVERHEIGHT);
        }
    }
    else
    {
        // the destination has not changed, we just need to refresh the path (usually speed change)
        G3D::Vector3 endPos = m_path->getEndPosition();
        x = endPos.x;
        y = endPos.y;
        z = endPos.z;
    }

    if (!m_path)
        m_path = new PathFinder(&owner);

    // allow pets following their master to cheat while generating paths
    bool forceDest = (owner.GetTypeId() == TYPEID_UNIT &&
        ((Creature*)&owner)->IsPet() && owner.hasUnitState(UNIT_STAT_FOLLOW));

    m_path->calculate(x, y, z, forceDest);

    // don't move if path points equivalent
    if (m_path->getStartPosition() == m_path->getEndPosition())
    {
        owner.StopMoving();
        return;
    }

    if (m_path->getPathType() & PATHFIND_NOPATH)
    {
        DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS,"TargetedMovementGeneratorMedium::  unit %s cannot find path to %s (%f, %f, %f),  gained PATHFIND_NOPATH! Owerride used.",
            owner.GetGuidStr().c_str(),
            m_target.isValid() ? m_target->GetObjectGuid().GetString().c_str() : "<none>",
            x, y, z);
        //return;
    }

    D::_addUnitStateMove(owner);
    m_targetReached = false;
    m_speedChanged = false;

    Movement::MoveSplineInit<Unit*> init(owner);
    init.MovebyPath(m_path->getPath());
    init.SetSmooth(); // fix broken fly movement for old creatures
    init.SetWalk(
        ((D*)this)->EnableWalking() ||
        // hack for old creatures with bugged fly animation
        (owner.GetTypeId() == TYPEID_UNIT && owner.IsLevitating() && owner.GetFloatValue(UNIT_FIELD_HOVERHEIGHT) == 0.0f));
    init.Launch();
}

enum
{
    RECHECK_DISTANCE_TIMER_FOLLOW   = 50,
    RECHECK_DISTANCE_TIMER          = 100,
    TARGET_NOT_ACCESSIBLE_MAX_TIMER = 5000
};

template<class T, typename D>
bool TargetedMovementGeneratorMedium<T, D>::Update(T& owner, const uint32& time_diff)
{
    if (!m_target.isValid() || !m_target->IsInWorld())
        return false;

    if (!owner.isAlive())
        return true;

    if (owner.hasUnitState(UNIT_STAT_NOT_MOVE) || (owner.IsInUnitState(UNIT_ACTION_CHASE) && owner.hasUnitState(UNIT_STAT_NO_COMBAT_MOVEMENT)))
    {
        D::_clearUnitStateMove(owner);
        return true;
    }

    // prevent movement while casting spells with cast time or channel time
    if (owner.IsNonMeleeSpellCasted(false, false, true) && !IsAbleMoveWhenCast(owner.GetEntry()))
    {
        owner.StopMoving();
        return true;
    }

    // prevent crash after creature killed pet
    if (static_cast<D*>(this)->_lostTarget(owner))
    {
        D::_clearUnitStateMove(owner);
        if (m_waitTargetTimer >= TARGET_NOT_ACCESSIBLE_MAX_TIMER)
            return false;
        else
        {
            m_waitTargetTimer += 5 * time_diff;
            return true;
        }
    }

    if (!m_target->isInAccessablePlaceFor(&owner))
        return true;

    bool moveToTarget = false;

    m_recheckDistanceTimer.Update(time_diff);
    if (m_recheckDistanceTimer.Passed())
    {
        m_recheckDistanceTimer.Reset(this->GetMovementGeneratorType() == FOLLOW_MOTION_TYPE
            ? RECHECK_DISTANCE_TIMER_FOLLOW
            : RECHECK_DISTANCE_TIMER);

        G3D::Vector3 dest = owner.movespline->FinalDestination();
        moveToTarget = dest == Vector3() ? true : RequiresNewPosition(owner, dest.x, dest.y, dest.z);

        if (owner.GetTypeId() == TYPEID_UNIT && !((Creature*)&owner)->IsPet())
        {
            Unit* pVictim = owner.getVictim();
            if (pVictim && pVictim->GetObjectGuid() == m_target->GetObjectGuid())
            {
                if (!pVictim->isAlive() && owner.movespline->Finalized())
                    return false;

                if (!m_offset && owner.movespline->Finalized() && !owner.CanReachWithMeleeAttack(pVictim) &&
                    !m_target->m_movementInfo.HasMovementFlag(MOVEFLAG_PENDINGSTOP))
                {
                    if (m_waitTargetTimer < TARGET_NOT_ACCESSIBLE_MAX_TIMER)
                        m_waitTargetTimer += m_recheckDistanceTimer.GetExpiry();
                    else
                        return false;
                }
                else
                    m_waitTargetTimer = 0;
            }
        }
    }

    if (m_speedChanged || moveToTarget)
        _setTargetLocation(owner, moveToTarget);

    if (owner.movespline->Finalized())
    {
        if (fabs(m_angle) < M_NULL_F && !owner.HasInArc(0.01f, m_target.getTarget()))
            owner.SetInFront(m_target.getTarget());

        if (!m_targetReached)
        {
            m_targetReached = true;
            static_cast<D*>(this)->_reachTarget(owner);
        }
    }
    return true;
}

template<class T, typename D>
bool TargetedMovementGeneratorMedium<T, D>::RequiresNewPosition(T& owner, float x, float y, float z)
{
    if ((owner.GetTypeId() == TYPEID_UNIT && ((Creature*)&owner)->CanFly()) || owner.IsLevitating())
        return !m_target->IsWithinDist3d(x, y, z, static_cast<D*>(this)->GetDynamicTargetDistance(owner, true));
    else
        return !m_target->IsWithinDist2d(x, y, static_cast<D*>(this)->GetDynamicTargetDistance(owner, true));
}

//-----------------------------------------------//

template<class T>
void ChaseMovementGenerator<T>::_reachTarget(T& owner)
{
    if (owner.CanReachWithMeleeAttack(this->m_target.getTarget()))
        owner.Attack(this->m_target.getTarget(), true);
}

template<>
void ChaseMovementGenerator<Player>::Initialize(Player& owner)
{
    owner.addUnitState(UNIT_STAT_CHASE | UNIT_STAT_CHASE_MOVE);
    _setTargetLocation(owner, true);
}

template<>
void ChaseMovementGenerator<Creature>::Initialize(Creature& owner)
{
    owner.SetWalk(false, false);                            // Chase movement is running
    owner.addUnitState(UNIT_STAT_CHASE | UNIT_STAT_CHASE_MOVE);

    Unit* pVictim = owner.getVictim();
    if (pVictim && !owner.hasUnitState(UNIT_STAT_MELEE_ATTACKING))
        owner.Attack(pVictim, !owner.IsNonMeleeSpellCasted(true));
}

template<class T>
void ChaseMovementGenerator<T>::Finalize(T& owner)
{
    owner.clearUnitState(UNIT_STAT_CHASE | UNIT_STAT_CHASE_MOVE);
}

template<class T>
void ChaseMovementGenerator<T>::Interrupt(T& owner)
{
    owner.InterruptMoving();
    owner.clearUnitState(UNIT_STAT_CHASE | UNIT_STAT_CHASE_MOVE);
}

template<class T>
void ChaseMovementGenerator<T>::Reset(T& owner)
{
    Initialize(owner);
}

// Chase-Movement: These factors depend on combat-reach distance
#define CHASE_DEFAULT_RANGE_FACTOR  0.50f
#define CHASE_RECHASE_RANGE_FACTOR  0.75f

template<class T>
float ChaseMovementGenerator<T>::GetDynamicTargetDistance(T& owner, bool forRangeCheck) const
{
    if (forRangeCheck)
        return CHASE_RECHASE_RANGE_FACTOR * this->m_target->GetCombatReach(&owner) - this->m_target->GetObjectBoundingRadius();
    else
        return CHASE_DEFAULT_RANGE_FACTOR * this->m_target->GetCombatReach(&owner) + this->m_offset;
}

//-----------------------------------------------//

template<class T>
void FollowMovementGenerator<T>::_reachTarget(T& u)
{
    if (u.GetTypeId() == TYPEID_PLAYER)
        return;

    if (Unit* pOwner = u.GetOwner())
    {
        if (fabs(pOwner->GetOrientation() - u.GetOrientation()) > M_PI_F / 8.0f)
            u.SetFacingTo(pOwner->GetOrientation());
    }
}

template<>
bool FollowMovementGenerator<Creature>::EnableWalking() const
{
    return m_target.isValid() && m_target->IsWalking();
}

template<>
bool FollowMovementGenerator<Player>::EnableWalking() const
{
    return false;
}

template<>
void FollowMovementGenerator<Player>::_updateSpeed(Player& /*u*/)
{
    // nothing to do for Player
}

template<>
void FollowMovementGenerator<Creature>::_updateSpeed(Creature& u)
{
    u.UpdateSpeed(MOVE_RUN, true);
    u.UpdateSpeed(MOVE_WALK, true);
    u.UpdateSpeed(MOVE_SWIM, true);
}

template<>
void FollowMovementGenerator<Player>::Initialize(Player& owner)
{
    owner.addUnitState(UNIT_STAT_FOLLOW | UNIT_STAT_FOLLOW_MOVE);
    _updateSpeed(owner);
    _setTargetLocation(owner, true);
}

template<>
void FollowMovementGenerator<Creature>::Initialize(Creature& owner)
{
    owner.addUnitState(UNIT_STAT_FOLLOW | UNIT_STAT_FOLLOW_MOVE);
    _updateSpeed(owner);
    _setTargetLocation(owner, true);
}

template<class T>
void FollowMovementGenerator<T>::Finalize(T& owner)
{
    owner.clearUnitState(UNIT_STAT_FOLLOW | UNIT_STAT_FOLLOW_MOVE);
    _updateSpeed(owner);
}

template<class T>
void FollowMovementGenerator<T>::Interrupt(T& owner)
{
    owner.InterruptMoving();
    owner.clearUnitState(UNIT_STAT_FOLLOW | UNIT_STAT_FOLLOW_MOVE);
    _updateSpeed(owner);
}

template<class T>
void FollowMovementGenerator<T>::Reset(T& owner)
{
    Initialize(owner);
}

template<class T>
float FollowMovementGenerator<T>::GetDynamicTargetDistance(T& owner, bool forRangeCheck) const
{
    float addRange = forRangeCheck
        ? sWorld.getConfig(CONFIG_FLOAT_RATE_TARGET_POS_RECALCULATION_RANGE)
        : this->m_offset;

    return owner.GetObjectBoundingRadius() + this->m_target->GetObjectBoundingRadius() + addRange;
}

//-----------------------------------------------//

template void TargetedMovementGeneratorMedium<Player, ChaseMovementGenerator<Player> >::_setTargetLocation(Player&, bool);
template void TargetedMovementGeneratorMedium<Player, FollowMovementGenerator<Player> >::_setTargetLocation(Player&, bool);
template void TargetedMovementGeneratorMedium<Creature, ChaseMovementGenerator<Creature> >::_setTargetLocation(Creature&, bool);
template void TargetedMovementGeneratorMedium<Creature, FollowMovementGenerator<Creature> >::_setTargetLocation(Creature&, bool);
template bool TargetedMovementGeneratorMedium<Player, ChaseMovementGenerator<Player> >::Update(Player&, const uint32&);
template bool TargetedMovementGeneratorMedium<Player, FollowMovementGenerator<Player> >::Update(Player&, const uint32&);
template bool TargetedMovementGeneratorMedium<Creature, ChaseMovementGenerator<Creature> >::Update(Creature&, const uint32&);
template bool TargetedMovementGeneratorMedium<Creature, FollowMovementGenerator<Creature> >::Update(Creature&, const uint32&);

template void ChaseMovementGenerator<Player>::_reachTarget(Player&);
template void ChaseMovementGenerator<Creature>::_reachTarget(Creature&);
template void ChaseMovementGenerator<Player>::Finalize(Player&);
template void ChaseMovementGenerator<Creature>::Finalize(Creature&);
template void ChaseMovementGenerator<Player>::Interrupt(Player&);
template void ChaseMovementGenerator<Creature>::Interrupt(Creature&);
template void ChaseMovementGenerator<Player>::Reset(Player&);
template void ChaseMovementGenerator<Creature>::Reset(Creature&);
template float ChaseMovementGenerator<Creature>::GetDynamicTargetDistance(Creature&, bool) const;
template float ChaseMovementGenerator<Player>::GetDynamicTargetDistance(Player&, bool) const;

template void FollowMovementGenerator<Player>::_reachTarget(Player&);
template void FollowMovementGenerator<Creature>::_reachTarget(Creature&);
template void FollowMovementGenerator<Player>::Finalize(Player&);
template void FollowMovementGenerator<Creature>::Finalize(Creature&);
template void FollowMovementGenerator<Player>::Interrupt(Player&);
template void FollowMovementGenerator<Creature>::Interrupt(Creature&);
template void FollowMovementGenerator<Player>::Reset(Player&);
template void FollowMovementGenerator<Creature>::Reset(Creature&);
template float FollowMovementGenerator<Creature>::GetDynamicTargetDistance(Creature&, bool) const;
template float FollowMovementGenerator<Player>::GetDynamicTargetDistance(Player&, bool) const;
