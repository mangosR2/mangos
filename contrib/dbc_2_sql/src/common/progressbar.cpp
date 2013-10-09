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

#include <cstdio>
#include "progressbar.h"

char const *Bar::empty = " ";
#ifdef WIN32
    char const *Bar::full  = "\x3D";
#else
    char const *Bar::full  = "*";
#endif

Bar::~Bar()
{
    printf("\n");
    fflush(stdout);
}

Bar::Bar(uint32 row_count)
{
    rec_no = 0;
    rec_pos = 0;
    indic_len = 50;
    num_rec = row_count;

    #ifdef WIN32
        printf("\x3D");
    #else
        printf("[");
    #endif

    for(uint8 i = 0; i < indic_len; i++)
        printf("%s", empty);

    #ifdef WIN32
        printf("\x3D 0%%\r\x3D");
    #else
        printf("] 0%%\r[");
    #endif

    fflush(stdout);
}

void Bar::Step()
{
    uint32 i, n;

    if(num_rec == 0)
        return;

    rec_no++;

    n = rec_no * indic_len / num_rec;

    if(n != rec_pos)
    {
        #ifdef WIN32
            printf("\r\x3D");
        #else
            printf("\r[");
        #endif

        for(i = 0; i < n; i++)
            printf("%s", full);

        for(; i < indic_len; i++)
            printf("%s", empty);

        float percent = (((float)n / (float)indic_len) * 100);

        #ifdef WIN32
            printf("\x3D %i%%  \r\x3D", (uint16)percent);
        #else
            printf("] %i%%  \r[", (uint16)percent);
        #endif

        fflush(stdout);

        rec_pos = n;
    }
}
