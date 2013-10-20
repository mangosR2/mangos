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

#ifndef _LINKEDLIST
#define _LINKEDLIST

#include "Common.h"

//============================================
class LinkedListHead;

class LinkedListElement
{
    private:

        volatile mutable bool RefLock;
        friend class LinkedListHead;

        LinkedListElement* iNext;
        LinkedListElement* iPrev;

    public:

        LinkedListElement() : RefLock(0), iNext(NULL), iPrev(NULL)
        {}
        virtual ~LinkedListElement() { delink(); }

        bool hasNext() const  { return (iNext != NULL && iNext->iNext != NULL); }
        bool hasPrev() const  { return (iPrev != NULL && iPrev->iPrev != NULL); }
        bool isInList() const { return (iNext != NULL && iPrev != NULL); }

        LinkedListElement*       next()
        {
            if (hasNext())
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                LinkedListElement* ret = iNext;
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return ret;
            }
            return NULL;
        }
        LinkedListElement const* next() const
        {
            if (hasNext())
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                LinkedListElement const* ret = iNext;
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return ret;
            }
            return NULL;
        }
        LinkedListElement*       prev()
        {
            if (hasPrev())
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                LinkedListElement* ret = iPrev;
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return ret;
            }
            return NULL;
        }
        LinkedListElement const* prev() const
        {
            if (hasPrev())
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                LinkedListElement const* ret = iPrev;
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return ret;
            }
            return NULL;
        }

        LinkedListElement      * nocheck_next()       { return iNext; }
        LinkedListElement const* nocheck_next() const { return iNext; }
        LinkedListElement      * nocheck_prev()       { return iPrev; }
        LinkedListElement const* nocheck_prev() const { return iPrev; }

        void delink()
        {
            if (isInList())
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                iNext->iPrev = iPrev;
                iPrev->iNext = iNext;
                iNext = NULL;
                iPrev = NULL;
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
            }
        }

        void insertBefore(LinkedListElement* pElem)
        {
            MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
            pElem->iNext = this;
            pElem->iPrev = iPrev;
            iPrev->iNext = pElem;
            iPrev = pElem;
            MANGOSR2_ATOMIC_LOCK_END(RefLock);
        }

        void insertAfter(LinkedListElement* pElem)
        {
            MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
            pElem->iPrev = this;
            pElem->iNext = iNext;
            iNext->iPrev = pElem;
            iNext = pElem;
            MANGOSR2_ATOMIC_LOCK_END(RefLock);
        }
};

//============================================

class LinkedListHead
{
    private:

        LinkedListElement iFirst;
        LinkedListElement iLast;
        uint32 iSize;

    public:

        LinkedListHead()
        {
            // create empty list

            iFirst.iNext = &iLast;
            iLast.iPrev = &iFirst;
            iSize = 0;
        }

        bool isEmpty() const { return (!iFirst.iNext->isInList()); }

        LinkedListElement      * getFirst()       { return (isEmpty() ? NULL : iFirst.iNext); }
        LinkedListElement const* getFirst() const { return (isEmpty() ? NULL : iFirst.iNext); }

        LinkedListElement      * getLast()        { return (isEmpty() ? NULL : iLast.iPrev); }
        LinkedListElement const* getLast() const  { return (isEmpty() ? NULL : iLast.iPrev); }

        void insertFirst(LinkedListElement* pElem)
        {
            iFirst.insertAfter(pElem);
        }

        void insertLast(LinkedListElement* pElem)
        {
            iLast.insertBefore(pElem);
        }

        uint32 getSize() const
        {
            if (!iSize)
            {
                uint32 result = 0;
                LinkedListElement const* e = getFirst();

                while(e)
                {
                    ++result;
                    e = e->next();
                }

                return result;
            }
            else
                return iSize;
        }

        void incSize() { ++iSize; }
        void decSize() { --iSize; }

        template<class _Ty>
        class Iterator
        {
            public:

                typedef std::bidirectional_iterator_tag iterator_category;
                typedef _Ty value_type;
                typedef ptrdiff_t difference_type;
                typedef ptrdiff_t distance_type;
                typedef _Ty* pointer;
                typedef _Ty const* const_pointer;
                typedef _Ty& reference;
                typedef _Ty const& const_reference;


                Iterator()
                    : _Ptr(0)
                {                                           // construct with null node pointer
                }

                Iterator(pointer _Pnode)
                    : _Ptr(_Pnode)
                {                                           // construct with node pointer _Pnode
                }

                Iterator& operator=(Iterator const &_Right)
                {
                    return (*this) = _Right._Ptr;
                }

                Iterator& operator=(const_pointer const &_Right)
                {
                    _Ptr = (pointer)_Right;
                    return (*this);
                }

                reference operator*()
                {                                           // return designated value
                    return *_Ptr;
                }

                pointer operator->()
                {                                           // return pointer to class object
                    return _Ptr;
                }

                Iterator& operator++()
                {                                           // preincrement
                    _Ptr = _Ptr->next();
                    return (*this);
                }

                Iterator operator++(int)
                {                                           // postincrement
                    iterator _Tmp = *this;
                    ++*this;
                    return (_Tmp);
                }

                Iterator& operator--()
                {                                           // predecrement
                    _Ptr = _Ptr->prev();
                    return (*this);
                }

                Iterator operator--(int)
                {                                           // postdecrement
                    iterator _Tmp = *this;
                    --*this;
                    return (_Tmp);
                }

                bool operator==(Iterator const &_Right) const
                {                                           // test for iterator equality
                    return (_Ptr == _Right._Ptr);
                }

                bool operator!=(Iterator const &_Right) const
                {                                           // test for iterator inequality
                    return (!(*this == _Right));
                }

                bool operator==(pointer const &_Right) const
                {                                           // test for pointer equality
                    return (_Ptr != _Right);
                }

                bool operator!=(pointer const &_Right) const
                {                                           // test for pointer equality
                    return (!(*this == _Right));
                }

                bool operator==(const_reference _Right) const
                {                                           // test for reference equality
                    return (_Ptr == &_Right);
                }

                bool operator!=(const_reference _Right) const
                {                                           // test for reference equality
                    return (_Ptr != &_Right);
                }

                pointer _Mynode()
                {                                           // return node pointer
                    return (_Ptr);
                }

            protected:

                pointer _Ptr;                               // pointer to node
        };

        typedef Iterator<LinkedListElement> iterator;
};

//============================================

#endif
