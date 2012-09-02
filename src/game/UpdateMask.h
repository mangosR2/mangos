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

#ifndef __UPDATEMASK_H
#define __UPDATEMASK_H

#include "UpdateFields.h"
#include "Errors.h"

class UpdateMask
{
    public:
        UpdateMask() : m_Count(0), m_Blocks(0), m_UpdateMask(0) {}
        UpdateMask(UpdateMask const& mask) : m_UpdateMask(0) { *this = mask; }

        ~UpdateMask()
        {
            if (m_UpdateMask)
                delete[] m_UpdateMask;
        }

        void SetBit(uint32 index)
        {
            ((uint8*)m_UpdateMask)[index >> 3] |= 1 << (index & 0x7);
        }

        void UnsetBit(uint32 index)
        {
            ((uint8*)m_UpdateMask)[index >> 3] &= (0xff ^ (1 << (index & 0x7)));
        }

        bool GetBit(uint32 index) const
        {
            return (((uint8*)m_UpdateMask)[index >> 3] & (1 << (index & 0x7))) != 0;
        }

        uint32 GetBlockCount() const { return m_Blocks; }
        uint32 GetLength() const { return m_Blocks << 2; }
        uint32 GetCount() const { return m_Count; }
        uint8* GetMask() { return (uint8*)m_UpdateMask; }

        void SetCount(uint32 valuesCount)
        {
            if (m_UpdateMask)
                delete[] m_UpdateMask;

            m_Count = valuesCount;
            m_Blocks = (valuesCount + 31) / 32;

            m_UpdateMask = new uint32[m_Blocks];
            memset(m_UpdateMask, 0, m_Blocks << 2);
        }

        void Clear()
        {
            if (m_UpdateMask)
                memset(m_UpdateMask, 0, m_Blocks << 2);
        }

        UpdateMask& operator = (UpdateMask const& mask)
        {
            SetCount(mask.m_Count);
            memcpy(m_UpdateMask, mask.m_UpdateMask, m_Blocks << 2);

            return *this;
        }

        void operator &= (UpdateMask const& mask)
        {
            MANGOS_ASSERT(mask.m_Count <= m_Count);
            for (uint32 i = 0; i < m_Blocks; ++i)
                m_UpdateMask[i] &= mask.m_UpdateMask[i];
        }

        void operator |= (UpdateMask const& mask)
        {
            MANGOS_ASSERT(mask.m_Count <= m_Count);
            for (uint32 i = 0; i < m_Blocks; ++i)
                m_UpdateMask[i] |= mask.m_UpdateMask[i];
        }

        UpdateMask operator & (UpdateMask const& mask) const
        {
            MANGOS_ASSERT(mask.m_Count <= m_Count);

            UpdateMask newmask;
            newmask = *this;
            newmask &= mask;

            return newmask;
        }

        UpdateMask operator | (UpdateMask const& mask) const
        {
            MANGOS_ASSERT(mask.m_Count <= m_Count);

            UpdateMask newmask;
            newmask = *this;
            newmask |= mask;

            return newmask;
        }

    private:
        uint32 m_Count;
        uint32 m_Blocks;
        uint32 *m_UpdateMask;
};

#endif
