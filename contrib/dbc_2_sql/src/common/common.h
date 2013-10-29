/*
 DBC to SQL Converter
    Copyright (C) 2009  David Vas, Anubisss
    <http://code.google.com/p/dbctosql/>
    updated by Przemratajczak and Darkrulerz
	
	DBC to SQL Converter
    Copyright (C) 2010 -2011  Infinity_mangos_Project
    www.github.com/fallenangelX
    updated this time around by fallenangelX and singlem

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef __COMMON_H__
#define __COMMON_H__

char static const *EXPECTED_CLIENT_BUILT = "3.3.5 (12340)";

typedef char int8;
typedef int int16;
typedef long int32;

typedef unsigned char uint8;
typedef unsigned int uint16;
typedef unsigned long uint32;

class flag96
{
    private:
        uint32 part[3];

    public:
        flag96(uint32 p1 = 0, uint32 p2 = 0, uint32 p3 = 0)
        {
            part[0] = p1;
            part[1] = p2;
            part[2] = p3;
        }

        inline bool IsEqual(uint32 p1 = 0, uint32 p2 = 0, uint32 p3 = 0) const
        {
            return (
                part[0] == p1 &&
                part[1] == p2 &&
                part[2] == p3);
        };

        inline bool HasFlag(uint32 p1 = 0, uint32 p2 = 0, uint32 p3 = 0) const
        {
            return (
                part[0] & p1 ||
                part[1] & p2 ||
                part[2] & p3);
        };

    inline void Set(uint32 p1 = 0, uint32 p2 = 0, uint32 p3 = 0)
    {
        part[0] = p1;
        part[1] = p2;
        part[2] = p3;
    };

    template<class type>
    inline bool operator < (type & right)
    {
        for(uint8 i = 3; i > 0; i--)
        {
            if(part[i-1]<right.part[i-1])
                return 1;
            else if(part[i-1]>right.part[i-1])
                return 0;
        }
        return 0;
    };

    template<class type>
    inline bool operator < (type & right) const
    {
        for (uint8 i = 3; i > 0; i--)
        {
            if(part[i-1]<right.part[i-1])
                return 1;
            else if(part[i-1]>right.part[i-1])
                return 0;
        }
        return 0;
    };

    template<class type>
    inline bool operator != (type & right)
    {
        if (part[0] != right.part[0]
            || part[1] != right.part[1]
            || part[2] != right.part[2])
                return true;
        return false;
    }

    template<class type>
    inline bool operator != (type & right) const
    {
        if (part[0] != right.part[0]
            || part[1] != right.part[1]
            || part[2] != right.part[2])
                return true;
        return false;
    };

    template<class type>
    inline bool operator == (type & right)
    {
        if (part[0] != right.part[0]
            || part[1] != right.part[1]
            || part[2] != right.part[2])
                return false;
        return true;
    };

    template<class type>
    inline bool operator == (type & right) const
    {
        if (part[0] != right.part[0]
            || part[1] != right.part[1]
            || part[2] != right.part[2])
                return false;
        return true;
    };

    template<class type>
    inline void operator = (type & right)
    {
        part[0] = right.part[0];
        part[1] = right.part[1];
        part[2] = right.part[2];
    };

    template<class type>
    inline flag96 operator & (type & right)
    {
        flag96 ret(part[0] & right.part[0], part[1] & right.part[1], part[2] & right.part[2]);
        return
            ret;
    };
    template<class type>
    inline flag96 operator & (type & right) const
    {
        flag96 ret(part[0] & right.part[0], part[1] & right.part[1], part[2] & right.part[2]);
        return
            ret;
    };

    template<class type>
    inline void operator &= (type & right)
    {
        *this = *this & right;
    };

    template<class type>
    inline flag96 operator | (type & right)
    {
        flag96 ret(part[0] | right.part[0], part[1] | right.part[1], part[2] | right.part[2]);
        return
            ret;
    };

    template<class type>
    inline flag96 operator | (type & right) const
    {
        flag96 ret(part[0] | right.part[0], part[1] | right.part[1], part[2] | right.part[2]);
        return
            ret;
    };

    template<class type>
    inline void operator |= (type & right)
    {
        *this = *this | right;
    };

    inline void operator ~ ()
    {
        part[2] =~ part[2];
        part[1] =~ part[1];
        part[0] =~ part[0];
    };

    template<class type>
    inline flag96 operator ^ (type & right)
    {
        flag96 ret(part[0] ^ right.part[0], part[1] ^ right.part[1], part[2] ^ right.part[2]);
        return
            ret;
    };

    template<class type>
    inline flag96 operator ^ (type & right) const
    {
        flag96 ret(part[0] ^ right.part[0], part[1] ^ right.part[1], part[2] ^ right.part[2]);
        return
            ret;
    };

    template<class type>
    inline void operator ^= (type & right)
    {
        *this = *this^right;
    };

    inline operator bool() const
    {
        return(
            part[0] != 0 ||
            part[1] != 0 ||
            part[2] != 0);
    };

    inline operator bool()
    {
        return(
            part[0] != 0 ||
            part[1] != 0 ||
            part[2] != 0);
    };

    inline bool operator ! () const
    {
        return(
            part[0] == 0 &&
            part[1] == 0 &&
            part[2] == 0);
    };

    inline bool operator ! ()
    {
        return(
            part[0] == 0 &&
            part[1] == 0 &&
            part[2] == 0);
    };

    inline uint32 & operator[](uint8 el)
    {
        return (part[el]);
    };

    inline const uint32 & operator[](uint8 el) const
    {
        return (part[el]);
    };
};

#endif
