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

/* based on LockedQueue class from MaNGOS */
/* written for use instead not locked std::list && std::vector */

#ifndef LOCKEDVECTOR_H
#define LOCKEDVECTOR_H

#include "Common.h"
#include <vector>
#include <list>
#include <assert.h>

namespace ACE_Based
{
    template <class T, class Allocator = std::allocator<T> >
    class LockedVector
    {
        public:
        MANGOSR2_ATOMIC_LOCK_TYPE RefLock;

        typedef typename std::vector<T, Allocator>::iterator               iterator;
        typedef typename std::vector<T, Allocator>::const_iterator         const_iterator;
        typedef typename std::vector<T, Allocator>::reverse_iterator       reverse_iterator;
        typedef typename std::vector<T, Allocator>::const_reverse_iterator const_reverse_iterator;
        typedef typename std::vector<T, Allocator>::allocator_type         allocator_type;
        typedef typename std::vector<T, Allocator>::value_type             value_type;
        typedef typename std::vector<T, Allocator>::size_type              size_type;
        typedef typename std::vector<T, Allocator>::difference_type        difference_type;

        public:
            //Constructors
            explicit LockedVector(const Allocator& alloc = Allocator()) : m_storage(alloc), RefLock(0)
            {}

            explicit LockedVector(size_type n, const T& value = T(), const Allocator& alloc = Allocator())
                : m_storage(n,value,alloc), RefLock(0)
            {}

            virtual ~LockedVector(void)
            {
                MANGOSR2_ATOMIC_LOCK_WAIT(RefLock);
            }

            void reserve(size_type idx)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                m_storage.reserve(idx);
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
            }

            // Methods
            void push_back(const T& item)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                m_storage.push_back(item);
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
            }

            void insert(iterator pos, size_type n, const T& u ) 
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                m_storage.insert( pos, n, u ); 
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
            }

            template <class InputIterator> 
            void insert(iterator pos, InputIterator begin, InputIterator end)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                m_storage.insert(pos, begin, end);
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
            }

            void pop_back()
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                m_storage.pop_back();
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
            }

            void erase(size_type pos)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                m_storage.erase(m_storage.begin() + pos);
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
            }

            iterator erase(iterator itr)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                iterator ret = m_storage.erase(itr);
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return ret;
            }

            void remove(const T& item)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                erase(item);
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
            }

            void erase(const T& item)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                for (size_type i = 0; i < m_storage.size();)
                {
                    if (item == m_storage[i])
                        m_storage.erase(m_storage.begin() + i);
                    else
                        ++i;
                }
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
            }

            T* find(const T& item)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                T* ret = NULL;
                for (size_type i = 0; i < m_storage.size(); ++i)
                {
                    if (item == m_storage[i])
                    {
                        ret = &m_storage[i];
                        break;
                    }
                }
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return ret;
            }

            const T* find(const T& item) const
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                const T* ret = NULL;
                for (size_type i = 0; i < m_storage.size(); ++i)
                {
                    if (item == m_storage[i])
                    {
                        ret = &m_storage[i];
                        break;
                    }
                }
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return ret;
            }

            void clear()
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                m_storage.clear();
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
            }

            T& operator[](size_type idx) 
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return m_storage[idx];
            }

            const T& operator[](size_type idx) const
            {
                MANGOSR2_ATOMIC_LOCK_WAIT(RefLock);
                return m_storage[idx];
            }

            T& at(size_type idx) 
            {
                MANGOSR2_ATOMIC_LOCK_WAIT(RefLock);
                return m_storage.at(idx);
            }

            T& front()
            {
                MANGOSR2_ATOMIC_LOCK_WAIT(RefLock);
                return m_storage.front();
            }

            T& back()
            {
                MANGOSR2_ATOMIC_LOCK_WAIT(RefLock);
                return m_storage.back();
            }

            const T& front() const
            {
                MANGOSR2_ATOMIC_LOCK_WAIT(RefLock);
                return m_storage.front();
            }

            const T& back() const
            {
                MANGOSR2_ATOMIC_LOCK_WAIT(RefLock);
                return m_storage.back();
            }

            iterator begin()
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                iterator itr =  m_storage.begin();
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return itr;
            }

            iterator end()
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                iterator itr =  m_storage.end();
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return itr;
            }

            const_iterator begin() const
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                const_iterator itr =  m_storage.begin();
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return itr;
            }

            const_iterator end() const
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                const_iterator itr = m_storage.end();
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return itr;
            }

            reverse_iterator rbegin()
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                reverse_iterator itr = m_storage.rbegin();
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return itr;
            }

            reverse_iterator rend()
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                reverse_iterator itr = m_storage.rend();
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return itr;
            }

            const_reverse_iterator rbegin() const
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                const_reverse_iterator itr =  m_storage.rbegin();
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return itr;
            }

            const_reverse_iterator rend() const
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                const_reverse_iterator itr = m_storage.rend();
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return itr;
            }

            bool empty() const
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                bool ret = m_storage.empty();
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return ret;
            }

            size_type size() const
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                size_type ret = m_storage.size();
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return ret;
            }

            LockedVector& operator=(const std::vector<T> &v)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                m_storage.clear();
                for (typename std::vector<T>::const_iterator i = v.begin(); i != v.end(); ++i) 
                {
                    this->push_back(*i);
                }
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return *this;
            }

            LockedVector(const std::vector<T> &v)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                for (typename std::vector<T>::const_iterator i = v.begin(); i != v.end(); ++i) 
                {
                    this->push_back(*i);
                }
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
            }

            LockedVector& operator=(const std::list<T> &v)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                m_storage.clear();
                for (typename std::list<T>::const_iterator i = v.begin(); i != v.end(); ++i) 
                {
                    this->push_back(*i);
                }
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return *this;
            }

            LockedVector(const std::list<T> &v)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                for (typename std::list<T>::const_iterator i = v.begin(); i != v.end(); ++i) 
                {
                    this->push_back(*i);
                }
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
            }

            LockedVector& operator=(const LockedVector<T> &v)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                MANGOSR2_ATOMIC_LOCK_BEGIN(v.RefLock);
                m_storage = v.m_storage;
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                MANGOSR2_ATOMIC_LOCK_END(v.RefLock);
                return *this;
            }

            LockedVector(const LockedVector<T> &v)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                MANGOSR2_ATOMIC_LOCK_BEGIN(v.RefLock);
                m_storage = v.m_storage;
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                MANGOSR2_ATOMIC_LOCK_END(v.RefLock);
            }

            void swap(LockedVector<T, Allocator>& x)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                MANGOSR2_ATOMIC_LOCK_BEGIN(x.RefLock);
                m_storage.swap(x.m_storage); 
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                MANGOSR2_ATOMIC_LOCK_END(x.RefLock);
            }

            void resize(size_type num, T def = T())
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                m_storage.resize(num, def);
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
            }

            //Allocator
            allocator_type get_allocator() const
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                allocator_type ret = m_storage.get_allocator(); 
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
                return ret; 
            }

            // Sort template
            template <typename C>
            void sort(C& compare)
            {
                MANGOSR2_ATOMIC_LOCK_BEGIN(RefLock);
                iterator _begin = m_storage.begin();
                iterator _end   = m_storage.end();
                std::stable_sort(_begin,_end,compare);
                MANGOSR2_ATOMIC_LOCK_END(RefLock);
            }

            // may be used _ONLY_ with external locking!
            std::vector<T>&  getSource()
            {
                return m_storage;
            }

        protected:
            std::vector<T, Allocator>  m_storage;
    };
}
#endif
