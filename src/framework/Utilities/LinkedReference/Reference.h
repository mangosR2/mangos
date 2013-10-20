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

#ifndef _REFERENCE_H
#define _REFERENCE_H

#include "Utilities/LinkedList.h"

//=====================================================

template<class TO, class FROM>
class Reference : public LinkedListElement
{
    private:

        MANGOSR2_ATOMIC_LOCK_TYPE RefLock;
        TO* iRefTo;
        FROM* iRefFrom;

    protected:

        // Tell our refTo (target) object that we have a link
        virtual void targetObjectBuildLink() = 0;

        // Tell our refTo (taget) object, that the link is cut
        virtual void targetObjectDestroyLink() = 0;

        // Tell our refFrom (source) object, that the link is cut (Target destroyed)
        virtual void sourceObjectDestroyLink() = 0;

    public:

        Reference()
            : RefLock(0), iRefTo(NULL), iRefFrom(NULL)
        {}

        virtual ~Reference() 
        {}

        // Create new link
        void link(TO* toObj, FROM* fromObj)
        {
            assert(fromObj);                                // fromObj MUST not be NULL
            if (isValid())
                unlink();

            if (toObj != NULL)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                iRefTo = toObj;
                iRefFrom = fromObj;
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                targetObjectBuildLink();
            }
        }

        // We don't need the reference anymore. Call comes from the refFrom object
        // Tell our refTo object, that the link is cut
        void unlink()
        {
            targetObjectDestroyLink();
            delink();
            MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
            iRefTo = NULL;
            iRefFrom = NULL;
            MANGOSR2_ATOMIC_LOCK_END(RefLock);
        }

        // Link is invalid due to destruction of referenced target object. Call comes from the refTo object
        // Tell our refFrom object, that the link is cut
        void invalidate()                                   // the iRefFrom MUST remain!!
        {
            sourceObjectDestroyLink();
            delink();
            MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
            iRefTo = NULL;
            MANGOSR2_ATOMIC_LOCK_END(RefLock);
        }

        bool isValid() const                                // Only check the iRefTo
        {
            MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
            bool ret = iRefTo != NULL;
            MANGOSR2_ATOMIC_LOCK_END(RefLock);
            return ret;
        }

        Reference<TO, FROM>*       next()       { return ((Reference<TO, FROM>*) LinkedListElement::next()); }
        Reference<TO, FROM> const* next() const { return ((Reference<TO, FROM> const*) LinkedListElement::next()); }
        Reference<TO, FROM>*       prev()       { return ((Reference<TO, FROM>*) LinkedListElement::prev()); }
        Reference<TO, FROM> const* prev() const { return ((Reference<TO, FROM> const*) LinkedListElement::prev()); }

        Reference<TO, FROM>*       nocheck_next()       { return ((Reference<TO, FROM>*) LinkedListElement::nocheck_next()); }
        Reference<TO, FROM> const* nocheck_next() const { return ((Reference<TO, FROM> const*) LinkedListElement::nocheck_next()); }
        Reference<TO, FROM>*       nocheck_prev()       { return ((Reference<TO, FROM>*) LinkedListElement::nocheck_prev()); }
        Reference<TO, FROM> const* nocheck_prev() const { return ((Reference<TO, FROM> const*) LinkedListElement::nocheck_prev()); }

        TO* operator->() const 
        {
            MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
            TO* ret = iRefTo;
            MANGOSR2_ATOMIC_LOCK_END(RefLock);
            return ret;
        }
        TO* getTarget() const
        {
            MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
            TO* ret = iRefTo;
            MANGOSR2_ATOMIC_LOCK_END(RefLock);
            return ret;
        }

        FROM* getSource() const
        {
            MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
            FROM* ret = iRefFrom;
            MANGOSR2_ATOMIC_LOCK_END(RefLock);
            return ret;
        }
};

//=====================================================

#endif
