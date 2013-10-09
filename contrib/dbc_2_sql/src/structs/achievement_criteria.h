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

#ifndef __ACHIEVEMENT_CRITERIA_H__
#define __ACHIEVEMENT_CRITERIA_H__

char const *ACHIEVEMENT_CRITERIA_DBC    = "Achievement_Criteria.dbc";
char const *ACHIEVEMENT_CRITERIA_SQL    = "Achievement_Criteria.sql";
char const *ACHIEVEMENT_CRITERIA_TABLE  = "Achievement_Criteria_dbc_dev";

#define ACHIEVEMENT_CRITERIA_DBC_CLIENT_BUILD   12340 // 3.3.5

#define ACHIEVEMENT_CRITERIA_DBC_COLUMN_NUMS    31
#define ACHIEVEMENT_CRITERIA_DBC_ROWS_NUMS      7655

char const *achievement_criteria_translation[ACHIEVEMENT_CRITERIA_DBC_COLUMN_NUMS][2] =
{
    {"uint32",  "Id"},                       // ID
    {"uint32",  "Achievement"},              // referredAchievement
    {"uint32",  "Type"},                     // requiredType
    {"uint32",  "AssetID"},
    {"uint32",  "Quantity"},
    {"uint32",  "StartEvent"},
    {"uint32",  "StartAsset"},
    {"uint32",  "FailEvent"},
    {"uint32",  "FailAsset"},
    {"char*",   "Description1"},             // name[0]
    {"char*",   "Description2"},             // name[1]
    {"char*",   "Description3"},             // name[2]
    {"char*",   "Description4"},             // name[3]
    {"char*",   "Description5"},             // name[4]
    {"char*",   "Description6"},             // name[5]
    {"char*",   "Description7"},             // name[6]
    {"char*",   "Description8"},             // name[7]
    {"char*",   "Description9"},             // name[8]
    {"char*",   "Description10"},            // name[9]
    {"char*",   "Description11"},            // name[10]
    {"char*",   "Description12"},            // name[11]
    {"char*",   "Description13"},            // name[12]
    {"char*",   "Description14"},            // name[13]
    {"char*",   "Description15"},            // name[14]
    {"char*",   "Description16"},            // name[15]
    {"uint32",  "UNK_1"},                    // 26
    {"uint32",  "Flags"},                    // name_flags
    {"uint32",  "TimerStartEvent"},          // completionFlag
    {"uint32",  "TimerAssetID"},          // groupFlag
    {"uint32",  "TimerAmount"},          // unk1
    {"uint32",  "UIOrder"},          // timeLimit
};

char const *ACHIEVEMENT_CRITERIA_TABLE_INDEX = achievement_criteria_translation[0][1];

#endif
