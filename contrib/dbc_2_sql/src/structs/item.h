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

#ifndef __ITEM_H__
#define __ITEM_H__

char const *ITEM_DBC   = "Item.dbc";
char const *ITEM_SQL   = "item.sql";
char const *ITEM_TABLE = "item_template";

#define ITEM_DBC_CLIENT_BUILD  12340 // 3.3.5

#define ITEM_DBC_COLUMN_NUMS   8
#define ITEM_DBC_ROWS_NUMS     46096

// Item.dbc struct: MaNGOS 10120
char const *item_translation[ITEM_DBC_COLUMN_NUMS][2] =
{
    {"uint32",   "entry"},                                             // 0
    {"uint32",   "class"},                                          // 1
    {"uint32",   "subclass"},                                       // 2 some items have strange subclasses
    {"int32",    "unk0"},                                           // 3
    {"int32",    "Material"},                                       // 4
    {"uint32",   "displayid"},                                      // 5
    {"uint32",   "InventoryType"},                                  // 6
    {"uint32",   "sheath"}                                          // 7
};

char const *ITEM_TABLE_INDEX = item_translation[0][1];

#endif
