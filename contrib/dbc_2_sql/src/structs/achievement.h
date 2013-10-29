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

#ifndef __ACHIEVEMENT_H__
#define __ACHIEVEMENT_H__

char const *ACHIEVEMENT_DBC     = "Achievement.dbc";
char const *ACHIEVEMENT_SQL     = "achievement_dbc.sql";
char const *ACHIEVEMENT_TABLE   = "dbc_achievement";

#define ACHIEVEMENT_DBC_CLIENT_BUILD    12340 // 3.3.5

#define ACHIEVEMENT_DBC_COLUMN_NUMS     62
#define ACHIEVEMENT_DBC_ROWS_NUMS       1817

char const *achievement_translation[ACHIEVEMENT_DBC_COLUMN_NUMS][2] =
{
    {"uint32",  "id"},          // ID
    {"int32",  "1"},            // factionFlag
    {"int32",  "2"},            // mapID
    {"uint32",  "3"},           // parentAchievement
    {"char*",   "4"},           // name[0]
    {"char*",   "5"},           // name[1]
    {"char*",   "6"},           // name[2]
    {"char*",   "7"},           // name[3]
    {"char*",   "8"},           // name[4]
    {"char*",   "9"},           // name[5]
    {"char*",   "10"},          // name[6]
    {"char*",   "11"},          // name[7]
    {"char*",   "12"},          // name[8]
    {"char*",   "13"},          // name[9]
    {"char*",   "14"},          // name[10]
    {"char*",   "15"},          // name[11]
    {"char*",   "16"},          // name[12]
    {"char*",   "17"},          // name[13]
    {"char*",   "18"},          // name[14]
    {"char*",   "19"},          // name[15]
    {"uint32",  "20"},          // name_flags
    {"char*",   "21"},          // description[0]
    {"char*",   "22"},          // description[1]
    {"char*",   "23"},          // description[2]
    {"char*",   "24"},          // description[3]
    {"char*",   "25"},          // description[4]
    {"char*",   "26"},          // description[5]
    {"char*",   "27"},          // description[6]
    {"char*",   "28"},          // description[7]
    {"char*",   "29"},          // description[8]
    {"char*",   "30"},          // description[9]
    {"char*",   "31"},          // description[10]
    {"char*",   "32"},          // description[11]
    {"char*",   "33"},          // description[12]
    {"char*",   "34"},          // description[13]
    {"char*",   "35"},          // description[14]
    {"char*",   "36"},          // description[15]
    {"uint32",  "37"},          // desc_flags
    {"uint32",  "38"},          // categoryId
    {"uint32",  "39"},          // points
    {"uint32",  "40"},          // OrderInCategory
    {"uint32",  "41"},          // flags
    {"uint32",  "42"},          // icon
    {"char*",   "43"},          // titleReward[0]
    {"char*",   "44"},          // titleReward[1]
    {"char*",   "45"},          // titleReward[2]
    {"char*",   "46"},          // titleReward[3]
    {"char*",   "47"},          // titleReward[4]
    {"char*",   "48"},          // titleReward[5]
    {"char*",   "49"},          // titleReward[6]
    {"char*",   "50"},          // titleReward[7]
    {"char*",   "51"},          // titleReward[8]
    {"char*",   "52"},          // titleReward[9]
    {"char*",   "53"},          // titleReward[10]
    {"char*",   "54"},          // titleReward[11]
    {"char*",   "55"},          // titleReward[12]
    {"char*",   "56"},          // titleReward[13]
    {"char*",   "57"},          // titleReward[14]
    {"char*",   "58"},          // titleReward[15]
    {"int32",   "59"},           // titleReward_flags
    {"uint32",  "60"},          // count
    {"uint32",  "61"}           // refAchievement
};

char const *ACHIEVEMENT_TABLE_INDEX = achievement_translation[0][1];

#endif
