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

#ifndef MANGOS_MAP_LOCKTYPE_H
#define MANGOS_MAP_LOCKTYPE_H

#include "Common.h"
#include "Platform/Define.h"
#include "Policies/ThreadingModel.h"
#include "ace/RW_Thread_Mutex.h"
#include "ace/Thread_Mutex.h"

enum MapLockType
{
    MAP_LOCK_TYPE_DEFAULT,
    MAP_LOCK_TYPE_AURAS,
    MAP_LOCK_TYPE_MMAP,
    MAP_LOCK_TYPE_MOVEMENT,
    MAP_LOCK_TYPE_MAX,
};

typedef   ACE_RW_Thread_Mutex                ObjectLockType;
typedef   ACE_Read_Guard<ObjectLockType>     ReadGuard;
typedef   ACE_Write_Guard<ObjectLockType>    WriteGuard;

#ifndef MAPLOCK_READ
#  define MAPLOCK_READ(OBJ,TYPE) ReadGuard Guard((OBJ)->GetLock(TYPE));
#endif

#ifndef MAPLOCK_READ1
#  define MAPLOCK_READ1(OBJ,TYPE) ReadGuard Guard1((OBJ)->GetLock(TYPE));
#endif

#ifndef MAPLOCK_READ2
#  define MAPLOCK_READ2(OBJ,TYPE) ReadGuard Guard2((OBJ)->GetLock(TYPE));
#endif

#ifndef MAPLOCK_WRITE
#  define MAPLOCK_WRITE(OBJ,TYPE) WriteGuard Guard((OBJ)->GetLock(TYPE));
#endif

#ifndef MAPLOCK_WRITE1
#  define MAPLOCK_WRITE1(OBJ,TYPE) WriteGuard Guard1((OBJ)->GetLock(TYPE));
#endif

#endif
