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

#include "Common.h"
#include "UpdateData.h"
#include "ByteBuffer.h"
#include "WorldPacket.h"
#include "Log.h"
#include "Opcodes.h"
#include "World.h"
#include "ObjectGuid.h"
#include <zlib/zlib.h>

UpdateData::UpdateData() : m_blockCount(0)
{
}

void UpdateData::AddOutOfRangeGuids(GuidSet& guids)
{
    m_outOfRangeGuids.insert(guids.begin(), guids.end());
}

void UpdateData::AddOutOfRangeGuid(ObjectGuid const& guid)
{
    m_outOfRangeGuids.insert(guid);
}

void UpdateData::AddUpdateBlock(ByteBuffer const& block)
{
    m_data.append(block);
    ++m_blockCount;
}

void UpdateData::Compress(void* dst, uint32* dst_size, void* src, int src_size)
{
    z_stream c_stream;

    c_stream.zalloc = (alloc_func)0;
    c_stream.zfree = (free_func)0;
    c_stream.opaque = (voidpf)0;

    // default Z_BEST_SPEED (1)
    int z_res = deflateInit(&c_stream, sWorld.getConfig(CONFIG_UINT32_COMPRESSION));
    if (z_res != Z_OK)
    {
        sLog.outError("Can't compress update packet (zlib: deflateInit) Error code: %i (%s)",z_res,zError(z_res));
        *dst_size = 0;
        return;
    }

    c_stream.next_out = (Bytef*)dst;
    c_stream.avail_out = *dst_size;
    c_stream.next_in = (Bytef*)src;
    c_stream.avail_in = (uInt)src_size;

    z_res = deflate(&c_stream, Z_NO_FLUSH);
    if (z_res != Z_OK)
    {
        sLog.outError("Can't compress update packet (zlib: deflate) Error code: %i (%s)",z_res,zError(z_res));
        *dst_size = 0;
        return;
    }

    if (c_stream.avail_in != 0)
    {
        sLog.outError("Can't compress update packet (zlib: deflate not greedy)");
        *dst_size = 0;
        return;
    }

    z_res = deflate(&c_stream, Z_FINISH);
    if (z_res != Z_STREAM_END)
    {
        sLog.outError("Can't compress update packet (zlib: deflate should report Z_STREAM_END instead %i (%s)",z_res,zError(z_res));
        *dst_size = 0;
        return;
    }

    z_res = deflateEnd(&c_stream);
    if (z_res != Z_OK)
    {
        sLog.outError("Can't compress update packet (zlib: deflateEnd) Error code: %i (%s)",z_res,zError(z_res));
        *dst_size = 0;
        return;
    }

    *dst_size = c_stream.total_out;
}

bool UpdateData::BuildPacket(WorldPacket* packet)
{
    MANGOS_ASSERT(packet->empty());                         // shouldn't happen

    ByteBuffer buf(4 + (m_outOfRangeGuids.empty() ? 0 : 1 + 4 + 9 * m_outOfRangeGuids.size()) + m_data.wpos());

    buf << uint32((!m_outOfRangeGuids.empty() ? m_blockCount + 1 : m_blockCount));

    if (!m_outOfRangeGuids.empty())
    {
        buf << uint8(UPDATETYPE_OUT_OF_RANGE_OBJECTS);
        buf << uint32(m_outOfRangeGuids.size());

        for (GuidSet::const_iterator itr = m_outOfRangeGuids.begin(); itr != m_outOfRangeGuids.end(); ++itr)
            buf << itr->WriteAsPacked();
    }

    buf.append(m_data);

    size_t pktSize = buf.wpos(); // use real used data size

    uint32 dstSize = compressBound(pktSize);
    packet->resize(sizeof(uint32) + dstSize);
    packet->put<uint32>(0, pktSize); // put uncompessed size

    Compress(const_cast<uint8*>(packet->contents()) + sizeof(uint32), &dstSize, (void*)buf.contents(), pktSize);

    // if compress error, send as uncompressed
    if (!dstSize)
        dstSize = pktSize;

    dstSize += sizeof(uint32);

    // send compressed packet if size less
    if (dstSize < pktSize)
    {
        packet->resize(dstSize);
        packet->SetOpcode(SMSG_COMPRESSED_UPDATE_OBJECT);
    }
    // send packets without compression
    else
    {
        packet->clear(); // clear before append buf. in WorldSocket::SendPacket used pct.size(), not pct.wpos()
        packet->append(buf);
        packet->SetOpcode(SMSG_UPDATE_OBJECT);
    }

    return true;
}

void UpdateData::Clear()
{
    m_data.clear();
    m_outOfRangeGuids.clear();
    m_blockCount = 0;
}
