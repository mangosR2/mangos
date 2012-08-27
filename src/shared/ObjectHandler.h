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

#ifndef MANGOS_OBJECTHANDLER_H
#define MANGOS_OBJECTHANDLER_H

#include "Common.h"

#ifndef OBJECT_HANDLER
#  define OBJECT_HANDLER(TYPE,NAME) typedef ACE_Refcounted_Auto_Ptr<TYPE,ACE_Null_Mutex> NAME;
#endif

#ifndef OBJECT_SAFE_HANDLER
#  define OBJECT_SAFE_HANDLER(TYPE,NAME) typedef ACE_Refcounted_Auto_Ptr<TYPE,ACE_Thread_Mutex> NAME;
#endif

class SpellAuraHolder;
class UnitAction;
class VehicleKit;

#ifndef NOTSAFE_SEMAPHORE_OVERHANDLING
    OBJECT_SAFE_HANDLER(SpellAuraHolder,SpellAuraHolderPtr);
    OBJECT_SAFE_HANDLER(UnitAction,UnitActionPtr);
    OBJECT_SAFE_HANDLER(VehicleKit,VehicleKitPtr);
#else
    OBJECT_HANDLER(SpellAuraHolder,SpellAuraHolderPtr);
    OBJECT_HANDLER(UnitAction,UnitActionPtr);
    OBJECT_HANDLER(VehicleKit,VehicleKitPtr);
#endif

#endif
