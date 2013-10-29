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

#ifndef __SPELL_RADIUS_H__
#define __SPELL_RADIUS_H__

char const* SPELLRADIUS_DBC   = "SpellRadius.dbc";
char const* SPELLRADIUS_SQL   = "SpellRadius.sql";
char const* SPELLRADIUS_TABLE = "Spell_Radius";

#define SPELLRADIUS_DBC_CLIENT_BUILD  12340 // 3.3.5

#define SPELLRADIUS_DBC_COLUMN_NUMS   4
#define SPELLRADIUS_DBC_ROWS_NUMS     58

// SpellRadius.dbc struct:
char const* spellradius_translation[ITEM_DBC_COLUMN_NUMS][2] =
{
    {"uint32",   "ID"},                                             // 0  ID
    {"float",   "Radius"},                                         // 1  RADIUS
    {"float",   "RadiusPerLevel"},                                 // 2  RADIUSPERLEVEL
    {"float",    "RadiusMax"},                                      // 3  FRIENDLY RADIUS
};

/*
Content

ID	 Radius
7	 2
8	 5
9	 20
10	 30
11	 45
12	 100
13	 10
14	 8
15	 3
16	 1
17	 13
18	 15
19	 18
20	 25
21	 35
22	 200
23	 40
24	 65
25	 70
26	 4

ID	 Radius
27	 50
28	 50000
29	 6
30	 500
31	 80
32	 12
33	 99
35	 55
36	 0
37	 7
38	 21
39	 34
40	 9
41	 150
42	 11
43	 16
44	 0,5
45	 10
46	 5
47	 15

ID	 Radius
48	 60
49	 90
50	 15
51	 60
52	 5
53	 60
54	 50000
55	 130
56	 38
57	 45
58	 50000
59	 32
60	 44
61	 14
62	 47
63	 23
64	 3,5
65	 80
*/

char const *SPELLRADIUS_TABLE_INDEX = spellradius_translation[0][1];

#endif
