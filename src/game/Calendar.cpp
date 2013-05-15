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

#include "Calendar.h"
#include "Guild.h"
#include "GuildMgr.h"
#include "ObjectMgr.h"
#include "Mail.h"
#include "MapPersistentStateMgr.h"
#include "ProgressBar.h"

INSTANTIATE_SINGLETON_1(CalendarMgr);

//////////////////////////////////////////////////////////////////////////
// CalendarEvent Class
//////////////////////////////////////////////////////////////////////////

CalendarEvent::~CalendarEvent()
{
    RemoveAllInvite();
}

// Add an invite to internal invite set return true if success
bool CalendarEvent::AddInvite(CalendarInvite* invite)
{
    if (!invite)
        return false;

    if (m_Invitee.find(invite->GetObjectGuid()) != m_Invitee.end())
        return false;

    m_Invitee.insert(invite->GetObjectGuid());
    return true;
}

CalendarInvite* CalendarEvent::GetInviteById(ObjectGuid const& inviteId)
{
    if (m_Invitee.find(inviteId) != m_Invitee.end())
        return sCalendarMgr.GetInviteById(inviteId);

    return NULL;
}

CalendarInvite* CalendarEvent::GetInviteByGuid(ObjectGuid const& guid)
{
    if (guid.IsEmpty() || !guid.IsPlayer())
        return NULL;

    for (GuidSet::const_iterator itr = m_Invitee.begin(); itr != m_Invitee.end(); ++itr)
    {
        CalendarInvite* invite = sCalendarMgr.GetInviteById(*itr);
        if (!invite)
            continue;

        if (invite->InviteeGuid == guid)
            return invite;
    }
    return NULL;
}

void CalendarEvent::RemoveInviteById(ObjectGuid const& inviteId)
{
    CalendarInvite* invite = sCalendarMgr.GetInviteById(inviteId);
    if (!invite)
        return;

    // TODO: check why only send alert if its not guild event
    if (!IsGuildEvent())
        sCalendarMgr.SendCalendarEventInviteRemoveAlert(invite->InviteeGuid, this, CALENDAR_STATUS_REMOVED);

    sCalendarMgr.SendCalendarEventInviteRemove(invite, this, Flags);

    invite->AddFlag(CALENDAR_STATE_FLAG_DELETED);
}

void CalendarEvent::RemoveInviteByGuid(ObjectGuid const& playerGuid)
{
    if (playerGuid.IsEmpty() || !playerGuid.IsPlayer())
        return;

    for (GuidSet::const_iterator itr = m_Invitee.begin(); itr != m_Invitee.end(); ++itr)
    {
        CalendarInvite* invite = sCalendarMgr.GetInviteById(*itr);
        if (!invite)
            continue;

        if (invite->InviteeGuid == playerGuid)
            RemoveInviteById(*itr);
    }
}

bool CalendarEvent::RemoveInviteById(ObjectGuid inviteId, ObjectGuid const& removerGuid)
{
    CalendarInvite* invite = GetInviteById(inviteId);
    if (!invite)
    {
        // invite not found
        sCalendarMgr.SendCalendarCommandResult(removerGuid, CALENDAR_ERROR_NO_INVITE);
        return false;
    }

    if (invite->InviteeGuid != removerGuid)
    {
        // check if remover is an invitee
        CalendarInvite* removerInvite = GetInviteByGuid(removerGuid);
        if (removerInvite == NULL)
        {
            // remover is not invitee cheat???
            sCalendarMgr.SendCalendarCommandResult(removerGuid, CALENDAR_ERROR_NOT_INVITED);
            return false;
        }

        if (removerInvite->Rank != CALENDAR_RANK_MODERATOR && removerInvite->Rank != CALENDAR_RANK_OWNER)
        {
            // remover have not enough right to remove invite
            sCalendarMgr.SendCalendarCommandResult(removerGuid, CALENDAR_ERROR_PERMISSIONS);
            return false;
        }
    }

    if (CreatorGuid == invite->InviteeGuid)
    {
        sCalendarMgr.SendCalendarCommandResult(removerGuid, CALENDAR_ERROR_DELETE_CREATOR_FAILED);
        return false;
    }

    // TODO: Send mail to invitee if needed

    RemoveInviteById(inviteId);
    return true;
}

void CalendarEvent::RemoveAllInvite()
{
    for (GuidSet::const_iterator itr = m_Invitee.begin(); itr != m_Invitee.end(); ++itr)
    {
        CalendarInvite* invite = sCalendarMgr.GetInviteById(*itr);
        if (!invite)
            continue;
        RemoveInviteById(*itr);
    }
}

void CalendarEvent::SendMailOnRemoveEvent(ObjectGuid const& removerGuid)
{
    // only event creator in list
    if (m_Invitee.size() <= 1)
        return;

    // build mail title
    std::ostringstream title;
    title << removerGuid << ':' << Title;

    // build mail body
    std::ostringstream body;
    body << secsToTimeBitFields(time(NULL));

    // creating mail draft
    MailDraft draft(title.str(), body.str());

    for (GuidSet::const_iterator itr = m_Invitee.begin(); itr != m_Invitee.end(); ++itr)
    {
        CalendarInvite* invite = sCalendarMgr.GetInviteById(*itr);
        if (invite && invite->InviteeGuid != removerGuid)
            draft.SendMailTo(MailReceiver(invite->InviteeGuid), this, MAIL_CHECK_MASK_COPIED);
    }
}

//////////////////////////////////////////////////////////////////////////
// CalendarInvite Classes
//////////////////////////////////////////////////////////////////////////

CalendarInvite::CalendarInvite(CalendarEvent* event, ObjectGuid inviteId, ObjectGuid senderGuid, ObjectGuid inviteeGuid, time_t statusTime, CalendarInviteStatus status, CalendarModerationRank rank, std::string text) :
    InviteId(inviteId), InviteeGuid(inviteeGuid), SenderGuid(senderGuid), LastUpdateTime(statusTime), Status(status), Rank(rank), Text(text), m_flags(0)
{
    // only for pre invite case
    if (!event)
    {
        InviteId.Clear();
        m_calendarEventId.Clear();
    }
    else
        m_calendarEventId = event->GetObjectGuid();
}

CalendarEvent const* CalendarInvite::GetCalendarEvent() const
{
    return sCalendarMgr.GetEventById(m_calendarEventId);
}

//////////////////////////////////////////////////////////////////////////
// CalendarMgr Classes
//////////////////////////////////////////////////////////////////////////

CalendarMgr::CalendarMgr()
{
}

CalendarMgr::~CalendarMgr()
{
   m_InviteStore.clear();
   m_EventStore.clear();
}

CalendarEvent* CalendarMgr::GetEventById(ObjectGuid const& eventId)
{
    //ReadGuard guard(GetLock());
    CalendarEventStore::iterator iter = m_EventStore.find(eventId);
    return IsValidEvent(iter) ? &iter->second : NULL;
}

CalendarInvite* CalendarMgr::GetInviteById(ObjectGuid const& inviteId)
{
    //ReadGuard guard(GetLock());
    CalendarInviteStore::iterator iter = m_InviteStore.find(inviteId);
    return IsValidInvite(iter) ? &iter->second : NULL;
}

CalendarEventsList* CalendarMgr::GetPlayerEventsList(ObjectGuid const& guid)
{
    CalendarEventsList* events = new CalendarEventsList;

    uint32 guildId = 0;
    Player* player = sObjectMgr.GetPlayer(guid);
    guildId = (player) ? player->GetGuildId() : Player::GetGuildIdFromDB(guid);

    ReadGuard guard(GetLock());
    for (CalendarEventStore::iterator iter = m_EventStore.begin(); iter != m_EventStore.end(); ++iter)
    {
        if (IsDeletedEvent(iter))
            continue;

        CalendarEvent& event = iter->second;

        // add own event and same guild event or announcement
        if ((event.CreatorGuid == guid) || ((event.IsGuildAnnouncement() || event.IsGuildEvent()) && event.GuildId == guildId))
        {
            events->insert(&event);
            continue;
        }

        // add all event where player is invited
        if (event.GetInviteByGuid(guid))
            events->insert(&event);
    }
    return events;
}

CalendarInvitesList* CalendarMgr::GetPlayerInvitesList(ObjectGuid const& guid)
{
    CalendarInvitesList* invites = new CalendarInvitesList;

    uint32 guildId = 0;
    Player* player = sObjectMgr.GetPlayer(guid);
    guildId = (player) ? player->GetGuildId() : Player::GetGuildIdFromDB(guid);

    // ReadGuard guard(GetLock());
    // FIXME - need use main invites list instead of

    for (CalendarEventStore::iterator iter = m_EventStore.begin(); iter != m_EventStore.end(); ++iter)
    {
        CalendarEvent& event = iter->second;

        if (event.HasFlag(CALENDAR_STATE_FLAG_DELETED))
            continue;

        if (event.IsGuildAnnouncement())
            continue;

        GuidSet const* cInvMap = event.GetInvites();

        for (GuidSet::const_iterator itr = cInvMap->begin(); itr != cInvMap->end(); ++itr)
        {
            CalendarInvite* invite = sCalendarMgr.GetInviteById(*itr);
            if (!invite)
                continue;

            if (invite->InviteeGuid == guid)
            {
                invites->insert(invite);
                break;
            }
        }
    }
    return invites;
}

CalendarEvent* CalendarMgr::AddEvent(ObjectGuid const& guid, std::string title, std::string description, uint32 type, uint32 repeatable,
    uint32 maxInvites, int32 dungeonId, time_t eventTime, time_t unkTime, uint32 flags)
{
    Player* player = sObjectMgr.GetPlayer(guid);
    if (!player)
        return NULL;

    if (title.empty())
    {
        SendCalendarCommandResult(guid, CALENDAR_ERROR_NEEDS_TITLE);
        return NULL;
    }

    if (eventTime < time(NULL))
    {
        SendCalendarCommandResult(guid, CALENDAR_ERROR_INVALID_DATE);
        return NULL;
    }

    ObjectGuid eventGuid = ObjectGuid(HIGHGUID_CALENDAR_EVENT, GenerateEventLowGuid());

    DEBUG_FILTER_LOG(LOG_FILTER_CALENDAR, "CalendarMgr::AddEvent %u, '%s', Desc > '%s', type=%u, repeat=%u, maxInvites=%u, dungeonId=%d, flags=%u",
        eventGuid.GetCounter(), title.c_str(), description.c_str(), type, repeatable, maxInvites, dungeonId, flags);

    uint32 guild = ((flags & CALENDAR_FLAG_GUILD_EVENT) || (flags && CALENDAR_FLAG_GUILD_ANNOUNCEMENT)) ? player->GetGuildId() : 0;

    {
        WriteGuard guard(GetLock());
        m_EventStore.insert(CalendarEventStore::value_type(eventGuid,
            CalendarEvent(eventGuid, guid, guild, CalendarEventType(type), dungeonId, eventTime, flags, unkTime, title, description)));
    }

    return &m_EventStore[eventGuid];
}

void CalendarMgr::RemoveEvent(ObjectGuid const& eventId, ObjectGuid const& remover)
{
    CalendarEvent* event = GetEventById(eventId);
    if (!event)
    {
        SendCalendarCommandResult(remover, CALENDAR_ERROR_EVENT_INVALID);
        return;
    }

    if (remover != event->CreatorGuid)
    {
        // only creator can remove his event
        SendCalendarCommandResult(remover, CALENDAR_ERROR_PERMISSIONS);
        return;
    }

    SendCalendarEventRemovedAlert(event);

    event->SendMailOnRemoveEvent(remover);
    event->AddFlag(CALENDAR_STATE_FLAG_DELETED);
}

// Add invit to an event and inform client
CalendarInvite* CalendarMgr::AddInvite(CalendarEvent* event, ObjectGuid const& senderGuid, ObjectGuid const& inviteeGuid, CalendarInviteStatus status, CalendarModerationRank rank, std::string text, time_t statusTime)
{
    if (!event)
        return NULL;

//    CalendarInvite* calendarInvite = new CalendarInvite(event, GetNewInviteId(), senderGuid, inviteeGuid, statusTime, status, rank, text);
    ObjectGuid inviteGuid = ObjectGuid(HIGHGUID_INVITE, GenerateInviteLowGuid());
    {
        WriteGuard guard(GetLock());
        m_InviteStore.insert(CalendarInviteStore::value_type(inviteGuid, CalendarInvite(event, inviteGuid, senderGuid, inviteeGuid, statusTime, status, rank, text)));
    }

    CalendarInvite& calendarInvite = m_InviteStore[inviteGuid];

    if (!event->IsGuildAnnouncement())
        SendCalendarEventInvite(&calendarInvite);

    if (!event->IsGuildEvent() || calendarInvite.InviteeGuid == event->CreatorGuid)
        SendCalendarEventInviteAlert(&calendarInvite);

    if (event->IsGuildAnnouncement())
    {
        calendarInvite.AddFlag(CALENDAR_STATE_FLAG_DELETED);
        return NULL;
    }

    DEBUG_FILTER_LOG(LOG_FILTER_CALENDAR, "CalendarMgr::AddInvite eventId[%u], senderGuid[%u], inviteGuid[%u], Status[%u], rank[%u], text[%s], time[%u]", (uint32)event->EventId, senderGuid.GetCounter(), inviteeGuid.GetCounter(), status, rank, text.c_str(), (uint32)statusTime);

    if (!event->AddInvite(&calendarInvite))
    {
        sLog.outError("CalendarEvent::AddInvite Fail adding invite!");
        calendarInvite.AddFlag(CALENDAR_STATE_FLAG_DELETED);
        return NULL;
    }

    calendarInvite.RemoveFlag(CALENDAR_STATE_FLAG_SAVED);
    calendarInvite.AddFlag(CALENDAR_STATE_FLAG_UPDATED);

    return &calendarInvite;
}

bool CalendarMgr::RemoveInvite(ObjectGuid const& eventId, ObjectGuid const& inviteId, ObjectGuid const& removerGuid)
{
    CalendarEvent* event = GetEventById(eventId);
    if (!event)
    {
        SendCalendarCommandResult(removerGuid, CALENDAR_ERROR_EVENT_INVALID);
        return false;
    }
    return event->RemoveInviteById(inviteId, removerGuid);
}

uint32 CalendarMgr::GetPlayerNumPending(ObjectGuid const& guid)
{
    CalendarInvitesList* inviteList = GetPlayerInvitesList(guid);

    uint32 pendingNum = 0;
    for (CalendarInvitesList::const_iterator itr = inviteList->begin(); itr != inviteList->end(); ++itr)
    {
        CalendarEvent const* cal = (*itr)->GetCalendarEvent();
        if (cal && (cal->Flags & CALENDAR_FLAG_INVITES_LOCKED))
            continue;

        if ((*itr)->Status == CALENDAR_STATUS_INVITED || (*itr)->Status == CALENDAR_STATUS_TENTATIVE || (*itr)->Status == CALENDAR_STATUS_NOT_SIGNED_UP)
            ++pendingNum;
    }

    delete inviteList;
    return pendingNum;
}

void CalendarMgr::CopyEvent(ObjectGuid const& eventId, time_t newTime, ObjectGuid const& guid)
{
    CalendarEvent* event = GetEventById(eventId);
    if (!event)
    {
        SendCalendarCommandResult(guid, CALENDAR_ERROR_EVENT_INVALID);
        return;
    }

    CalendarEvent* newEvent = AddEvent(guid, event->Title, event->Description, event->Type, event->Repeatable,
        CALENDAR_MAX_INVITES, event->DungeonId, newTime, event->UnknownTime, event->Flags);

    if (!newEvent)
    {
        SendCalendarCommandResult(guid, CALENDAR_ERROR_INTERNAL);
        return;
    }

    if (newEvent->IsGuildAnnouncement())
        AddInvite(newEvent, guid, guid,  CALENDAR_STATUS_CONFIRMED, CALENDAR_RANK_OWNER, "", time(NULL));
    else
    {
        // copy all invitees, set new owner as the one who make the copy, set invitees status to invited

        GuidSet const* cInvMap = event->GetInvites();
        for (GuidSet::const_iterator itr = cInvMap->begin(); itr != cInvMap->end(); ++itr)
        {
            CalendarInvite* invite = sCalendarMgr.GetInviteById(*itr);
            if (!invite)
                continue;

            if (invite->InviteeGuid == guid)
            {
                AddInvite(newEvent, guid, invite->InviteeGuid,  CALENDAR_STATUS_CONFIRMED, CALENDAR_RANK_OWNER, "", time(NULL));
            }
            else
            {
                CalendarModerationRank rank = CALENDAR_RANK_PLAYER;
                // copy moderator rank
                if (invite->Rank == CALENDAR_RANK_MODERATOR)
                    rank = CALENDAR_RANK_MODERATOR;

                AddInvite(newEvent, guid, invite->InviteeGuid,  CALENDAR_STATUS_INVITED, rank, "", time(NULL));
            }
        }
    }
    newEvent->AddFlag(CALENDAR_STATE_FLAG_UPDATED);
    newEvent->RemoveFlag(CALENDAR_STATE_FLAG_SAVED);

    SendCalendarEvent(guid, newEvent, CALENDAR_SENDTYPE_COPY);
}

void CalendarMgr::RemovePlayerCalendar(ObjectGuid const& playerGuid)
{
    for (CalendarEventStore::iterator iter = m_EventStore.begin(); iter != m_EventStore.end(); ++iter)
    {
        CalendarEvent& event = iter->second;
        if (event.CreatorGuid == playerGuid && !IsDeletedEvent(iter))
        {
            event.RemoveInviteByGuid(playerGuid);
            event.AddFlag(CALENDAR_STATE_FLAG_DELETED);
        }
    }
}

void CalendarMgr::RemoveGuildCalendar(ObjectGuid const& playerGuid, uint32 GuildId)
{
    for (CalendarEventStore::iterator iter = m_EventStore.begin(); iter != m_EventStore.end(); ++iter)
    {
        CalendarEvent& event = iter->second;
        if (event.CreatorGuid == playerGuid && (event.IsGuildEvent() || event.IsGuildAnnouncement()) && !IsDeletedEvent(iter))
        {
            event.RemoveInviteByGuid(playerGuid);
            event.AddFlag(CALENDAR_STATE_FLAG_DELETED);
        }
    }
}

void CalendarMgr::DBRemap(TRemapAction remapAction, TRemapData& remapData, bool& dbTransactionUsed)
{
    // use not static SqlStatementID because this function
    // used only on core start and not needed after
    SqlStatementID stmtEventID;
    SqlStatementID stmtInviteID;

    if (!dbTransactionUsed)
    {
        dbTransactionUsed = true;
        CharacterDatabase.BeginTransaction();
    }

    switch (remapAction)
    {
        case RA_DEL_EXPIRED:
        {
            SqlStatement delEventStmt = CharacterDatabase.CreateStatement(stmtEventID, "DELETE FROM calendar_events WHERE eventId = ?");
            SqlStatement delInviteStmt = CharacterDatabase.CreateStatement(stmtInviteID, "DELETE FROM calendar_invites WHERE eventId = ?");
            for (TRemapData::const_iterator itr = remapData.begin(); itr != remapData.end(); ++itr)
            {
                if (itr->second != DELETED_ID)
                    continue;
                delEventStmt.PExecute(itr->first);
                delInviteStmt.PExecute(itr->first);
            }
            break;
        }
        case RA_REMAP_EVENTS:
        {
            SqlStatement updEventStmt = CharacterDatabase.CreateStatement(stmtEventID, "UPDATE calendar_events SET eventId = ? WHERE eventId = ?");
            SqlStatement updInviteStmt = CharacterDatabase.CreateStatement(stmtInviteID, "UPDATE calendar_invites SET eventId = ? WHERE eventId = ?");
            for (TRemapData::const_iterator itr = remapData.begin(); itr != remapData.end(); ++itr)
            {
                updEventStmt.PExecute(itr->second, itr->first);
                updInviteStmt.PExecute(itr->second, itr->first);
            }
            break;
        }
        case RA_REMAP_INVITES:
        {
            SqlStatement updInviteStmt = CharacterDatabase.CreateStatement(stmtInviteID, "UPDATE calendar_invites SET inviteId = ? WHERE inviteId = ?");
            for (TRemapData::const_iterator itr = remapData.begin(); itr != remapData.end(); ++itr)
                updInviteStmt.PExecute(itr->second, itr->first);
            break;
        }
    }
}

void CalendarMgr::DBRemoveExpiredEventsAndRemapData()
{
    QueryResult* result = CharacterDatabase.Query("SELECT eventTime, eventId FROM calendar_events ORDER BY eventId");
    if (!result)
        return;

    // prepare data
    uint32 remapId = 1;
    TRemapData remapData;
    do
    {
        Field* field = result->Fetch();
        bool removeEvent = IsEventReadyForRemove(time_t(field[0].GetUInt32()));
        remapData.push_back(TRemapGee(field[1].GetUInt32(), removeEvent ? DELETED_ID : remapId++));
    }
    while (result->NextRow());
    delete result;

    bool dbTransactionUsed = false;

    // delete expired events (and related invites)
    if (remapId <= remapData.size())
        DBRemap(RA_DEL_EXPIRED, remapData, dbTransactionUsed);

    // remap eventId
    remapData.remove_if(IsNotRemap());
    if (!remapData.empty())
        DBRemap(RA_REMAP_EVENTS, remapData, dbTransactionUsed);

    // remap inviteId
    if (result = CharacterDatabase.Query("SELECT inviteId FROM calendar_invites ORDER BY inviteId"))
    {
        remapId = 1;
        remapData.clear();
        do
        {
            uint32 inviteId = result->Fetch()[0].GetUInt32();
            if (inviteId != remapId)
                remapData.push_back(TRemapGee(inviteId, remapId));
            ++remapId;
        }
        while (result->NextRow());
        delete result;

        if (!remapData.empty())
            DBRemap(RA_REMAP_INVITES, remapData, dbTransactionUsed);
    }

    if (dbTransactionUsed)
        CharacterDatabase.CommitTransaction();
}

void CalendarMgr::LoadFromDB()
{
    uint32 maxInviteId = 0;
    uint32 maxEventId = 0;

    // For reload case
    m_EventStore.clear();
    m_InviteStore.clear();

    // before fill
    DBRemoveExpiredEventsAndRemapData();

    sLog.outString("Loading Calendar Events...");
    //                                                          0        1            2        3     4      5          6          7      8
    bool someEventExist = false;
    QueryResult* eventsQuery = CharacterDatabase.Query("SELECT eventId, creatorGuid, guildId, type, flags, dungeonId, eventTime, title, description FROM calendar_events ORDER BY eventId");
    if (!eventsQuery)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString();
        sLog.outString(">> calendar_events table is empty!");
    }
    else
    {
        BarGoLink bar(eventsQuery->GetRowCount());
        do
        {
            Field* field = eventsQuery->Fetch();

            uint32 eventId = field[0].GetUInt32();
            ObjectGuid eventGuid = ObjectGuid(HIGHGUID_CALENDAR_EVENT, eventId);

            m_EventStore.insert(CalendarEventStore::value_type(eventGuid,
                CalendarEvent(eventGuid,
                    ObjectGuid(HIGHGUID_PLAYER, field[1].GetUInt32()),
                    field[2].GetUInt32(),
                    CalendarEventType(field[3].GetUInt8()),
                    field[5].GetInt32(),
                    time_t(field[6].GetUInt32()),
                    field[4].GetUInt32(),
                    time_t(time(NULL)),
                    field[7].GetString(),
                    field[8].GetString())));

            maxEventId = (maxEventId < eventId) ? eventId : maxEventId;
            CalendarEvent& event = m_EventStore[eventGuid];

            event.RemoveFlag(CALENDAR_STATE_FLAG_UPDATED);
            event.AddFlag(CALENDAR_STATE_FLAG_SAVED);
        }
        while (eventsQuery->NextRow());

        sLog.outString();
        sLog.outString(">> Loaded %u events!", uint32(eventsQuery->GetRowCount()));
        someEventExist = true;

        delete eventsQuery;
    }

    m_EventGuids.Set(maxEventId + 1);

    sLog.outString("Loading Calendar invites...");
    //                                                           0         1        2            3           4       5               6    7
    QueryResult* invitesQuery = CharacterDatabase.Query("SELECT inviteId, eventId, inviteeGuid, senderGuid, status, lastUpdateTime, rank, description FROM calendar_invites ORDER BY inviteId");
    if (!invitesQuery)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString();
        sLog.outString(">> calendar_invite table is empty!");
    }
    else
    {
        if (someEventExist)
        {
            BarGoLink bar(invitesQuery->GetRowCount());
            do
            {
                Field* field = invitesQuery->Fetch();

                uint32 eventId = field[1].GetUInt32();
                ObjectGuid eventGuid = ObjectGuid(HIGHGUID_CALENDAR_EVENT, eventId);

                CalendarEvent* event = GetEventById(eventGuid); // may be NULL!

                ObjectGuid inviteGuid       = ObjectGuid(HIGHGUID_INVITE, field[0].GetUInt32());
                ObjectGuid inviteeGuid      = ObjectGuid(HIGHGUID_PLAYER, field[2].GetUInt32());
                ObjectGuid senderGuid       = ObjectGuid(HIGHGUID_PLAYER, field[3].GetUInt32());
                CalendarInviteStatus status = CalendarInviteStatus(field[4].GetUInt8());
                time_t lastUpdateTime       = time_t(field[5].GetUInt32());
                CalendarModerationRank rank = CalendarModerationRank(field[6].GetUInt8());
                std::string _text           = field[7].GetString();

                m_InviteStore.insert(CalendarInviteStore::value_type(inviteGuid, CalendarInvite(event, inviteGuid, senderGuid, inviteeGuid, lastUpdateTime, status, rank, _text)));
                CalendarInvite& invite = m_InviteStore[inviteGuid];

                invite.RemoveFlag(CALENDAR_STATE_FLAG_UPDATED);
                invite.AddFlag(CALENDAR_STATE_FLAG_SAVED);

                if (!event)
                {
                    // delete invite
                    invite.AddFlag(CALENDAR_STATE_FLAG_DELETED);
                }
                else
                    event->AddInvite(&invite);

                maxInviteId = (maxInviteId < inviteGuid.GetCounter()) ? inviteGuid.GetCounter() : maxEventId;

            }
            while (invitesQuery->NextRow());

            sLog.outString();
            sLog.outString(">> Loaded %u invites!", uint32(invitesQuery->GetRowCount()));
        }
        else
        {
            // delete all invites (no invites exist without events)
            CharacterDatabase.DirectExecute("TRUNCATE TABLE calendar_invites");
            sLog.outString(">> calendar_invites table is cleared! (invites without events found)");
        }
        delete invitesQuery;
    }

    m_InviteGuids.Set(maxInviteId + 1);

    sLog.outString();
}

void CalendarMgr::SaveToDB()
{
    bool dataSaved = false;

    for (CalendarEventStore::iterator iter = m_EventStore.begin(); iter != m_EventStore.end();)
    {
        if (!iter->second.HasFlag(CALENDAR_STATE_FLAG_SAVED))
        {
            if (!dataSaved)
            {
                dataSaved = true;
                CharacterDatabase.BeginTransaction();
            }
            SaveEventToDB(&iter->second);
            iter->second.AddFlag(CALENDAR_STATE_FLAG_SAVED);
            ++iter;
        }
        else if (iter->second.HasFlag(CALENDAR_STATE_FLAG_DELETED))
        {
            if (!dataSaved)
            {
                dataSaved = true;
                CharacterDatabase.BeginTransaction();
            }
            WriteGuard guard(GetLock());
            DeleteEventFromDB(iter->first);
            m_EventStore.erase(iter++);
        }
        else
            ++iter;
    }

    for (CalendarInviteStore::iterator iter = m_InviteStore.begin(); iter != m_InviteStore.end();)
    {
        if (!iter->second.HasFlag(CALENDAR_STATE_FLAG_SAVED))
        {
            if (!dataSaved)
            {
                dataSaved = true;
                CharacterDatabase.BeginTransaction();
            }
            SaveInviteToDB(&iter->second);
            iter->second.AddFlag(CALENDAR_STATE_FLAG_SAVED);
            ++iter;
        }
        else if (iter->second.HasFlag(CALENDAR_STATE_FLAG_DELETED))
        {
            if (!dataSaved)
            {
                dataSaved = true;
                CharacterDatabase.BeginTransaction();
            }
            WriteGuard guard(GetLock());
            DeleteInviteFromDB(iter->first);
            m_InviteStore.erase(iter++);
        }
        else
            ++iter;
    }

    if (dataSaved)
        CharacterDatabase.CommitTransaction();
}

void CalendarMgr::SaveEventToDB(CalendarEvent const* event)
{
    if (!event || event->GetObjectGuid().IsEmpty())
        return;

    DeleteEventFromDB(event->GetObjectGuid());

    static SqlStatementID insEvent;
    SqlStatement uberInsert = CharacterDatabase.CreateStatement(insEvent, "INSERT INTO calendar_events (eventId, creatorGuid, guildId, type, flags, dungeonId, eventTime, title, description)"
        " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" );

    uberInsert.addUInt32(event->GetObjectGuid().GetCounter());
    uberInsert.addUInt32(event->CreatorGuid.GetCounter());
    uberInsert.addUInt32(event->GuildId);
    uberInsert.addUInt32(event->Type);
    uberInsert.addUInt32(event->Flags);
    uberInsert.addInt32(event->DungeonId);
    uberInsert.addUInt32(event->EventTime);
    uberInsert.addString(event->Title.c_str());
    uberInsert.addString(event->Description.c_str());

    uberInsert.Execute();
}

void CalendarMgr::SaveInviteToDB(CalendarInvite const* invite)
{
    if (!invite || invite->GetObjectGuid().IsEmpty())
        return;

    DeleteInviteFromDB(invite->GetObjectGuid());

    static SqlStatementID insEvent;
    SqlStatement uberInsert = CharacterDatabase.CreateStatement(insEvent, "INSERT INTO calendar_invites (inviteId, eventId, inviteeGuid, senderGuid, status, lastUpdateTime, rank, description)"
        " VALUES (?, ?, ?, ?, ?, ?, ?, ?)" );

    uberInsert.addUInt32(invite->GetObjectGuid().GetCounter());
    uberInsert.addUInt32(invite->GetEventGuid().GetCounter());
    uberInsert.addUInt32(invite->InviteeGuid.GetCounter());
    uberInsert.addUInt32(invite->SenderGuid.GetCounter());
    uberInsert.addUInt32(invite->Status);
    uberInsert.addUInt32(invite->LastUpdateTime);
    uberInsert.addUInt32(invite->Rank);
    uberInsert.addString(invite->Text.c_str());

    uberInsert.Execute();
}

void CalendarMgr::DeleteEventFromDB(ObjectGuid const& eventGuid)
{
    if (eventGuid.IsEmpty())
        return;

    static SqlStatementID delEvent;
    SqlStatement stmt = CharacterDatabase.CreateStatement(delEvent, "DELETE FROM calendar_events WHERE eventId = ?");
    stmt.PExecute(eventGuid.GetCounter());
}

void CalendarMgr::DeleteInviteFromDB(ObjectGuid const& inviteGuid)
{
    if (inviteGuid.IsEmpty())
        return;

    static SqlStatementID delInvite;
    SqlStatement stmt = CharacterDatabase.CreateStatement(delInvite, "DELETE FROM calendar_invites WHERE inviteId = ?");
    stmt.PExecute(inviteGuid.GetCounter());
}

void CalendarMgr::Update()
{
    {
        // Update part 1 - calculating (and mark for cleanup)
        ReadGuard guard(GetLock());
        for (CalendarEventStore::iterator itr = m_EventStore.begin(); itr != m_EventStore.end(); ++itr)
        {
            CalendarEvent* event = &itr->second;
            if (!event || event->HasFlag(CALENDAR_STATE_FLAG_DELETED))
                continue;

            // Event expired or empty, remove it
            if (IsEventReadyForRemove(event->EventTime) ||
                event->GetInvites()->empty())
                event->AddFlag(CALENDAR_STATE_FLAG_DELETED);
        }

        for (CalendarInviteStore::iterator itr = m_InviteStore.begin(); itr != m_InviteStore.end(); ++itr)
        {
            CalendarInvite* invite = &itr->second;
            if (!invite || invite->HasFlag(CALENDAR_STATE_FLAG_DELETED))
                continue;

            if (invite->GetEventGuid().IsEmpty() || !invite->GetCalendarEvent())
                invite->AddFlag(CALENDAR_STATE_FLAG_DELETED);
            // Place check for expireable here
        }
    }

    // Saving data (and DB/storage cleanup)
    SaveToDB();
}

void CalendarMgr::SendCalendarEventInviteAlert(CalendarInvite const* invite)
{
    DEBUG_LOG("WORLD: SMSG_CALENDAR_EVENT_INVITE_ALERT");

    CalendarEvent const* event = invite->GetCalendarEvent();
    if (!event || event->HasFlag(CALENDAR_STATE_FLAG_DELETED))
        return;

    WorldPacket data(SMSG_CALENDAR_EVENT_INVITE_ALERT);
    data << event->EventId;
    data << event->Title;
    data.AppendPackedTime(event->EventTime);
    data << uint32(event->Flags);
    data << uint32(event->Type);
    data << int32(event->DungeonId);
    data << uint64(invite->InviteId);
    data << uint8(invite->Status);
    data << uint8(invite->Rank);
    data << event->CreatorGuid.WriteAsPacked();
    data << invite->SenderGuid.WriteAsPacked();
    //data.hexlike();

    DEBUG_FILTER_LOG(LOG_FILTER_CALENDAR, "CalendarMgr::SendCalendarEventInviteAlert senderGuid[%u], inviteeGuid[%u], EventId[%lu], Status[%u], InviteId[%u]",
        invite->SenderGuid.GetCounter(), invite->InviteeGuid.GetCounter(), uint32(event->EventId), uint32(invite->Status), uint32(invite->InviteId));

    if (event->IsGuildEvent() || event->IsGuildAnnouncement())
    {
        if (Guild* guild = sGuildMgr.GetGuildById(event->GuildId))
            guild->BroadcastPacket(&data);
    }
    else if (Player* player = sObjectMgr.GetPlayer(invite->InviteeGuid))
        player->SendDirectMessage(&data);
}

void CalendarMgr::SendCalendarEventInvite(CalendarInvite const* invite)
{
    CalendarEvent const* event = invite->GetCalendarEvent();

    time_t statusTime = invite->LastUpdateTime;
    bool preInvite = true;
    uint64 eventId = 0;
    if (event != NULL)
    {
       preInvite = false;
       eventId = event->EventId;
    }

    Player* player = sObjectMgr.GetPlayer(invite->InviteeGuid);

    uint8 level = player ? player->getLevel() : Player::GetLevelFromDB(invite->InviteeGuid);
    DEBUG_FILTER_LOG(LOG_FILTER_CALENDAR, "SMSG_CALENDAR_EVENT_INVITE");
    WorldPacket data(SMSG_CALENDAR_EVENT_INVITE, 8 + 8 + 8 + 1 + 1 + 1 + (preInvite ? 0 : 4) + 1);
    data << invite->InviteeGuid.WriteAsPacked();
    data << uint64(eventId);
    data << uint64(invite->InviteId);
    data << uint8(level);
    data << uint8(invite->Status);
    data << uint8(!preInvite);
    if (!preInvite)
        data.AppendPackedTime(statusTime);
    data << uint8(invite->SenderGuid != invite->InviteeGuid); // false only if the invite is sign-up

    DEBUG_FILTER_LOG(LOG_FILTER_CALENDAR, "CalendarMgr::SendCalendarEventInvite %s senderGuid[%u], inviteeGuid[%u], EventId[%lu], Status[%u], InviteId[%u]",
        preInvite ? "is PreInvite," : "", invite->SenderGuid.GetCounter(), invite->InviteeGuid.GetCounter(), uint32(eventId), uint32(invite->Status), uint32(invite->InviteId));

    //data.hexlike();
    if (preInvite)
    {
        if (Player* sender = sObjectMgr.GetPlayer(invite->SenderGuid))
            sender->SendDirectMessage(&data);
    }
    else
        SendPacketToAllEventRelatives(data, event);
}

void CalendarMgr::SendCalendarCommandResult(ObjectGuid const& guid, CalendarResponseResult err, char const* param /*= NULL*/)
{
    if (Player* player = sObjectMgr.GetPlayer(guid))
    {
        DEBUG_FILTER_LOG(LOG_FILTER_CALENDAR, "SMSG_CALENDAR_COMMAND_RESULT (%u)", err);
        WorldPacket data(SMSG_CALENDAR_COMMAND_RESULT, 0);
        data << uint32(0);
        data << uint8(0);
        switch (err)
        {
        case CALENDAR_ERROR_OTHER_INVITES_EXCEEDED:
        case CALENDAR_ERROR_ALREADY_INVITED_TO_EVENT_S:
        case CALENDAR_ERROR_IGNORING_YOU_S:
            data << param;
            break;
        default:
            data << uint8(0);
            break;
        }

        data << uint32(err);
        //data.hexlike();
        player->SendDirectMessage(&data);
    }
}

void CalendarMgr::SendCalendarEventRemovedAlert(CalendarEvent const* event)
{
    DEBUG_FILTER_LOG(LOG_FILTER_CALENDAR, "SMSG_CALENDAR_EVENT_REMOVED_ALERT");
    WorldPacket data(SMSG_CALENDAR_EVENT_REMOVED_ALERT, 1 + 8 + 1);
    data << uint8(1);       // show pending alert?
    data << uint64(event->EventId);
    data.AppendPackedTime(event->EventTime);
    //data.hexlike();
    SendPacketToAllEventRelatives(data, event);
}

void CalendarMgr::SendCalendarEvent(ObjectGuid const& guid, CalendarEvent const* event, uint32 sendType)
{
    Player* player = sObjectMgr.GetPlayer(guid);
    if (!player || !event)
        return;

    std::string timeStr = TimeToTimestampStr(event->EventTime);
    DEBUG_FILTER_LOG(LOG_FILTER_CALENDAR, "CalendarMgr::SendCalendarEvent sendType[%u], CreatorGuid[%u], EventId[%u], Type[%u], Flags[%u], Time[%s]",
        sendType, event->CreatorGuid.GetCounter(), uint32(event->EventId), uint32(event->Type), event->Flags, event->Title.c_str());

    WorldPacket data(SMSG_CALENDAR_SEND_EVENT);
    data << uint8(sendType);
    data << event->CreatorGuid.WriteAsPacked();
    data << uint64(event->EventId);
    data << event->Title;
    data << event->Description;
    data << uint8(event->Type);
    data << uint8(event->Repeatable);
    data << uint32(CALENDAR_MAX_INVITES);
    data << event->DungeonId;
    data << event->Flags;
    data.AppendPackedTime(event->EventTime);
    data.AppendPackedTime(event->UnknownTime);
    data << event->GuildId;

    GuidSet const* cInvMap = event->GetInvites();
    size_t pos = data.wpos();
    data << uint32(0);                                  // size of list, placeholder
    uint32 _count = 0;
    for (GuidSet::const_iterator itr = cInvMap->begin(); itr != cInvMap->end(); ++itr)
    {
        CalendarInvite const* calendarInvite = sCalendarMgr.GetInviteById(*itr);
        if (!calendarInvite)
            continue;

        ObjectGuid inviteeGuid = calendarInvite->InviteeGuid;
        Player* invitee = sObjectMgr.GetPlayer(inviteeGuid);

        uint8 inviteeLevel = invitee ? invitee->getLevel() : Player::GetLevelFromDB(inviteeGuid);
        uint32 inviteeGuildId = invitee ? invitee->GetGuildId() : Player::GetGuildIdFromDB(inviteeGuid);

        data << inviteeGuid.WriteAsPacked();
        data << uint8(inviteeLevel);
        data << uint8(calendarInvite->Status);
        data << uint8(calendarInvite->Rank);
        data << uint8(event->IsGuildEvent() && event->GuildId == inviteeGuildId);
        data << calendarInvite->GetObjectGuid();
        data.AppendPackedTime(calendarInvite->LastUpdateTime);
        data << calendarInvite->Text;

        DEBUG_FILTER_LOG(LOG_FILTER_CALENDAR, "CalendarMgr::SendCalendarEvent InviteId[%u], InviteLvl[%u], Status[%u], Rank[%u],  GuildEvent[%s], Text[%s]",
            uint32(calendarInvite->InviteId), uint32(inviteeLevel), uint32(calendarInvite->Status), uint32(calendarInvite->Rank),
            (event->IsGuildEvent() && event->GuildId == inviteeGuildId) ? "true" : "false", calendarInvite->Text.c_str());
        ++_count;
    }
    data.put<uint32>(pos, _count);
    //data.hexlike();
    player->SendDirectMessage(&data);
}

void CalendarMgr::SendCalendarEventInviteRemove(CalendarInvite const* invite, CalendarEvent const* event, uint32 flags)
{
    DEBUG_FILTER_LOG(LOG_FILTER_CALENDAR, "SMSG_CALENDAR_EVENT_INVITE_REMOVED");

    WorldPacket data(SMSG_CALENDAR_EVENT_INVITE_REMOVED, 8 + 4 + 4 + 1);
    data.appendPackGUID(invite->InviteeGuid);
    data << uint64(event->EventId);
    data << uint32(flags);
    data << uint8(1);       // show pending alert?
    //data.hexlike();
    SendPacketToAllEventRelatives(data, event);
}

void CalendarMgr::SendCalendarEventInviteRemoveAlert(ObjectGuid const& guid, CalendarEvent const* event, CalendarInviteStatus status)
{
    if (Player* player = sObjectMgr.GetPlayer(guid))
    {
        DEBUG_FILTER_LOG(LOG_FILTER_CALENDAR, "SMSG_CALENDAR_EVENT_INVITE_REMOVED_ALERT");
        WorldPacket data(SMSG_CALENDAR_EVENT_INVITE_REMOVED_ALERT, 8 + 4 + 4 + 1);
        data << uint64(event->EventId);
        data.AppendPackedTime(event->EventTime);
        data << uint32(event->Flags);
        data << uint8(status);
        //data.hexlike();
        player->SendDirectMessage(&data);
    }
}

void CalendarMgr::SendCalendarEventStatus(CalendarInvite const* invite)
{
    DEBUG_FILTER_LOG(LOG_FILTER_CALENDAR, "SMSG_CALENDAR_EVENT_STATUS");
    WorldPacket data(SMSG_CALENDAR_EVENT_STATUS, 8 + 8 + 4 + 4 + 1 + 1 + 4);
    CalendarEvent const* event = invite->GetCalendarEvent();

    data << invite->InviteeGuid.WriteAsPacked();
    data << uint64(event->EventId);
    data.AppendPackedTime(event->EventTime);
    data << uint32(event->Flags);
    data << uint8(invite->Status);
    data << uint8(invite->Rank);
    data.AppendPackedTime(invite->LastUpdateTime);
    //data.hexlike();
    SendPacketToAllEventRelatives(data, event);
}

void CalendarMgr::SendCalendarClearPendingAction(ObjectGuid const& guid)
{
    if (Player* player = sObjectMgr.GetPlayer(guid))
    {
        DEBUG_FILTER_LOG(LOG_FILTER_CALENDAR, "SMSG_CALENDAR_CLEAR_PENDING_ACTION TO [%u]", guid.GetCounter());
        WorldPacket data(SMSG_CALENDAR_CLEAR_PENDING_ACTION, 0);
        player->SendDirectMessage(&data);
    }
}

void CalendarMgr::SendCalendarEventModeratorStatusAlert(CalendarInvite const* invite)
{
    DEBUG_FILTER_LOG(LOG_FILTER_CALENDAR, "SMSG_CALENDAR_EVENT_MODERATOR_STATUS_ALERT");
    CalendarEvent const* event = invite->GetCalendarEvent();
    WorldPacket data(SMSG_CALENDAR_EVENT_MODERATOR_STATUS_ALERT, 8 + 8 + 1 + 1);
    data << invite->InviteeGuid.WriteAsPacked();
    data << uint64(event->EventId);
    data << uint8(invite->Rank);
    data << uint8(1); // Display pending action to client?
    //data.hexlike();
    SendPacketToAllEventRelatives(data, event);
}

void CalendarMgr::SendCalendarEventUpdateAlert(CalendarEvent const* event, time_t oldEventTime)
{
    DEBUG_FILTER_LOG(LOG_FILTER_CALENDAR, "SMSG_CALENDAR_EVENT_UPDATED_ALERT");
    WorldPacket data(SMSG_CALENDAR_EVENT_UPDATED_ALERT, 1 + 8 + 4 + 4 + 4 + 1 + 4 +
        event->Title.size() + event->Description.size() + 1 + 4 + 4);
    data << uint8(1);       // show pending alert?
    data << uint64(event->EventId);
    data.AppendPackedTime(oldEventTime);
    data << uint32(event->Flags);
    data.AppendPackedTime(event->EventTime);
    data << uint8(event->Type);
    data << int32(event->DungeonId);
    data << event->Title;
    data << event->Description;
    data << uint8(event->Repeatable);
    data << uint32(CALENDAR_MAX_INVITES);
    data << uint32(0);      // title updated? (string type)
    //data.hexlike();

    SendPacketToAllEventRelatives(data, event);
}

void CalendarMgr::SendPacketToAllEventRelatives(WorldPacket packet, CalendarEvent const* event)
{
    // Send packet to all guild members
    if (event->IsGuildEvent() || event->IsGuildAnnouncement())
        if (Guild* guild = sGuildMgr.GetGuildById(event->GuildId))
            guild->BroadcastPacket(&packet);

    // Send packet to all invitees if event is non-guild, in other case only to non-guild invitees (packet was broadcasted for them)
    GuidSet const* cInvMap = event->GetInvites();
    for (GuidSet::const_iterator itr = cInvMap->begin(); itr != cInvMap->end(); ++itr)
        if (CalendarInvite const* calendarInvite = sCalendarMgr.GetInviteById(*itr))
            if (Player* player = sObjectMgr.GetPlayer(calendarInvite->InviteeGuid))
                if (!event->IsGuildEvent() || (event->IsGuildEvent() && player->GetGuildId() != event->GuildId))
                    player->SendDirectMessage(&packet);
}

void CalendarMgr::SendCalendarRaidLockoutRemove(ObjectGuid const& guid, DungeonPersistentState const* save)
{
    Player* player = sObjectMgr.GetPlayer(guid);
    if (!save || !player)
        return;

    DEBUG_LOG("SMSG_CALENDAR_RAID_LOCKOUT_REMOVED [%u]", guid.GetCounter());
    time_t currTime = time(NULL);

    WorldPacket data(SMSG_CALENDAR_RAID_LOCKOUT_REMOVED, 4 + 4 + 4 + 8);
    data << uint32(save->GetMapId());
    data << uint32(save->GetDifficulty());
    data << uint32(save->GetResetTime() - currTime);
    data << uint64(save->GetInstanceId());
    //data.hexlike();
    player->SendDirectMessage(&data);
}

void CalendarMgr::SendCalendarRaidLockoutAdd(ObjectGuid const& guid, DungeonPersistentState const* save)
{
    Player* player = sObjectMgr.GetPlayer(guid);
    if (!save || !player)
        return;

    DEBUG_LOG("SMSG_CALENDAR_RAID_LOCKOUT_ADDED [%u]", guid.GetCounter());
    time_t currTime = time(NULL);

    WorldPacket data(SMSG_CALENDAR_RAID_LOCKOUT_ADDED, 4 + 4 + 4 + 4 + 8);
    data.AppendPackedTime(currTime);
    data << uint32(save->GetMapId());
    data << uint32(save->GetDifficulty());
    data << uint32(save->GetResetTime() - currTime);
    data << uint64(save->GetInstanceId());
    //data.hexlike();
    player->SendDirectMessage(&data);
}
