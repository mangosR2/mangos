/*
 * Copyright (C) 2011-2013 /dev/rsa && Boxa for MangosR2 <http://github.com/MangosR2>
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

#ifndef _MANGOSR2_MEMBAR_MUTEX_INCLUDED
#define _MANGOSR2_MEMBAR_MUTEX_INCLUDED

#if defined (WIN32) || defined (WIN64)
    #define MANGOSR2_ATOMIC_LOCK_TYPE volatile mutable uint32
    #define MANGOSR2_ATOMIC_LOCK_BEGIN(lockHolder) while (InterlockedExchange(&lockHolder, 1)) SwitchToThread()
    #define MANGOSR2_ATOMIC_LOCK_END(lockHolder) InterlockedExchange(&lockHolder, 0)
    #define MANGOSR2_ATOMIC_LOCK_WAIT(lockHolder) MANGOSR2_ATOMIC_LOCK_BEGIN(lockHolder); MANGOSR2_ATOMIC_LOCK_END(lockHolder)
    #define MANGOSR2_ATOMIC_LOCK_TRYBEGIN(lockHolder) InterlockedExchange(&lockHolder, 1)
#else
    #define MANGOSR2_ATOMIC_LOCK_TYPE volatile mutable uint32
    #define MANGOSR2_ATOMIC_LOCK_BEGIN(lockHolder) while (__sync_val_compare_and_swap(&lockHolder, 0, 1)) sched_yield()
    #define MANGOSR2_ATOMIC_LOCK_END(lockHolder) __sync_val_compare_and_swap(&lockHolder, 1, 0)
    #define MANGOSR2_ATOMIC_LOCK_WAIT(lockHolder) MANGOSR2_ATOMIC_LOCK_BEGIN(lockHolder); MANGOSR2_ATOMIC_LOCK_END(lockHolder)
    #define MANGOSR2_ATOMIC_LOCK_TRYBEGIN(lockHolder) __sync_val_compare_and_swap(&lockHolder, 0, 1)
#endif

class MangosR2_Mutex
{
    public:
        MangosR2_Mutex() : RefLock(0) {}

        ~MangosR2_Mutex() {}

        int remove() { RefLock = 0; return 0; }

        int acquire() { MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock); return 0; }

        /// Return -1 with @c errno == @c ETIME.
        int acquire(ACE_Time_Value&) { return -1; }

        /// Return -1 with @c errno == @c ETIME.
        int acquire(ACE_Time_Value*) { return -1; }
 
        int tryacquire() { if (MANGOSR2_ATOMIC_LOCK_TRYBEGIN(RefLock)) return -1; else return 0; }
 
        int release() { MANGOSR2_ATOMIC_LOCK_END(RefLock); return 0; }
 
        int acquire_write() {return acquire(); }
 
        int tryacquire_write() {return tryacquire(); }
 
        /// Return 0.
        int tryacquire_write_upgrade() { return 0; }
 
        int acquire_read() { return acquire(); }
 
        int tryacquire_read() { return tryacquire(); }
 
        /// Dump the state of an object.
        void dump () const {}

    private:
        MANGOSR2_ATOMIC_LOCK_TYPE RefLock;
};

#endif //_MANGOSR2_MEMBAR_MUTEX_INCLUDED
