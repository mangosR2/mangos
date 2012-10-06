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

#ifndef _WORLDOBJECTEVENTS_H
#define _WORLDOBJECTEVENTS_H

#include "Utilities/EventProcessor.h"
#include "ObjectGuid.h"
#include "SharedDefines.h"
#include "WorldLocation.h"

class Spell;
class Unit;
class Creature;
struct WorldLocation;

enum WorldObjectEventType
{
    WORLDOBJECT_EVENT_TYPE_COMMON         = 0,
    WORLDOBJECT_EVENT_TYPE_UNIQUE         = 1,
    WORLDOBJECT_EVENT_TYPE_REPEATABLE     = 2,
    WORLDOBJECT_EVENT_TYPE_DEATH          = 3,
    WORLDOBJECT_EVENT_TYPE_MAX
};

typedef std::queue<std::pair<uint64, BasicEvent*> > EventNewQueue;

class MANGOS_DLL_SPEC WorldObjectEventProcessor : public EventProcessor
{
    public:
        WorldObjectEventProcessor();
        ~WorldObjectEventProcessor() {};

        void Update(uint32 p_time, bool force = false);
        void KillAllEvents(bool force);
        void CleanupEventList();
        void AddEvent(BasicEvent* Event, uint64 e_time, bool set_addtime = true);
        void RenewEvents();

        uint32 size(bool withQueue = false)  const { return (withQueue ? (m_events.size() + m_queue.size()) :  m_events.size()); };
        bool   empty() const { return m_events.empty(); };

    protected:
        void _AddEvents();
        EventNewQueue m_queue;
};

// Spell events
class SpellEvent : public BasicEvent
{
    public:
        SpellEvent(Spell* spell);
        virtual ~SpellEvent();

        virtual bool Execute(uint64 e_time, uint32 p_time);
        virtual void Abort(uint64 e_time);
        virtual bool IsDeletable() const;
    protected:
        Spell* m_Spell;
};

// Unit events
class ManaUseEvent : public BasicEvent
{
    public:
        ManaUseEvent(Unit& caster) : BasicEvent(WORLDOBJECT_EVENT_TYPE_COMMON), m_caster(caster) {}
        bool Execute(uint64 e_time, uint32 p_time);

    private:
        Unit& m_caster;
};

class RelocationNotifyEvent : public BasicEvent
{
    public:
        RelocationNotifyEvent(Unit& owner);

        bool Execute(uint64 /*e_time*/, uint32 /*p_time*/);

        void Abort(uint64);

    private:
        Unit& m_owner;
};

// Vehicle events
class PassengerEjectEvent : public BasicEvent
{
    public:
        PassengerEjectEvent(uint8 seatId, Unit& vehicle) : BasicEvent(WORLDOBJECT_EVENT_TYPE_UNIQUE), m_seatId(seatId), m_vehicle(vehicle) {}
        bool Execute(uint64 e_time, uint32 p_time);

    private:
        uint8 m_seatId;
        Unit& m_vehicle;
};

// Creature events
class AssistDelayEvent : public BasicEvent
{
    public:
        AssistDelayEvent(ObjectGuid victim, Unit& owner, std::list<Creature*> const& assistants);

        bool Execute(uint64 e_time, uint32 p_time);
    private:
        AssistDelayEvent();

        ObjectGuid m_victimGuid;
        GuidVector m_assistantGuids;
        Unit&      m_owner;
};

class ForcedDespawnDelayEvent : public BasicEvent
{
    public:
        ForcedDespawnDelayEvent(Creature& owner) : BasicEvent(WORLDOBJECT_EVENT_TYPE_UNIQUE), m_owner(owner) { }
        bool Execute(uint64 e_time, uint32 p_time);

    private:
        Creature& m_owner;
};

class AttackResumeEvent : public BasicEvent
{
    public:
        AttackResumeEvent(Unit& owner) : BasicEvent(WORLDOBJECT_EVENT_TYPE_UNIQUE), m_owner(owner), b_force(false) {};
        AttackResumeEvent(Unit& owner, bool force) : BasicEvent(WORLDOBJECT_EVENT_TYPE_UNIQUE), m_owner(owner), b_force(force) {};
        bool Execute(uint64 e_time, uint32 p_time);
    private:
        AttackResumeEvent();
        Unit&   m_owner;
        bool    b_force;
};

class EvadeDelayEvent : public BasicEvent
{
    public:
        EvadeDelayEvent(Unit& owner, bool force = false) : BasicEvent(WORLDOBJECT_EVENT_TYPE_UNIQUE), m_owner(owner), b_force(force) {};
        bool Execute(uint64 e_time, uint32 p_time);
    private:
        EvadeDelayEvent();
        Unit&   m_owner;
        bool    b_force;
};

// Player events
class TeleportDelayEvent : public BasicEvent
{
    public:
        explicit TeleportDelayEvent(Player& owner, WorldLocation const& _location, uint32 _options)
            : BasicEvent(WORLDOBJECT_EVENT_TYPE_UNIQUE), m_owner(owner), m_location(_location), m_options(_options) {};
        bool Execute(uint64 e_time, uint32 p_time);
    private:
        TeleportDelayEvent();
        Player&         m_owner;
        WorldLocation   m_location;
        uint32          m_options;
};

// BattleGround events
/*
    This class is used to invite player to BG again, when minute lasts from his first invitation
    it is capable to solve all possibilities
*/
class BGQueueInviteEvent : public BasicEvent
{
    public:
        BGQueueInviteEvent(ObjectGuid pl_guid, uint32 BgInstanceGUID, BattleGroundTypeId BgTypeId, ArenaType arenaType, uint32 removeTime);
        virtual ~BGQueueInviteEvent() {};

        virtual bool Execute(uint64 e_time, uint32 p_time);
        virtual void Abort(uint64 e_time);
    private:
        ObjectGuid m_PlayerGuid;
        uint32 m_BgInstanceGUID;
        BattleGroundTypeId m_BgTypeId;
        ArenaType m_ArenaType;
        uint32 m_RemoveTime;
};

/*
    This class is used to remove player from BG queue after 1 minute 20 seconds from first invitation
    We must store removeInvite time in case player left queue and joined and is invited again
    We must store bgQueueTypeId, because battleground can be deleted already, when player entered it
*/
class BGQueueRemoveEvent : public BasicEvent
{
    public:
        BGQueueRemoveEvent(ObjectGuid plGuid, uint32 bgInstanceGUID, BattleGroundTypeId BgTypeId, BattleGroundQueueTypeId bgQueueTypeId, uint32 removeTime);
        virtual ~BGQueueRemoveEvent() {}

        virtual bool Execute(uint64 e_time, uint32 p_time);
        virtual void Abort(uint64 e_time);
    private:
        ObjectGuid m_PlayerGuid;
        uint32 m_BgInstanceGUID;
        uint32 m_RemoveTime;
        BattleGroundTypeId m_BgTypeId;
        BattleGroundQueueTypeId m_BgQueueTypeId;
};

#endif
