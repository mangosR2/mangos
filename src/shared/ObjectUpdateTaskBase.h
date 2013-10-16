/*
 * Copyright (C) 2011-2013 /dev/rsa for MangosR2 <http://github.com/MangosR2>
 * Copyright (C) 2005-2010 MaNGOS <http://getmangos.com/>
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

#ifndef _OBJECT_UPDATE_TASK_BASE_H_INCLUDED
#define _OBJECT_UPDATE_TASK_BASE_H_INCLUDED

#include <ace/Activation_Queue.h>
#include <ace/Condition_Thread_Mutex.h>
#include <ace/Method_Request.h>
#include <ace/Task.h>

#include "Common.h"
#include "Timer.h"

#define MAX_PARENT_THREADS 255

template <class T> class ObjectUpdateRequest : public ACE_Method_Request
{

    protected:
        T&           m_obj;
        uint32       m_diff;
        uint32 const m_startTime;

    public:
        ObjectUpdateRequest(T& m, uint32 diff)
            : m_obj(m), m_diff(diff), m_startTime(WorldTimer::getMSTime())
        {
        }

        virtual int call()
        {
            m_obj.Update(m_diff);
            return 0;
        }

        virtual T* getObject()
        {
            return &m_obj;
        }

        virtual uint32 getStartTime() const
        {
            return m_startTime;
        }
};

template <class T> class ObjectUpdateTaskBase : protected ACE_Task_Base
{
    public:

        ObjectUpdateTaskBase()
            : m_mutex(), m_condition(m_mutex), m_rwmutex(),  m_currentThreadsCount(0), m_round(false)
        {
            if (activated())
                deactivate();
            m_lastError.clear();
        }

        virtual ~ObjectUpdateTaskBase()
        {
            deactivate();
        }

        typedef typename std::map<ACE_thread_t , ObjectUpdateRequest<T>* > ThreadsMap;

        ObjectUpdateTaskBase<T>* instance()
        {
            return ACE_Singleton<ObjectUpdateTaskBase<T>, ACE_Thread_Mutex>::instance();
        }

        int svc()
        {
            while (true)
            {
                if (m_round)
                    m_condition.broadcast();
                if (ACE_Method_Request* rq = m_queue.dequeue())
                {
                    T* obj = ((ObjectUpdateRequest<T>*)rq)->getObject();
                    if (obj)
                    {
                        statistic_hook_begin(obj);
                        setThreadInfo(ACE_OS::thr_self(), (ObjectUpdateRequest<T>*)rq);
                        rq->call();
                        setThreadInfo(ACE_OS::thr_self(), NULL);
                        statistic_hook_end(obj);
                    }
                    if (rq)
                        delete rq;

                    if (!m_round)
                        m_condition.broadcast();
                }
                else
                {
                    outError("ObjectUpdateTaskBase::svc failed to get sheduled object from queue!");
                    break;
                }
            }
            --m_currentThreadsCount;
            m_condition.broadcast();
            return 0;
        }

        T* getObject(ACE_thread_t thread_num)
        {
            typename ThreadsMap::iterator itr = m_threadsMap.find(thread_num);
            return itr == m_threadsMap.end() ?  NULL : itr->second->getObject();
        }

        virtual int schedule_update(T& obj, uint32 diff)
        {
            if (m_round)
            {
                outError("ObjectUpdateTaskBase::shedule_update called while update round started!");
                return -1;
            }

            if (execute(new ObjectUpdateRequest<T>(obj, diff)) == -1)
            {
                outError("ObjectUpdateTaskBase::schedule_update failed to schedule Object Update");
                return -1;
            }
            return 0;
        }

        int execute(ObjectUpdateRequest<T>* new_req)
        {
            if (new_req == NULL)
                return -1;

            while (m_queue.is_full())
                m_condition.wait();

            if (m_queue.enqueue((ACE_Method_Request*)new_req, (ACE_Time_Value*)&ACE_Time_Value::zero) == -1)
            {
                delete new_req;
                outError("ObjectUpdateTaskBase::execute enqueue failed!");
                return -1;
            }
            return 0;
        }

        int queue_wait(uint32 maxDelay = 0 /*msec*/)
        {
            if (m_round)
            {
                outError("ObjectUpdateTaskBase::queue_wait try start with already beginned round!");
                return -1;
            }

            ACE_Guard<ACE_Thread_Mutex> guard(m_mutex, true);
            m_round = true;
            statistic_hook_round_barrier();
            ACE_Time_Value absTime = ACE_OS::gettimeofday() + ACE_Time_Value(0, maxDelay * 1000);
            int result = 0;

            while (m_currentThreadsCount > 0 && (!m_queue.is_empty() || getActiveThreadsCount() > 0))
            {
                int res = m_condition.wait((maxDelay == 0) ? NULL : &absTime);
                if (res == -1)
                {
                    if (freeze_hook() == 1 || (m_queue.is_empty() && getActiveThreadsCount() == 0))
                    {
                        result = getActiveThreadsCount();
                        break;
                    }
                }
            }
            statistic_hook_round_end();
            m_round = false;
            return result;
        }

        int activate(size_t num_threads)
        {
            if (activated() || num_threads < 1)
                return -1;

            ACE_Guard<ACE_Thread_Mutex> guard(m_mutex, true);
            m_queue.queue()->activate();
            if (ACE_Task_Base::activate(THR_NEW_LWP | THR_JOINABLE | THR_INHERIT_SCHED, num_threads) == -1)
            {
                m_queue.queue()->deactivate();
                return -1;
            }

            ACE_thread_t threads[MAX_PARENT_THREADS];
            thr_mgr()->thread_list(this, threads, num_threads);

            m_threadsMap.clear();
            for (size_t i = 0; i < num_threads; ++i)
                m_threadsMap[threads[i]] = NULL;

            m_currentThreadsCount = num_threads;
            m_currentActiveThreadsCount = 0;

            return 1;
        }

        int deactivate()
        {
            if (!activated())
                return -1;

            if (getCurrentThreadsCount() > 0)
            {
                ACE_thread_t threads[MAX_PARENT_THREADS];
                size_t num_threads = thr_mgr() ? thr_mgr()->thread_list(this, threads, MAX_PARENT_THREADS) : 0;
                if (num_threads > 0)
                {
                    for (size_t i = 0; i < num_threads; ++i)
                        kill_thread(threads[i], true);
                }
            }

            ACE_Guard<ACE_Thread_Mutex> guard(m_mutex, true);
            m_queue.queue()->deactivate();
            wait();
            m_threadsMap.clear();
            m_currentThreadsCount = 0;
            m_currentActiveThreadsCount = 0;
            return 0;
        }

        void reactivate(uint32 threads)
        {
            statistic_hook_round_begin();
            if (m_currentThreadsCount == threads && activated())
                return;

            deactivate();
            activate(threads);
        }

        bool activated() const
        {
            return !m_queue.queue()->deactivated();
        }

        void kill_thread(ACE_thread_t threadId, bool needKill)
        {
            if (needKill)
            {
                //thr_mgr()->kill(threadId, SIGABRT);
                thr_mgr()->cancel(threadId, 0);
                setThreadInfo(threadId, NULL);
                --m_currentThreadsCount;
            }
        }

        // thread information block
        void setThreadInfo(ACE_thread_t threadId, ObjectUpdateRequest<T>* rq)
        {
            ObjectUpdateRequest<T>* oldrq = getThreadInfo(threadId);
            ACE_Write_Guard<ACE_RW_Thread_Mutex> guardRW(m_rwmutex, true);
            if (rq && !oldrq)
                ++m_currentActiveThreadsCount;
            else if (!rq && oldrq)
                --m_currentActiveThreadsCount;

            m_threadsMap[ACE_OS::thr_self()] = rq;
        }

        size_t getActiveThreadsCount()
        {
            ACE_Read_Guard<ACE_RW_Thread_Mutex> guardRW(m_rwmutex, true);
            return m_currentActiveThreadsCount;
        }

        ObjectUpdateRequest<T>* getThreadInfo(ACE_thread_t threadId)
        {
            ACE_Read_Guard<ACE_RW_Thread_Mutex> guardRW(m_rwmutex, true);
            typename ThreadsMap::iterator itr = m_threadsMap.find(threadId);
            return itr == m_threadsMap.end() ? NULL : itr->second;
        }

        void outError(char const* str, ...)
        {
            if (!str)
                return;

            va_list ap;
            va_start(ap, str);
            char buffer[255];
            sprintf(buffer, str, &ap);
            va_end(ap);
            m_lastError.clear();
            m_lastError.append(buffer);
        }

        std::string getLastError()
        {
            std::string temp = m_lastError;
            m_lastError.clear();
            return temp;
        }

        size_t getCurrentThreadsCount() const
        {
            return m_currentThreadsCount;
        }

        // Freeze reaction hook
        virtual int freeze_hook()                   { return 0; } /* 0 - no reaction, 1 - force end waiting*/

        // Statistic block (for load analyze)
        virtual void statistic_hook_begin(T* obj)   {}
        virtual void statistic_hook_end(T* obj)     {}

        virtual void statistic_hook_round_begin()   {}
        virtual void statistic_hook_round_barrier() {}
        virtual void statistic_hook_round_end()     {}

        // External periodical update hook (for statistic mostly)
        virtual int update_hook()                   { return 0; }

    protected:
        ACE_Thread_Mutex           m_mutex;
        ACE_Condition_Thread_Mutex m_condition;
        ACE_RW_Thread_Mutex        m_rwmutex;
        ACE_Activation_Queue       m_queue;
        ThreadsMap                 m_threadsMap;
        size_t                     m_currentThreadsCount;
        size_t                     m_currentActiveThreadsCount;
        bool                       m_round;
        std::string                m_lastError;
};

#endif //_OBJECT_UPDATE_TASK_BASE_H_INCLUDED
