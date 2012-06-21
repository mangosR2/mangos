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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

#ifndef ZONE_SCRIPT_H
#define ZONE_SCRIPT_H

#include "Common.h"
#include "Creature.h"

class Creature;
class GameObject;

class ZoneScript
{
    public:
        ZoneScript() {}
        virtual ~ZoneScript(){}

        // Called when a creature or gameobject is created
        virtual void OnCreatureCreate(Creature *) {}
        virtual void OnGameObjectCreate(GameObject *) {}
        //called on creature death and respawn
        virtual void OnCreatureDeath(Creature * /*creature*/) {}
        virtual void OnCreatureRespawn(Creature * /*creature*/) {}

        // All-purpose data storage 64 bit
        //virtual uint64 GetData64(uint32 /*DataId*/) { return 0; }
        //virtual void SetData64(uint32 /*DataId*/, uint64 /*Value*/) {}

        // All-purpose data storage 32 bit
        //virtual uint32 GetData(uint32 /*DataId*/) { return 0; }
        //virtual void SetData(uint32 /*DataId*/, uint32 /*Value*/) {}

        // Process Capture event
        virtual void ProcessEvent(GameObject* pGo, uint32 uiEventId, uint32 uiFaction) {}
};

#endif
