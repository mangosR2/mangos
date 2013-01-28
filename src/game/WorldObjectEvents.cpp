/*
 * Copyright (C) 2012 /dev/rsa for MangosR2 <http://github.com/MangosR2>
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

#include "Object.h"
#include "WorldObjectEvents.h"
#include "Spell.h"
#include "SpellMgr.h"
#include "Unit.h"
#include "Creature.h"
#include "CreatureAI.h"
#include "PetAI.h"
#include "ObjectMgr.h"
#include "Vehicle.h"
#include "InstanceData.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"
#include "BattleGround/BattleGroundMgr.h"

// Event processor

WorldObjectEventProcessor::WorldObjectEventProcessor()
{
    //m_time = WorldTimer::getMSTime();
    m_events.clear();
}

void WorldObjectEventProcessor::Update(uint32 p_time, bool force)
{
    if (force)
        RenewEvents();

    EventProcessor::Update(p_time);
}

void WorldObjectEventProcessor::KillAllEvents(bool force)
{
    if (force)
        RenewEvents();

    EventProcessor::KillAllEvents(force);
}

void WorldObjectEventProcessor::AddEvent(BasicEvent* Event, uint64 e_time, bool set_addtime)
{
    if (set_addtime)
        Event->m_addTime = m_time;

    Event->m_execTime = e_time;
    m_queue.push(std::pair<uint64, BasicEvent*>(e_time, Event));
}

void WorldObjectEventProcessor::RenewEvents()
{
    while (!m_queue.empty())
    {
        if (m_queue.front().second)
        {
            switch (m_queue.front().second->GetType())
            {
                case WORLDOBJECT_EVENT_TYPE_UNIQUE:
                {
                    bool needInsert = true;
                    for (EventList::const_iterator i = m_events.begin(); i != m_events.end(); ++i)
                    {
                        if (i->second->GetType() == WORLDOBJECT_EVENT_TYPE_UNIQUE)
                        {
                            BasicEvent* event = m_queue.front().second;
                            delete event;
                            needInsert = false;
                            break;
                        }
                    }
                    if (needInsert)
                        m_events.insert(m_queue.front());
                    break;
                }
                case WORLDOBJECT_EVENT_TYPE_REPEATABLE:
                case WORLDOBJECT_EVENT_TYPE_DEATH:
                case WORLDOBJECT_EVENT_TYPE_COMMON:
                default:
                    m_events.insert(m_queue.front());
                    break;
            }
        }
        m_queue.pop();
    }
}

void WorldObjectEventProcessor::CleanupEventList()
{
    KillAllEvents(true);
    m_aborting = false;
}

// Spell events
SpellEvent::SpellEvent(Spell* spell) : BasicEvent(WORLDOBJECT_EVENT_TYPE_COMMON)
{
    m_Spell = spell;
}

SpellEvent::~SpellEvent()
{
    if (m_Spell->getState() != SPELL_STATE_FINISHED)
        m_Spell->cancel();

    if (m_Spell->IsDeletable())
    {
        delete m_Spell;
    }
    else
    {
        sLog.outError("~SpellEvent: %s %u tried to delete non-deletable spell %u. Was not deleted, causes memory leak.",
            (m_Spell->GetCaster()->GetTypeId() == TYPEID_PLAYER ? "Player" : "Creature"), m_Spell->GetCaster()->GetGUIDLow(), m_Spell->m_spellInfo->Id);
    }
}

bool SpellEvent::Execute(uint64 e_time, uint32 p_time)
{
    // update spell if it is not finished
    if (m_Spell->getState() != SPELL_STATE_FINISHED)
        m_Spell->update(p_time);

    // check spell state to process
    switch (m_Spell->getState())
    {
        case SPELL_STATE_FINISHED:
        {
            // spell was finished, check deletable state
            if (m_Spell->IsDeletable())
            {
                // check, if we do have unfinished triggered spells
                return true;                                // spell is deletable, finish event
            }
            // event will be re-added automatically at the end of routine)
        } break;

        case SPELL_STATE_CASTING:
        {
            // this spell is in channeled state, process it on the next update
            // event will be re-added automatically at the end of routine)
        } break;

        case SPELL_STATE_DELAYED:
        {
            // first, check, if we have just started
            if (m_Spell->GetDelayStart() != 0)
            {
                // no, we aren't, do the typical update
                // check, if we have channeled spell on our hands
                if (IsChanneledSpell(m_Spell->m_spellInfo))
                {
                    // evented channeled spell is processed separately, casted once after delay, and not destroyed till finish
                    // check, if we have casting anything else except this channeled spell and autorepeat
                    if (m_Spell->GetCaster()->IsNonMeleeSpellCasted(false, true, true))
                    {
                        // another non-melee non-delayed spell is casted now, abort
                        m_Spell->cancel();
                    }
                    else
                    {
                        // do the action (pass spell to channeling state)
                        m_Spell->handle_immediate();
                    }
                    // event will be re-added automatically at the end of routine)
                }
                else
                {
                    // run the spell handler and think about what we can do next
                    uint64 t_offset = e_time - m_Spell->GetDelayStart();
                    uint64 n_offset = m_Spell->handle_delayed(t_offset);
                    if (n_offset)
                    {
                        // re-add us to the queue
                        m_Spell->GetCaster()->AddEvent(this, m_Spell->GetDelayStart() + n_offset, false);
                        return false;                       // event not complete
                    }
                    // event complete
                    // finish update event will be re-added automatically at the end of routine)
                }
            }
            else
            {
                // delaying had just started, record the moment
                m_Spell->SetDelayStart(e_time);
                // re-plan the event for the delay moment
                m_Spell->GetCaster()->AddEvent(this, e_time + m_Spell->GetDelayMoment(), false);
                return false;                               // event not complete
            }
        } break;

        default:
        {
            // all other states
            // event will be re-added automatically at the end of routine)
        } break;
    }

    // spell processing not complete, plan event on the next update interval
    m_Spell->GetCaster()->AddEvent(this, e_time + 1, false);
    return false;                                           // event not complete
}

void SpellEvent::Abort(uint64 /*e_time*/)
{
    // oops, the spell we try to do is aborted
    if (m_Spell->getState() != SPELL_STATE_FINISHED)
        m_Spell->cancel(true);
}

bool SpellEvent::IsDeletable() const
{
    return m_Spell->IsDeletable();
}

// Unit events
RelocationNotifyEvent::RelocationNotifyEvent(Unit& owner) : BasicEvent(WORLDOBJECT_EVENT_TYPE_COMMON), m_owner(owner)
{
    m_owner._SetAINotifyScheduled(true);
}

bool RelocationNotifyEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    float radius = MAX_CREATURE_ATTACK_RADIUS * sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_AGGRO);
    if (m_owner.GetTypeId() == TYPEID_PLAYER)
    {
        MaNGOS::PlayerRelocationNotifier notify((Player&)m_owner);
        Cell::VisitAllObjects(&m_owner,notify,radius);
    }
    else //if(m_owner.GetTypeId() == TYPEID_UNIT)
    {
        MaNGOS::CreatureRelocationNotifier notify((Creature&)m_owner);
        Cell::VisitAllObjects(&m_owner,notify,radius);
    }
    m_owner._SetAINotifyScheduled(false);
    return true;
};

void RelocationNotifyEvent::Abort(uint64)
{
    m_owner._SetAINotifyScheduled(false);
    to_Abort = true;
};

bool ManaUseEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    m_caster.SetLastManaUse();
    return true;
}

// Creature events
AssistDelayEvent::AssistDelayEvent(ObjectGuid victim, Unit& owner, std::list<Creature*> const& assistants) : BasicEvent(WORLDOBJECT_EVENT_TYPE_COMMON), m_victimGuid(victim), m_owner(owner)
{
    // Pushing guids because in delay can happen some creature gets despawned => invalid pointer
    for (std::list<Creature*>::const_iterator itr = assistants.begin(); itr != assistants.end(); ++itr)
    {
        if ((*itr) && (*itr)->IsInWorld())
            m_assistantGuids.push_back((*itr)->GetObjectGuid());
    }
}

bool AssistDelayEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    if (Unit* victim = m_owner.GetMap()->GetUnit(m_victimGuid))
    {
        while (!m_assistantGuids.empty())
        {
            Creature* assistant = m_owner.GetMap()->GetAnyTypeCreature(*m_assistantGuids.rbegin());
            m_assistantGuids.pop_back();

            if (assistant && assistant->CanAssistTo(&m_owner, victim))
            {
                assistant->SetNoCallAssistance(true);
                if (assistant->AI())
                    assistant->AI()->AttackStart(victim);
            }
        }
    }
    return true;
}

bool AttackResumeEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    if (!m_owner.isAlive())
        return true;

    if (m_owner.hasUnitState(UNIT_STAT_CAN_NOT_REACT) || m_owner.HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED))
        return true;

    Unit* victim = m_owner.getVictim();

    if (!victim || !victim->IsInMap(&m_owner))
        return true;

    switch(m_owner.GetObjectGuid().GetHigh())
    {
        case HIGHGUID_UNIT:
        case HIGHGUID_VEHICLE:
        {
            m_owner.AttackStop(!b_force);
            CreatureAI* ai = ((Creature*)&m_owner)->AI();
            if (ai)
            {
            // Reset EventAI now unsafe, temp disabled (require correct writing EventAI scripts)
            //    if (CreatureEventAI* eventai = (CreatureEventAI*)ai)
            //        eventai->Reset();
                ai->AttackStart(victim);
            }
            break;
        }
        case HIGHGUID_PET:
        {
            m_owner.AttackStop(!b_force);
           ((Pet*)&m_owner)->AI()->AttackStart(victim);
            break;
        }
        case HIGHGUID_PLAYER:
            break;
        default:
            sLog.outError("AttackResumeEvent::Execute try execute for unsupported owner %s!", m_owner.GetObjectGuid().GetString().c_str());
        break;
    }
    return true;
}


bool ForcedDespawnDelayEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    m_owner.ForcedDespawn();
    return true;
}

bool EvadeDelayEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    if (m_owner.IsInEvadeMode())
        return true;

    if (m_owner.SelectHostileTarget(false))
        return true;

    switch (m_owner.GetObjectGuid().GetHigh())
    {
        case HIGHGUID_UNIT:
        case HIGHGUID_VEHICLE:
        {
            Creature* c_owner = (Creature*)(&m_owner);
            if (!c_owner)
                return true;

            if (c_owner->IsAILocked())
                return false;

            if (c_owner->IsDespawned() || c_owner->isCharmed() || c_owner->hasUnitState(UNIT_STAT_CAN_NOT_REACT_OR_LOST_CONTROL))
                return true;

            c_owner->LockAI(true);
            if (CreatureAI* ai = c_owner->AI())
                ai->EnterEvadeMode();
            c_owner->LockAI(false);

            if (InstanceData* mapInstance = c_owner->GetInstanceData())
                mapInstance->OnCreatureEvade(c_owner);
            break;
        }
        case HIGHGUID_PET:
        {
            Creature* c_owner = (Creature*)(&m_owner);
            if (!c_owner)
                return true;

            if (m_owner.GetOwner() && m_owner.GetOwner()->GetTypeId() == TYPEID_UNIT && m_owner.GetOwner()->SelectHostileTarget(false))
                return true;

            if (c_owner->IsAILocked())
                return false;

            if (c_owner->IsDespawned())
                return true;

            Pet* p_owner = (Pet*)(&m_owner);
            if (!p_owner)
                return true;

            CreatureAI* ai = p_owner->AI();
            if (ai)
            {
                if (PetAI* pai = (PetAI*)ai)
                    pai->EnterEvadeMode();
                else
                    ai->EnterEvadeMode();
            }

            if (p_owner->GetOwner() && p_owner->GetOwner()->GetTypeId() == TYPEID_UNIT)
            {
                if (InstanceData* mapInstance = p_owner->GetInstanceData())
                    mapInstance->OnCreatureEvade(c_owner);
            }
            break;
        }
        case HIGHGUID_PLAYER:
        default:
            sLog.outError("EvadeDelayEvent::Execute try execute for unsupported owner %s!", m_owner.GetObjectGuid().GetString().c_str());
        break;
    }
    return true;
}

// Vehicle events
bool PassengerEjectEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    if (!m_vehicle.IsVehicle())
        return true;

    VehicleKitPtr pVehicle = m_vehicle.GetVehicleKit();

    Unit* passenger = pVehicle->GetPassenger(m_seatId);

    if (passenger && passenger->IsInWorld())
    {
        if (!m_vehicle.RemoveSpellsCausingAuraByCaster(SPELL_AURA_CONTROL_VEHICLE, passenger->GetObjectGuid()))
            passenger->ExitVehicle();
    }
    return true;
}

// Player events
bool TeleportDelayEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    if (!m_owner.GetSession() || m_owner.GetSession()->PlayerLogout())
        return true;

    m_owner.SetSemaphoreTeleportDelayEvent(false);
    m_owner.TeleportTo(m_location, m_options);
    return true;
}

// BattleGround events
BGQueueInviteEvent::BGQueueInviteEvent(ObjectGuid pl_guid, uint32 BgInstanceGUID, BattleGroundTypeId BgTypeId, ArenaType arenaType, uint32 removeTime) :
    BasicEvent(WORLDOBJECT_EVENT_TYPE_COMMON), m_PlayerGuid(pl_guid), m_BgInstanceGUID(BgInstanceGUID), m_BgTypeId(BgTypeId), m_ArenaType(arenaType), m_RemoveTime(removeTime)
{
};

bool BGQueueInviteEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    Player* plr = sObjectMgr.GetPlayer( m_PlayerGuid );
    // player logged off (we should do nothing, he is correctly removed from queue in another procedure)
    if (!plr)
        return true;

    BattleGround* bg = sBattleGroundMgr.GetBattleGround(m_BgInstanceGUID, m_BgTypeId);
    //if battleground ended and its instance deleted - do nothing
    if (!bg)
        return true;

    BattleGroundQueueTypeId bgQueueTypeId = BattleGroundMgr::BGQueueTypeId(bg->GetTypeID(), bg->GetArenaType());
    uint32 queueSlot = plr->GetBattleGroundQueueIndex(bgQueueTypeId);
    if (queueSlot < PLAYER_MAX_BATTLEGROUND_QUEUES)         // player is in queue or in battleground
    {
        // check if player is invited to this bg
        BattleGroundQueue &bgQueue = sBattleGroundMgr.m_BattleGroundQueues[bgQueueTypeId];
        if (bgQueue.IsPlayerInvited(m_PlayerGuid, m_BgInstanceGUID, m_RemoveTime))
        {
            WorldPacket data;
            //we must send remaining time in queue
            sBattleGroundMgr.BuildBattleGroundStatusPacket(&data, bg, queueSlot, STATUS_WAIT_JOIN, INVITE_ACCEPT_WAIT_TIME - INVITATION_REMIND_TIME, 0, m_ArenaType);
            plr->GetSession()->SendPacket(&data);
        }
    }
    return true;                                            //event will be deleted
}

void BGQueueInviteEvent::Abort(uint64 /*e_time*/)
{
    //do nothing
}

/*
    this event has many possibilities when it is executed:
    1. player is in battleground ( he clicked enter on invitation window )
    2. player left battleground queue and he isn't there any more
    3. player left battleground queue and he joined it again and IsInvitedToBGInstanceGUID = 0
    4. player left queue and he joined again and he has been invited to same battleground again -> we should not remove him from queue yet
    5. player is invited to bg and he didn't choose what to do and timer expired - only in this condition we should call queue::RemovePlayer
    we must remove player in the 5. case even if battleground object doesn't exist!
*/
BGQueueRemoveEvent::BGQueueRemoveEvent(ObjectGuid plGuid, uint32 bgInstanceGUID, BattleGroundTypeId BgTypeId, BattleGroundQueueTypeId bgQueueTypeId, uint32 removeTime)
    : BasicEvent(WORLDOBJECT_EVENT_TYPE_COMMON), m_PlayerGuid(plGuid), m_BgInstanceGUID(bgInstanceGUID), m_RemoveTime(removeTime), m_BgTypeId(BgTypeId), m_BgQueueTypeId(bgQueueTypeId)
{
};

bool BGQueueRemoveEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    Player* plr = sObjectMgr.GetPlayer( m_PlayerGuid );
    if (!plr)
        // player logged off (we should do nothing, he is correctly removed from queue in another procedure)
        return true;

    BattleGround* bg = sBattleGroundMgr.GetBattleGround(m_BgInstanceGUID, m_BgTypeId);
    //battleground can be deleted already when we are removing queue info
    //bg pointer can be NULL! so use it carefully!

    uint32 queueSlot = plr->GetBattleGroundQueueIndex(m_BgQueueTypeId);
    if (queueSlot < PLAYER_MAX_BATTLEGROUND_QUEUES)         // player is in queue, or in Battleground
    {
        // check if player is in queue for this BG and if we are removing his invite event
        BattleGroundQueue &bgQueue = sBattleGroundMgr.m_BattleGroundQueues[m_BgQueueTypeId];
        if (bgQueue.IsPlayerInvited(m_PlayerGuid, m_BgInstanceGUID, m_RemoveTime))
        {
            DEBUG_LOG("Battleground: removing player %u from bg queue for instance %u because of not pressing enter battle in time.",plr->GetGUIDLow(),m_BgInstanceGUID);

            plr->RemoveBattleGroundQueueId(m_BgQueueTypeId);
            bgQueue.RemovePlayer(m_PlayerGuid, true);
            //update queues if battleground isn't ended
            if (bg && bg->isBattleGround() && bg->GetStatus() != STATUS_WAIT_LEAVE)
                sBattleGroundMgr.ScheduleQueueUpdate(0, ARENA_TYPE_NONE, m_BgQueueTypeId, m_BgTypeId, bg->GetBracketId());

            WorldPacket data;
            sBattleGroundMgr.BuildBattleGroundStatusPacket(&data, bg, queueSlot, STATUS_NONE, 0, 0, ARENA_TYPE_NONE);
            plr->GetSession()->SendPacket(&data);
        }
    }

    //event will be deleted
    return true;
}

void BGQueueRemoveEvent::Abort(uint64 /*e_time*/)
{
    //do nothing
}

