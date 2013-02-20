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

#ifndef MANGOS_CALENDAR_H
#define MANGOS_CALENDAR_H

#include "Policies/Singleton.h"
#include "Common.h"
#include "ObjectGuid.h"
#include "SharedDefines.h"
#include "World.h"

enum CalendarEventType
{
    CALENDAR_TYPE_RAID              = 0,
    CALENDAR_TYPE_DUNGEON           = 1,
    CALENDAR_TYPE_PVP               = 2,
    CALENDAR_TYPE_MEETING           = 3,
    CALENDAR_TYPE_OTHER             = 4
};

enum CalendarInviteStatus
{
    CALENDAR_STATUS_INVITED         = 0,
    CALENDAR_STATUS_ACCEPTED        = 1,
    CALENDAR_STATUS_DECLINED        = 2,
    CALENDAR_STATUS_CONFIRMED       = 3,
    CALENDAR_STATUS_OUT             = 4,
    CALENDAR_STATUS_STANDBY         = 5,
    CALENDAR_STATUS_SIGNED_UP       = 6,
    CALENDAR_STATUS_NOT_SIGNED_UP   = 7,
    CALENDAR_STATUS_TENTATIVE       = 8,
    CALENDAR_STATUS_REMOVED         = 9     // correct name?
};

// commented flag never showed in sniff but handled by client
enum CalendarFlags
{
    CALENDAR_FLAG_ALL_ALLOWED       = 0x001,
    //CALENDAR_FLAG_SYSTEM            = 0x004,
    //CALENDAR_FLAG_HOLLIDAY          = 0x008,
    CALENDAR_FLAG_INVITES_LOCKED    = 0x010,
    CALENDAR_FLAG_GUILD_ANNOUNCEMENT = 0x040,
    //CALENDAR_FLAG_RAID_LOCKOUT      = 0x080,
    //CALENDAR_FLAG_UNK_PLAYER        = 0x102,
    //CALENDAR_FLAG_RAID_RESET        = 0x200,
    CALENDAR_FLAG_GUILD_EVENT       = 0x400
};

enum CalendarRepeatType
{
    CALENDAR_REPEAT_NEVER           = 0,
    CALENDAR_REPEAT_WEEKLY          = 1,
    CALENDAR_REPEAT_BIWEEKLY        = 2,
    CALENDAR_REPEAT_MONTHLY         = 3
};

enum CalendarSendEventType
{
    CALENDAR_SENDTYPE_GET           = 0,
    CALENDAR_SENDTYPE_ADD           = 1,
    CALENDAR_SENDTYPE_COPY          = 2
};

enum CalendarModerationRank
{
    CALENDAR_RANK_PLAYER            = 0,
    CALENDAR_RANK_MODERATOR         = 1,
    CALENDAR_RANK_OWNER             = 2
};

#define CALENDAR_MAX_INVITES        100

enum CalendarStateFlags
{
    CALENDAR_STATE_FLAG_INITIALIZED                = 0,
    CALENDAR_STATE_FLAG_ACTIVE                     = 1,
    CALENDAR_STATE_FLAG_SAVED                      = 2,
    CALENDAR_STATE_FLAG_EXPIRED                    = 3,
    CALENDAR_STATE_FLAG_UPDATED                    = 4,
    CALENDAR_STATE_FLAG_DELETED                    = 7,
};

// forward declaration
class WorldPacket;
class DungeonPersistentState;

class CalendarEvent;
class CalendarInvite;
class CalendarMgr;

typedef UNORDERED_SET<CalendarInvite*> CalendarInvitesList;
typedef UNORDERED_SET<CalendarEvent*> CalendarEventsList;

class CalendarInvite
{
public:

    CalendarInvite() : InviteId(ObjectGuid()), InviteeGuid(ObjectGuid()), SenderGuid(ObjectGuid()), LastUpdateTime(time(NULL)),
        Status(CALENDAR_STATUS_INVITED), Rank(CALENDAR_RANK_PLAYER), Text(), m_calendarEventId(ObjectGuid()), m_flags(0)
        {}

    CalendarInvite(CalendarEvent* calendarEvent, ObjectGuid inviteId, ObjectGuid senderGuid, ObjectGuid inviteeGuid, time_t statusTime,
        CalendarInviteStatus status, CalendarModerationRank rank, std::string text);

    ~CalendarInvite() {}

    ObjectGuid const& GetObjectGuid() const { return InviteId; }
    ObjectGuid const& GetEventGuid() const { return  m_calendarEventId; }

    CalendarEvent const* GetCalendarEvent() const;

    ObjectGuid InviteId;
    ObjectGuid InviteeGuid;
    ObjectGuid SenderGuid;
    time_t LastUpdateTime;
    CalendarInviteStatus Status;
    CalendarModerationRank Rank;
    std::string Text;

    // service flags
    void AddFlag(CalendarStateFlags flag)         { m_flags |= (1 << flag); };
    void RemoveFlag(CalendarStateFlags flag)      { m_flags &= ~(1 << flag); };
    bool HasFlag(CalendarStateFlags flag) const   { return bool(m_flags & (1 << flag)); };

private:
    ObjectGuid m_calendarEventId;
    uint32 m_flags;
};

class CalendarEvent
{
public:

    CalendarEvent(ObjectGuid eventId, ObjectGuid creatorGUID, uint32 guildId, CalendarEventType type, int32 dungeonId,
        time_t eventTime, uint32 flags, time_t unknownTime, std::string title, std::string description) :
        EventId(eventId), CreatorGuid(creatorGUID), GuildId(guildId), Type(type), DungeonId(dungeonId),
        EventTime(eventTime), Flags(flags), UnknownTime(unknownTime), Title(title),
        Description(description), m_flags(0)
        {
            m_Invitee.clear();
        }

    CalendarEvent() : EventId(ObjectGuid()), CreatorGuid(ObjectGuid()), GuildId(0), Type(CALENDAR_TYPE_OTHER), DungeonId(-1), EventTime(0),
        Flags(0), UnknownTime(0), Title(), Description(), m_flags(0)
        {
            m_Invitee.clear();
        }

    ~CalendarEvent();

    ObjectGuid const& GetObjectGuid() const { return EventId; }

    bool IsGuildEvent() const { return Flags & CALENDAR_FLAG_GUILD_EVENT; }
    bool IsGuildAnnouncement() const { return Flags & CALENDAR_FLAG_GUILD_ANNOUNCEMENT; }

    bool AddInvite(CalendarInvite* invite);

    GuidSet const* GetInvites() const { return &m_Invitee; }

    CalendarInvite* GetInviteById(ObjectGuid const& inviteId);
    CalendarInvite* GetInviteByGuid(ObjectGuid const& guid);

    bool RemoveInviteById(ObjectGuid inviteId, ObjectGuid const& removerGuid);
    void RemoveInviteByGuid(ObjectGuid const& playerGuid);
    void RemoveInviteById(ObjectGuid const& inviteId);

    void SendMailOnRemoveEvent(ObjectGuid const& removerGuid);

    ObjectGuid EventId;
    ObjectGuid CreatorGuid;
    uint32     GuildId;
    CalendarEventType Type;
    CalendarRepeatType Repeatable;
    int32 DungeonId;
    time_t EventTime;
    uint32 Flags;
    time_t UnknownTime;
    std::string Title;
    std::string Description;

    // service flags
    void AddFlag(CalendarStateFlags flag)         { m_flags |= (1 << flag); };
    void RemoveFlag(CalendarStateFlags flag)      { m_flags &= ~(1 << flag); };
    bool HasFlag(CalendarStateFlags flag) const   { return bool(m_flags & (1 << flag)); };

private:
    GuidSet m_Invitee;
    void RemoveAllInvite();
    uint32 m_flags;
};

typedef UNORDERED_MAP<ObjectGuid, CalendarInvite> CalendarInviteStore;
typedef UNORDERED_MAP<ObjectGuid, CalendarEvent> CalendarEventStore;

class CalendarMgr : public MaNGOS::Singleton<CalendarMgr, MaNGOS::ClassLevelLockable<CalendarMgr, ACE_Thread_Mutex> >
{
    public:
        CalendarMgr();
        ~CalendarMgr();

    private:
        CalendarEventStore  m_EventStore;
        CalendarInviteStore m_InviteStore;

        // first free low guid for selected guid type
        ObjectGuidGenerator<HIGHGUID_CALENDAR_EVENT>     m_EventGuids;
        ObjectGuidGenerator<HIGHGUID_INVITE>             m_InviteGuids;
        uint32 GenerateEventLowGuid()                    { return m_EventGuids.Generate();  }
        uint32 GenerateInviteLowGuid()                   { return m_InviteGuids.Generate(); }

        // remapping DB ids
        #define DELETED_ID UINT32_MAX
        enum TRemapAction
        {
            RA_DEL_EXPIRED,
            RA_REMAP_EVENTS,
            RA_REMAP_INVITES
        };
        typedef std::pair<uint32, uint32> TRemapGee;
        typedef std::list<TRemapGee> TRemapData;

        struct IsNotRemap { bool operator() (const TRemapGee& gee) { return gee.first == gee.second || gee.second == DELETED_ID; } };

        bool IsEventReadyForRemove(time_t eventTime)
        {
            int32 delaySec = sWorld.getConfig(CONFIG_INT32_CALENDAR_REMOVE_EXPIRED_EVENTS_DELAY);
            return delaySec < 0 ? false : eventTime + time_t(delaySec) <= time(NULL);
        }
        void DBRemap(TRemapAction remapAction, TRemapData& remapData, bool& dbTransactionUsed);
        void DBRemoveExpiredEventsAndRemapData();

        // utils
        inline bool IsDeletedEvent(CalendarEventStore::const_iterator iter) { return iter->second.HasFlag(CALENDAR_STATE_FLAG_DELETED); }
        inline bool IsValidEvent(CalendarEventStore::const_iterator iter) { return iter != m_EventStore.end() && !IsDeletedEvent(iter); }

        inline bool IsDeletedInvite(CalendarInviteStore::const_iterator iter) { return iter->second.HasFlag(CALENDAR_STATE_FLAG_DELETED); }
        inline bool IsValidInvite(CalendarInviteStore::const_iterator iter) { return iter != m_InviteStore.end() && !IsDeletedInvite(iter); }

    public:
        CalendarEventsList* GetPlayerEventsList(ObjectGuid const& guid);
        CalendarInvitesList* GetPlayerInvitesList(ObjectGuid const& guid);
        CalendarEvent* AddEvent(ObjectGuid const& guid, std::string title, std::string description, uint32 type, uint32 repeatable, uint32 maxInvites,
            int32 dungeonId, time_t eventTime, time_t unkTime, uint32 flags);

        CalendarInvite* AddInvite(CalendarEvent* event, ObjectGuid const& senderGuid, ObjectGuid const& inviteeGuid, CalendarInviteStatus status, CalendarModerationRank rank, std::string text, time_t statusTime);

        void RemoveEvent(ObjectGuid const& eventId, ObjectGuid const& remover);
        bool RemoveInvite(ObjectGuid const& eventId, ObjectGuid const& invitId, ObjectGuid const& removerGuid);
        void RemovePlayerCalendar(ObjectGuid const& playerGuid);
        void RemoveGuildCalendar(ObjectGuid const& playerGuid, uint32 GuildId);

        void CopyEvent(ObjectGuid const& eventId, time_t newTime, ObjectGuid const& guid);
        uint32 GetPlayerNumPending(ObjectGuid const& guid);

        // Main calendar search methods.
        CalendarEvent* GetEventById(ObjectGuid const& eventId);
        CalendarInvite* GetInviteById(ObjectGuid const& inviteId);

        // World thread update system
        void Update();

        // Save/load system
        void LoadFromDB();
        void SaveToDB();
        void SaveEventToDB(CalendarEvent const* event);
        void SaveInviteToDB(CalendarInvite const* invite);
        void DeleteEventFromDB(ObjectGuid const& eventGuid);
        void DeleteInviteFromDB(ObjectGuid const& inviteGuid);

        // send data to client function
        void SendCalendarEventInvite(CalendarInvite const* invite);
        void SendCalendarEventInviteAlert(CalendarInvite const* invite);
        void SendCalendarCommandResult(ObjectGuid const& guid, CalendarResponseResult err, char const* param = NULL);
        void SendCalendarEventRemovedAlert(CalendarEvent const* event);
        void SendCalendarEvent(ObjectGuid const& guid, CalendarEvent const* event, uint32 sendType);
        void SendCalendarEventInviteRemoveAlert(ObjectGuid const& guid, CalendarEvent const* event, CalendarInviteStatus status);
        void SendCalendarEventInviteRemove(CalendarInvite const* invite, CalendarEvent const* event, uint32 flags);
        void SendCalendarEventStatus(CalendarInvite const* invite);
        void SendCalendarClearPendingAction(ObjectGuid const& guid);
        void SendCalendarEventModeratorStatusAlert(CalendarInvite const* invite);
        void SendCalendarEventUpdateAlert(CalendarEvent const* event, time_t oldEventTime);
        void SendCalendarRaidLockoutRemove(ObjectGuid const& guid, DungeonPersistentState const* save);
        void SendCalendarRaidLockoutAdd(ObjectGuid const& guid, DungeonPersistentState const* save);

        void SendPacketToAllEventRelatives(WorldPacket packet, CalendarEvent const* event);

    private:
        // multithread locking
        typedef   MANGOSR2_MUTEX_MODEL         LockType;
        typedef   ACE_Read_Guard<LockType>     ReadGuard;
        typedef   ACE_Write_Guard<LockType>    WriteGuard;

        LockType& GetLock() { return i_lock; }
        LockType            i_lock;
};

#define sCalendarMgr MaNGOS::Singleton<CalendarMgr>::Instance()

#endif
