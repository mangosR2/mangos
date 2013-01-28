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

#include "Camera.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"
#include "Log.h"
#include "Errors.h"
#include "Player.h"
#include "ObjectMgr.h"

Camera::Camera(Player& player) : m_owner(player), m_sourceGuid(ObjectGuid())
{
}

Camera::~Camera()
{
    // Don't cleanup/log for not fully created Player object.
    if (!GetOwner()->IsInitialized())
        return;

    // view of camera should be already reseted to owner (RemoveFromWorld -> Event_RemovedFromWorld -> ResetView)
    if (!m_sourceGuid.IsEmpty() && m_sourceGuid != GetOwner()->GetObjectGuid())
        sLog.outError("Camera destuctor called: camera for %s not reseted (setted to %s)",
            GetOwner()->GetObjectGuid().GetString().c_str(), m_sourceGuid.IsEmpty() ? "<none>" : m_sourceGuid.GetString().c_str());

    // for symmetry with constructor and way to make viewpoint's list empty
    GetBody()->GetViewPoint().Detach(GetOwner()->GetObjectGuid());
}

void Camera::Initialize()
{
    ResetView();
}

void Camera::Reset()
{
    GetBody()->GetViewPoint().Detach(GetOwner()->GetObjectGuid());
    m_sourceGuid.Clear();
}

void Camera::ReceivePacket(WorldPacket* data)
{
    m_owner.SendDirectMessage(data);
}

void Camera::UpdateForCurrentViewPoint()
{
    m_gridRef.unlink();

    if (GridType* grid = GetBody()->GetViewPoint().m_grid)
        grid->AddWorldObject(this);

    UpdateVisibilityForOwner();
}

void Camera::SetView(WorldObject* obj, bool update_far_sight_field /*= true*/)
{
    MANGOS_ASSERT(obj);

    if (obj->GetObjectGuid() == m_sourceGuid)
        return;

    WorldObject* m_source = IsInitialized() ? GetBody() : NULL;

    if (IsInitialized() && !m_owner.IsInMap(obj))
    {
        sLog.outError("Camera::SetView, viewpoint is not in map with camera's owner");
        Reset();
        return;
    }

    if (!obj->isType(TypeMask(TYPEMASK_DYNAMICOBJECT | TYPEMASK_UNIT)))
    {
        sLog.outError("Camera::SetView, viewpoint type is not available for client");
        Reset();
        return;
    }

    // detach and deregister from active objects if there are no more reasons to be active
    if (m_source)
    {
        m_source->GetViewPoint().Detach(GetOwner()->GetObjectGuid());
        if (!m_source->isActiveObject() && m_source->GetMap())
            m_source->GetMap()->RemoveFromActive(m_source);
    }

    DEBUG_FILTER_LOG(LOG_FILTER_VISIBILITY_CHANGES, "Camera::SetView %s changed camera base from %s to %s",
        GetOwner()->GetObjectGuid().GetString().c_str(),
        IsInitialized() ? m_sourceGuid.GetString().c_str() : "<none>",
        obj->GetObjectGuid().GetString().c_str());

    m_sourceGuid = obj->GetObjectGuid();

    if (!obj->isActiveObject() && obj->GetMap())
        obj->GetMap()->AddToActive(obj);

    obj->GetViewPoint().Attach(GetOwner()->GetObjectGuid());

    if (update_far_sight_field)
        m_owner.SetGuidValue(PLAYER_FARSIGHT, (m_sourceGuid == m_owner.GetObjectGuid() ? ObjectGuid() : m_sourceGuid));

    UpdateForCurrentViewPoint();
}

void Camera::Event_ViewPointVisibilityChanged()
{
    if (!m_owner.HaveAtClient(GetBody()))
        ResetView();
}

void Camera::ResetView(bool update_far_sight_field /*= true*/)
{
    if (IsInitialized() && GetOwner()->GetObjectGuid() == m_sourceGuid)
        return;

    SetView(&m_owner, update_far_sight_field);
}

void Camera::Event_AddedToWorld()
{
    if (!IsInitialized())
        ResetView();

    GridType* grid = GetBody()->GetViewPoint().m_grid;
    MANGOS_ASSERT(grid);
    grid->AddWorldObject(this);

    UpdateVisibilityForOwner();
}

void Camera::Event_RemovedFromWorld()
{
    if (GetOwner()->GetObjectGuid() == m_sourceGuid)
    {
        m_gridRef.unlink();
        return;
    }

    if (IsInitialized())
        ResetView();
}

void Camera::Event_Moved()
{
    m_gridRef.unlink();
    GetBody()->GetViewPoint().m_grid->AddWorldObject(this);
}

void Camera::UpdateVisibilityOf(WorldObject* target)
{
    m_owner.UpdateVisibilityOf(GetBody(), target);
}

template<class T>
void Camera::UpdateVisibilityOf(T* target, UpdateData& data, WorldObjectSet& vis)
{
    m_owner.template UpdateVisibilityOf<T>(GetBody(), target, data, vis);
}

template void Camera::UpdateVisibilityOf(Player*        , UpdateData& , WorldObjectSet&);
template void Camera::UpdateVisibilityOf(Creature*      , UpdateData& , WorldObjectSet&);
template void Camera::UpdateVisibilityOf(Corpse*        , UpdateData& , WorldObjectSet&);
template void Camera::UpdateVisibilityOf(GameObject*    , UpdateData& , WorldObjectSet&);
template void Camera::UpdateVisibilityOf(DynamicObject* , UpdateData& , WorldObjectSet&);

void Camera::UpdateVisibilityForOwner()
{
    WorldObject* m_source = GetBody();
    if (!m_source->GetMap())
        return;

    MaNGOS::VisibleNotifier notifier(*this);
    Cell::VisitAllObjects(m_source, notifier, m_source->GetMap()->GetVisibilityDistance(m_source), false);
    notifier.Notify();
}

WorldObject* Camera::GetBody()
{
    if (m_sourceGuid.IsEmpty() 
        || GetOwner()->GetObjectGuid() == m_sourceGuid
        || !m_owner.IsInWorld() 
        || !m_owner.GetMap())
        return &m_owner;

    WorldObject* m_source = m_owner.GetMap()->GetWorldObject(m_sourceGuid);

    return m_source ? m_source : &m_owner;
}

//////////////////

ViewPoint::~ViewPoint()
{
    if (!m_cameras.empty())
    {
        sLog.outError("ViewPoint destructor for %s called, but %u camera(s) referenced to it",
            m_body.GetObjectGuid().GetString().c_str(),m_cameras.size());
        m_cameras.clear();
    }
}

void ViewPoint::Attach(ObjectGuid const& cameraOwnerGuid) 
{
    m_cameras.insert(cameraOwnerGuid);
}

void ViewPoint::Detach(ObjectGuid const& cameraOwnerGuid) 
{
    m_cameras.erase(cameraOwnerGuid);
}

void ViewPoint::CameraCall(void (Camera::*handler)())
{
    if (!m_cameras.empty())
    {

        for (CameraList::iterator itr = m_cameras.begin(), next; itr != m_cameras.end(); itr = next)
        {
            next = itr;
            ++next;
            ObjectGuid guid = *itr;

            if (m_body.GetTypeId() == TYPEID_PLAYER && guid == m_body.GetObjectGuid())
            {
                if (Camera* camera = ((Player*)&m_body)->GetCamera())
                    if (camera->IsInitialized())
                        (camera->*handler)();
            }
            else if (m_body.GetMap() && guid.IsPlayer())
            {
                if (Player* player = m_body.GetMap()->GetPlayer(guid))
                {
                    if (Camera* camera = player->GetCamera())
                        if (camera->IsInitialized())
                            (camera->*handler)();
                }
                else
                    m_cameras.erase(guid);
            }
            else
                m_cameras.erase(guid);
        }
    }
}
