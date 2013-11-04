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
#include "dbc/dbc.h"

DBCFileLoader::DBCFileLoader()
{
    data = NULL;
    stringTable = NULL;
}

DBCFileLoader::~DBCFileLoader()
{
    if(data)
       delete [] data;
}

bool DBCFileLoader::Load(char const *filename)
{
    FILE *pf = fopen(filename, "rb");
    if(!pf)
        return false;

    uint32 header;

    if(fread(&header, 4, 1, pf) != 1)
        return false;

    //if(header != WDBC_HEADER)
    //    return false;

    if(fread(&recordCount, 4, 1, pf) != 1) // Number of records
        return false;

    if(fread(&fieldCount, 4, 1, pf) != 1) // Number of fields
        return false;

    if(fread(&recordSize, 4, 1, pf) != 1) // Size of a record
        return false;

    if(fread(&stringSize, 4, 1, pf) != 1) // String size
        return false;

    data = new unsigned char[recordSize * recordCount + stringSize];
    stringTable = data + recordSize * recordCount;

    if(!data || !stringTable)
        return false;

    if(fread(data, recordSize * recordCount + stringSize , 1, pf) != 1)
        return false;

    fread(stringTable, stringSize, 1, pf);

    fclose(pf);
    return true;
}

DBCFileLoader::Record DBCFileLoader::getRecord(size_t id)
{
    assert(data);
    return Record(*this, data + id * recordSize);
}
