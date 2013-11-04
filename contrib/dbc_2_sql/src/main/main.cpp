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

#include <iostream>
#include <cstring>

#include "common/common.h"
#include "dbc/dbc.h"
#include "structs/spell.h"
#include "structs/item.h"
#include "structs/achievement.h"
#include "structs/achievement_category.h"
#include "structs/achievement_criteria.h"
#include "common/progressbar.h"

#define SQL_INSERTS_PER_QUERY   300

#define SLASH_BUFFER            2000

DBCFileLoader DBCSpell;
DBCFileLoader DBCItem;
DBCFileLoader DBCAchievement;
DBCFileLoader DBCAchievementCategory;
DBCFileLoader DBCAchievementCriteria;

bool check_dbc();
void dump_sql();

int main()
{
    std::cout << "*****************************************************************************\n";
    std::cout << "DBCtoSQL tool. Expected client build: " << EXPECTED_CLIENT_BUILT << "\n<";
    std::cout << "*****************************************************************************\n\n\n";

    std::cout << "Supported DBCs:\n";
    std::cout << "    Spell.dbc format:\n";
    std::cout << "        DBC columns numbers:        " << SPELL_DBC_COLUMN_NUMS << std::endl;
    std::cout << "        DBC rows numbers:           " << SPELL_DBC_ROWS_NUMS << std::endl;
    std::cout << "        DBC supported client build: " << SPELL_DBC_CLIENT_BUILD << "\n\n";
    std::cout << "    Item.dbc format:\n";
    std::cout << "        DBC columns numbers:        " << ITEM_DBC_COLUMN_NUMS << std::endl;
    std::cout << "        DBC rows numbers:           " << ITEM_DBC_ROWS_NUMS << std::endl;
    std::cout << "        DBC supported client build: " << ITEM_DBC_CLIENT_BUILD << "\n\n";
    std::cout << "    Achievement.dbc format:\n";
    std::cout << "        DBC columns numbers:        " << ACHIEVEMENT_DBC_COLUMN_NUMS << std::endl;
    std::cout << "        DBC rows numbers:           " << ACHIEVEMENT_DBC_ROWS_NUMS << std::endl;
    std::cout << "        DBC supported client build: " << ACHIEVEMENT_DBC_CLIENT_BUILD << "\n\n";
    std::cout << "    Achievement_Category.dbc format:\n";
    std::cout << "        DBC columns numbers:        " << ACHIEVEMENT_CATEGORY_DBC_COLUMN_NUMS << std::endl;
    std::cout << "        DBC rows numbers:           " << ACHIEVEMENT_CATEGORY_DBC_ROWS_NUMS << std::endl;
    std::cout << "        DBC supported client build: " << ACHIEVEMENT_CATEGORY_DBC_CLIENT_BUILD << "\n\n";
    std::cout << "    Achievement_Criteria.dbc format:\n";
    std::cout << "        DBC columns numbers:        " << ACHIEVEMENT_CRITERIA_DBC_COLUMN_NUMS << std::endl;
    std::cout << "        DBC rows numbers:           " << ACHIEVEMENT_CRITERIA_DBC_ROWS_NUMS << std::endl;
    std::cout << "        DBC supported client build: " << ACHIEVEMENT_CRITERIA_DBC_CLIENT_BUILD << "\n\n";

    DBCSpell.Load(SPELL_DBC);
    DBCItem.Load(ITEM_DBC);
    DBCAchievement.Load(ACHIEVEMENT_DBC);
    DBCAchievementCategory.Load(ACHIEVEMENT_CATEGORY_DBC);
    DBCAchievementCriteria.Load(ACHIEVEMENT_CRITERIA_DBC);

    if(check_dbc())
    {
        dump_sql();
        std::cout << "Ready. DBCs converted to SQLs.\n";
    }

    #ifdef WIN32
        std::cout << "\n\nPlease press Enter to exit...";
        getchar();
    #endif

    return 0;
}

bool check_dbc()
{
    /********** Spell.dbc **********/
    if(!DBCSpell.getNumFields())
    {
        std::cout << "ERROR: Can not open file: " << SPELL_DBC << std::endl;
        return false;
    }
    else
        std::cout << SPELL_DBC << " - Opened successful." << std::endl << SPELL_DBC << " - fields: "
        << DBCSpell.getNumFields() << ", rows: " << DBCSpell.getNumRows() << std::endl;

    if(DBCSpell.getNumFields() != SPELL_DBC_COLUMN_NUMS)
    {
        std::cout << SPELL_DBC << " - ERROR: Column numbers do not match with the supported DBC format." << std::endl;
        return false;
    }
    if(DBCSpell.getNumRows() != SPELL_DBC_ROWS_NUMS)
    {
        std::cout << SPELL_DBC << " - ERROR: Rows numbers do not match with the supported DBC format." << std::endl;
        return false;
    }
    std::cout << SPELL_DBC << " - DBC format: OK." << "\n\n";
    
    /********** Item.dbc **********/
    if(!DBCItem.getNumFields())
    {
        std::cout << "ERROR: Can not open file: " << ITEM_DBC << std::endl;
        return false;
    }
    else
        std::cout << ITEM_DBC << " - Opened successful." << std::endl << ITEM_DBC << " - fields: "
        << DBCItem.getNumFields() << ", rows: " << DBCItem.getNumRows() << std::endl;

    if(DBCItem.getNumFields() != ITEM_DBC_COLUMN_NUMS)
    {
        std::cout << ITEM_DBC << " - ERROR: Column numbers do not match with the supported DBC format." << std::endl;
        return false;
    }
    if(DBCItem.getNumRows() != ITEM_DBC_ROWS_NUMS)
    {
        std::cout << ITEM_DBC << " - ERROR: Rows numbers do not match with the supported DBC format." << std::endl;
        return false;
    }
    std::cout << ITEM_DBC << " - DBC format: OK." << "\n\n";

    /********** Achievement.dbc **********/
    if(!DBCAchievement.getNumFields())
    {
        std::cout << "ERROR: Can not open file: " << ACHIEVEMENT_DBC << std::endl;
        return false;
    }
    else
        std::cout << ACHIEVEMENT_DBC << " - Opened successful." << std::endl << ACHIEVEMENT_DBC << " - fields: "
        << DBCAchievement.getNumFields() << ", rows: " << DBCAchievement.getNumRows() << std::endl;

    if(DBCAchievement.getNumFields() != ACHIEVEMENT_DBC_COLUMN_NUMS)
    {
        std::cout << ACHIEVEMENT_DBC << " - ERROR: Column numbers do not match with the supported DBC format." << std::endl;
        return false;
    }
    if(DBCAchievement.getNumRows() != ACHIEVEMENT_DBC_ROWS_NUMS)
    {
        std::cout << ACHIEVEMENT_DBC << " - ERROR: Rows numbers do not match with the supported DBC format." << std::endl;
        return false;
    }
    std::cout << ACHIEVEMENT_DBC << " - DBC format: OK." << "\n\n";

    /********** Achievement_Category.dbc **********/                 
    if(!DBCAchievementCategory.getNumFields())
    {
        std::cout << "ERROR: Can not open file: " << ACHIEVEMENT_CATEGORY_DBC << std::endl;
        return false;
    }
    else
        std::cout << ACHIEVEMENT_CATEGORY_DBC << " - Opened successful." << std::endl << ACHIEVEMENT_CATEGORY_DBC << " - fields: "
        << DBCAchievementCategory.getNumFields() << ", rows: " << DBCAchievementCategory.getNumRows() << std::endl;

    if(DBCAchievementCategory.getNumFields() != ACHIEVEMENT_CATEGORY_DBC_COLUMN_NUMS)
    {
        std::cout << ACHIEVEMENT_CATEGORY_DBC << " - ERROR: Column numbers do not match with the supported DBC format." << std::endl;
        return false;
    }
    if(DBCAchievementCategory.getNumRows() != ACHIEVEMENT_CATEGORY_DBC_ROWS_NUMS)
    {
        std::cout << ACHIEVEMENT_CATEGORY_DBC << " - ERROR: Rows numbers do not match with the supported DBC format." << std::endl;
        return false;
    }
    std::cout << ACHIEVEMENT_CATEGORY_DBC << " - DBC format: OK." << "\n\n";     

    /********** Achievement_Criteria.dbc **********/       
    if(!DBCAchievementCriteria.getNumFields())
    {
        std::cout << "ERROR: Can not open file: " << ACHIEVEMENT_CRITERIA_DBC << std::endl;
        return false;
    }
    else
        std::cout << ACHIEVEMENT_CRITERIA_DBC << " - Opened successful." << std::endl << ACHIEVEMENT_CRITERIA_DBC << " - fields: "
        << DBCAchievementCriteria.getNumFields() << ", rows: " << DBCAchievementCriteria.getNumRows() << std::endl;

    if(DBCAchievementCriteria.getNumFields() != ACHIEVEMENT_CRITERIA_DBC_COLUMN_NUMS)
    {
        std::cout << ACHIEVEMENT_CRITERIA_DBC << " - ERROR: Column numbers do not match with the supported DBC format." << std::endl;
        return false;
    }
    if(DBCAchievementCriteria.getNumRows() != ACHIEVEMENT_CRITERIA_DBC_ROWS_NUMS)
    {
        std::cout << ACHIEVEMENT_CRITERIA_DBC << " - ERROR: Rows numbers do not match with the supported DBC format." << std::endl;
        return false;
    }
    std::cout << ACHIEVEMENT_CRITERIA_DBC << " - DBC format: OK." << "\n\n";  

    return true;
}

void dump_sql()
{
    /********** START: Spell.dbc **********/

    FILE *fSpellSql = fopen(SPELL_SQL, "w");
    if(!fSpellSql)
        return;

    std::cout << SPELL_DBC << " - Creating the SQL table struct...\n";

    fprintf(fSpellSql, "-- DBCtoSQL tool. Expected client build: %s\n\n", EXPECTED_CLIENT_BUILT);

    fprintf(fSpellSql, "DROP TABLE IF EXISTS `%s`;\n", SPELL_TABLE);
    fprintf(fSpellSql, "CREATE TABLE `%s` (\n", SPELL_TABLE);

    for(uint16 i = 0; i < SPELL_DBC_COLUMN_NUMS; i++)
    {
        if(!strcmp(spell_translation[i][0], "uint32"))
            fprintf(fSpellSql, "    `%s` INT (11) UNSIGNED DEFAULT '0' NOT NULL,\n", spell_translation[i][1]);
        else if(!strcmp(spell_translation[i][0], "int32"))
            fprintf(fSpellSql, "    `%s` INT (11) DEFAULT '0' NOT NULL,\n", spell_translation[i][1]);
        else if(!strcmp(spell_translation[i][0], "float"))
            fprintf(fSpellSql, "    `%s` FLOAT DEFAULT '0' NOT NULL,\n", spell_translation[i][1]);
        else if(!strcmp(spell_translation[i][0], "flag96"))
            fprintf(fSpellSql, "    `%s` INT (11) UNSIGNED DEFAULT '0' NOT NULL,\n", spell_translation[i][1]);
        else if(!strcmp(spell_translation[i][0], "char*"))
            fprintf(fSpellSql, "    `%s` VARCHAR(255),\n", spell_translation[i][1]);
        else if(!strcmp(spell_translation[i][0], "text"))
            fprintf(fSpellSql, "    `%s` TEXT,\n", spell_translation[i][1]);
        else
            fprintf(fSpellSql, "    ERROR: unknown column type: %s in column: %s\n", spell_translation[i][0], spell_translation[i][1]);
    }

    fprintf(fSpellSql, "    PRIMARY KEY(`%s`)\n", SPELL_TABLE_INDEX);
    fprintf(fSpellSql, ") ENGINE=MyISAM DEFAULT CHARSET=utf8;\n");

    fprintf(fSpellSql, "\n\n");

    std::cout << SPELL_DBC << " - DONE\n\n";

    // start dumping the data from the DBC

    std::cout << SPELL_DBC << " - Dumping data...\n";

    Bar ProgressSpell(DBCSpell.getNumRows());

    char tstrSpell[SLASH_BUFFER];

    for(uint32 j = 0; j < DBCSpell.getNumRows(); j++)
    {
        // new insert block
        if((j % SQL_INSERTS_PER_QUERY) == 0)
        {
            fprintf(fSpellSql, "\nINSERT INTO `%s` (", SPELL_TABLE);
            for(uint16 i = 0; i < SPELL_DBC_COLUMN_NUMS; i++)
            {
                fprintf(fSpellSql, "`%s`", spell_translation[i][1]);
                if(i != SPELL_DBC_COLUMN_NUMS - 1)
                    fprintf(fSpellSql, ",");
            }
            fprintf(fSpellSql, ") VALUES \n");
            fprintf(fSpellSql, "(");
        }
        else
            fprintf(fSpellSql, ",(");

        for(uint16 i = 0; i < SPELL_DBC_COLUMN_NUMS; i++)
        {
            if(!strcmp(spell_translation[i][0], "uint32"))
                fprintf(fSpellSql, "%lu", DBCSpell.getRecord(j).getUInt32(i));
            else if(!strcmp(spell_translation[i][0], "int32"))
                fprintf(fSpellSql, "%ld", DBCSpell.getRecord(j).getInt32(i));
            else if(!strcmp(spell_translation[i][0], "float"))
                fprintf(fSpellSql, "%f", DBCSpell.getRecord(j).getFloat(i));
            else if(!strcmp(spell_translation[i][0], "flag96"))
                fprintf(fSpellSql, "%lu", DBCSpell.getRecord(j).getUInt32(i));
            else if(!strcmp(spell_translation[i][0], "char*") || !strcmp(spell_translation[i][0], "text"))
            {
                const char *dstr = DBCSpell.getRecord(j).getString(i);
                uint16 otherindex = 0;
                for(uint16 k = 0; k <= strlen(dstr); k++)
                {
                    if(dstr[k] == '\'' || dstr[k] == '"')
                    {
                        tstrSpell[otherindex++] = '\\';
                        tstrSpell[otherindex++] = dstr[k];
                    }
                    else
                        tstrSpell[otherindex++] = dstr[k];
                }
                fprintf(fSpellSql, "\"%s\"", tstrSpell);
            }

            if(i != SPELL_DBC_COLUMN_NUMS - 1)
                fprintf(fSpellSql, ",");
        }

        // end of insert block
        if((( j + 1) % SQL_INSERTS_PER_QUERY) == 0)
            fprintf(fSpellSql, ");\n");
        else if(j == DBCSpell.getNumRows() - 1)
            fprintf(fSpellSql, ");\n");
        else
            fprintf(fSpellSql, ")\n");

        ProgressSpell.Step();
    }

    std::cout << std::endl << SPELL_DBC << " - DONE\n\n";

    fprintf(fSpellSql, "\n");
    fprintf(fSpellSql, "-- EOF\n");
    fflush(fSpellSql);
    fclose(fSpellSql);

    std::cout << SPELL_DBC << " - Closed\n\n";

    /********** END: Spell.dbc **********/
    
    /********** START: Item.dbc **********/

    FILE *fItemSql = fopen(ITEM_SQL, "w");
    if(!fItemSql)
        return;

    std::cout << ITEM_DBC << " - Creating the SQL table struct...\n";

    fprintf(fItemSql, "-- DBCtoSQL tool. Expected client build: %s\n\n", EXPECTED_CLIENT_BUILT);

    fprintf(fItemSql, "DROP TABLE IF EXISTS `%s`;\n", ITEM_TABLE);
    fprintf(fItemSql, "CREATE TABLE `%s` (\n", ITEM_TABLE);

    for(uint16 i = 0; i < ITEM_DBC_COLUMN_NUMS; i++)
    {
        if(!strcmp(item_translation[i][0], "uint32"))
            fprintf(fItemSql, "    `%s` INT (11) UNSIGNED DEFAULT '0' NOT NULL,\n", item_translation[i][1]);
        else if(!strcmp(item_translation[i][0], "int32"))
            fprintf(fItemSql, "    `%s` INT (11) DEFAULT '0' NOT NULL,\n", item_translation[i][1]);
        else if(!strcmp(item_translation[i][0], "float"))
            fprintf(fItemSql, "    `%s` FLOAT DEFAULT '0' NOT NULL,\n", item_translation[i][1]);
        else if(!strcmp(item_translation[i][0], "flag96"))
            fprintf(fItemSql, "    `%s` INT (11) UNSIGNED DEFAULT '0' NOT NULL,\n", item_translation[i][1]);
        else if(!strcmp(item_translation[i][0], "char*"))
            fprintf(fItemSql, "    `%s` VARCHAR(255),\n", item_translation[i][1]);
        else if(!strcmp(item_translation[i][0], "text"))
            fprintf(fItemSql, "    `%s` TEXT,\n", item_translation[i][1]);
        else
            fprintf(fItemSql, "    ERROR: unknown column type: %s in column: %s\n", item_translation[i][0], item_translation[i][1]);
    }

    fprintf(fItemSql, "    PRIMARY KEY(`%s`)\n", ITEM_TABLE_INDEX);
    fprintf(fItemSql, ") ENGINE=MyISAM DEFAULT CHARSET=utf8;\n");

    fprintf(fItemSql, "\n\n");

    std::cout << ITEM_DBC << " - DONE\n\n";

    // start dumping the data from the DBC

    std::cout << ITEM_DBC << " - Dumping data...\n";

    Bar ProgressItem(DBCItem.getNumRows());

    char tstrItem[SLASH_BUFFER];

    for(uint32 j = 0; j < DBCItem.getNumRows(); j++)
    {
        // new insert block
        if((j % SQL_INSERTS_PER_QUERY) == 0)
        {
            fprintf(fItemSql, "\nINSERT INTO `%s` (", ITEM_TABLE);
            for(uint16 i = 0; i < ITEM_DBC_COLUMN_NUMS; i++)
            {
                fprintf(fItemSql, "`%s`", item_translation[i][1]);
                if(i != ITEM_DBC_COLUMN_NUMS - 1)
                    fprintf(fItemSql, ",");
            }
            fprintf(fItemSql, ") VALUES \n");
            fprintf(fItemSql, "(");
        }
        else
            fprintf(fItemSql, ",(");

        for(uint16 i = 0; i < ITEM_DBC_COLUMN_NUMS; i++)
        {
            if(!strcmp(item_translation[i][0], "uint32"))
                fprintf(fItemSql, "%lu", DBCItem.getRecord(j).getUInt32(i));
            else if(!strcmp(item_translation[i][0], "int32"))
                fprintf(fItemSql, "%ld", DBCItem.getRecord(j).getInt32(i));
            else if(!strcmp(item_translation[i][0], "float"))
                fprintf(fItemSql, "%f", DBCItem.getRecord(j).getFloat(i));
            else if(!strcmp(item_translation[i][0], "flag96"))
                fprintf(fItemSql, "%lu", DBCItem.getRecord(j).getUInt32(i));
            else if(!strcmp(item_translation[i][0], "char*") || !strcmp(item_translation[i][0], "text"))
            {
                const char *dstr = DBCItem.getRecord(j).getString(i);
                uint16 otherindex = 0;
                for(uint16 k = 0; k <= strlen(dstr); k++)
                {
                    if(dstr[k] == '\'' || dstr[k] == '"')
                    {
                        tstrItem[otherindex++] = '\\';
                        tstrItem[otherindex++] = dstr[k];
                    }
                    else
                        tstrItem[otherindex++] = dstr[k];
                }
                fprintf(fItemSql, "\"%s\"", tstrItem);
            }

            if(i != ITEM_DBC_COLUMN_NUMS - 1)
                fprintf(fItemSql, ",");
        }

        // end of insert block
        if((( j + 1) % SQL_INSERTS_PER_QUERY) == 0)
            fprintf(fItemSql, ");\n");
        else if(j == DBCItem.getNumRows() - 1)
            fprintf(fItemSql, ");\n");
        else
            fprintf(fItemSql, ")\n");

        ProgressItem.Step();
    }

    std::cout << std::endl << ITEM_DBC << " - DONE\n\n";

    fprintf(fItemSql, "\n");
    fprintf(fItemSql, "-- EOF\n");
    fflush(fItemSql);
    fclose(fItemSql);

    std::cout << ITEM_DBC << " - Closed\n\n";

    /********** END: Item.dbc **********/

    /********** START: Achievement.dbc **********/

    FILE *fAchievementSql = fopen(ACHIEVEMENT_SQL, "w");
    if(!fAchievementSql)
        return;

    std::cout << ACHIEVEMENT_DBC << " - Creating the SQL table struct...\n";

    fprintf(fAchievementSql, "-- DBCtoSQL tool. Expected client build: %s\n\n", EXPECTED_CLIENT_BUILT);

    fprintf(fAchievementSql, "DROP TABLE IF EXISTS `%s`;\n", ACHIEVEMENT_TABLE);
    fprintf(fAchievementSql, "CREATE TABLE `%s` (\n", ACHIEVEMENT_TABLE);

    for(uint16 i = 0; i < ACHIEVEMENT_DBC_COLUMN_NUMS; i++)
    {
        if(!strcmp(achievement_translation[i][0], "uint32"))
            fprintf(fAchievementSql, "    `%s` INT (11) UNSIGNED DEFAULT '0' NOT NULL,\n", achievement_translation[i][1]);
        else if(!strcmp(achievement_translation[i][0], "int32"))
            fprintf(fAchievementSql, "    `%s` INT (11) DEFAULT '0' NOT NULL,\n", achievement_translation[i][1]);
        else if(!strcmp(achievement_translation[i][0], "float"))
            fprintf(fAchievementSql, "    `%s` FLOAT DEFAULT '0' NOT NULL,\n", achievement_translation[i][1]);
        else if(!strcmp(achievement_translation[i][0], "flag96"))
            fprintf(fAchievementSql, "    `%s` INT (11) UNSIGNED DEFAULT '0' NOT NULL,\n", achievement_translation[i][1]);
        else if(!strcmp(achievement_translation[i][0], "char*"))
            fprintf(fAchievementSql, "    `%s` TEXT,\n", achievement_translation[i][1]);
        else
            fprintf(fAchievementSql, "    ERROR: unknown column type: %s in column: %s\n", achievement_translation[i][0], achievement_translation[i][1]);
    }

    fprintf(fAchievementSql, "    PRIMARY KEY(`%s`)\n", ACHIEVEMENT_TABLE_INDEX);
    fprintf(fAchievementSql, ") ENGINE=MyISAM DEFAULT CHARSET=utf8;\n");

    fprintf(fAchievementSql, "\n\n");

    std::cout << ACHIEVEMENT_DBC << " - DONE\n\n";

    // start dumping the data from the DBC

    std::cout << ACHIEVEMENT_DBC << " - Dumping data...\n";

    Bar ProgressAchievement(DBCAchievement.getNumRows());

    char tstrAchievement[SLASH_BUFFER];

    for(uint32 j = 0; j < DBCAchievement.getNumRows(); j++)
    {
        // new insert block
        if((j % SQL_INSERTS_PER_QUERY) == 0)
        {
            fprintf(fAchievementSql, "\nINSERT INTO `%s` (", ACHIEVEMENT_TABLE);
            for(uint16 i = 0; i < ACHIEVEMENT_DBC_COLUMN_NUMS; i++)
            {
                fprintf(fAchievementSql, "`%s`", achievement_translation[i][1]);
                if(i != ACHIEVEMENT_DBC_COLUMN_NUMS - 1)
                    fprintf(fAchievementSql, ",");
            }
            fprintf(fAchievementSql, ") VALUES \n");
            fprintf(fAchievementSql, "(");
        }
        else
            fprintf(fAchievementSql, ",(");

        for(uint16 i = 0; i < ACHIEVEMENT_DBC_COLUMN_NUMS; i++)
        {
            if(!strcmp(achievement_translation[i][0], "uint32"))
                fprintf(fAchievementSql, "%lu", DBCAchievement.getRecord(j).getUInt32(i));
            else if(!strcmp(achievement_translation[i][0], "int32"))
                fprintf(fAchievementSql, "%ld", DBCAchievement.getRecord(j).getInt32(i));
            else if(!strcmp(achievement_translation[i][0], "float"))
                fprintf(fAchievementSql, "%f", DBCAchievement.getRecord(j).getFloat(i));
            else if(!strcmp(achievement_translation[i][0], "flag96"))
                fprintf(fAchievementSql, "%lu", DBCAchievement.getRecord(j).getUInt32(i));
            else if(!strcmp(achievement_translation[i][0], "char*"))
            {
                const char *dstr = DBCAchievement.getRecord(j).getString(i);
                uint16 otherindex = 0;
                for(uint16 k = 0; k <= strlen(dstr); k++)
                {
                    if(dstr[k] == '\'' || dstr[k] == '"')
                    {
                        tstrAchievement[otherindex++] = '\\';
                        tstrAchievement[otherindex++] = dstr[k];
                    }
                    else
                        tstrAchievement[otherindex++] = dstr[k];
                }
                fprintf(fAchievementSql, "\"%s\"", tstrAchievement);
            }

            if(i != ACHIEVEMENT_DBC_COLUMN_NUMS - 1)
                fprintf(fAchievementSql, ",");
        }

        // end of insert block
        if((( j + 1) % SQL_INSERTS_PER_QUERY) == 0)
            fprintf(fAchievementSql, ");\n");
        else if(j == DBCAchievement.getNumRows() - 1)
            fprintf(fAchievementSql, ");\n");
        else
            fprintf(fAchievementSql, ")\n");

        ProgressAchievement.Step();
    }

    std::cout << std::endl << ACHIEVEMENT_DBC << " - DONE\n\n";

    fprintf(fAchievementSql, "\n");
    fprintf(fAchievementSql, "-- EOF\n");
    fflush(fAchievementSql);
    fclose(fAchievementSql);

    std::cout << ACHIEVEMENT_DBC << " - Closed\n\n";

    /********** END: Achievement.dbc **********/

    /********** START: Achievement_Category.dbc **********/

    FILE *fAchievementCategorySql = fopen(ACHIEVEMENT_CATEGORY_SQL, "w");
    if(!fAchievementCategorySql)
        return;

    std::cout << ACHIEVEMENT_CATEGORY_DBC << " - Creating the SQL table struct...\n";

    fprintf(fAchievementCategorySql, "-- DBCtoSQL tool. Expected client build: %s\n\n", EXPECTED_CLIENT_BUILT);

    fprintf(fAchievementCategorySql, "DROP TABLE IF EXISTS `%s`;\n", ACHIEVEMENT_CATEGORY_TABLE);
    fprintf(fAchievementCategorySql, "CREATE TABLE `%s` (\n", ACHIEVEMENT_CATEGORY_TABLE);

    for(uint16 i = 0; i < ACHIEVEMENT_CATEGORY_DBC_COLUMN_NUMS; i++)
    {
        if(!strcmp(achievement_category_translation[i][0], "uint32"))
            fprintf(fAchievementCategorySql, "    `%s` INT (11) UNSIGNED DEFAULT '0' NOT NULL,\n", achievement_category_translation[i][1]);
        else if(!strcmp(achievement_category_translation[i][0], "int32"))
            fprintf(fAchievementCategorySql, "    `%s` INT (11) DEFAULT '0' NOT NULL,\n", achievement_category_translation[i][1]);
        else if(!strcmp(achievement_category_translation[i][0], "float"))
            fprintf(fAchievementCategorySql, "    `%s` FLOAT DEFAULT '0' NOT NULL,\n", achievement_category_translation[i][1]);
        else if(!strcmp(achievement_category_translation[i][0], "flag96"))
            fprintf(fAchievementCategorySql, "    `%s` INT (11) UNSIGNED DEFAULT '0' NOT NULL,\n", achievement_category_translation[i][1]);
        else if(!strcmp(achievement_category_translation[i][0], "char*"))
            fprintf(fAchievementCategorySql, "    `%s` TEXT,\n", achievement_category_translation[i][1]);
        else
            fprintf(fAchievementCategorySql, "    ERROR: unknown column type: %s in column: %s\n", achievement_category_translation[i][0], achievement_category_translation[i][1]);
    }

    fprintf(fAchievementCategorySql, "    PRIMARY KEY(`%s`)\n", ACHIEVEMENT_CATEGORY_TABLE_INDEX);
    fprintf(fAchievementCategorySql, ") ENGINE=MyISAM DEFAULT CHARSET=utf8;\n");

    fprintf(fAchievementCategorySql, "\n\n");

    std::cout << ACHIEVEMENT_CATEGORY_DBC << " - DONE\n\n";

    // start dumping the data from the DBC

    std::cout << ACHIEVEMENT_CATEGORY_DBC << " - Dumping data...\n";

    Bar ProgressAclhievementCategory(DBCAchievementCategory.getNumRows());

    char tstrAclhievementCategory[SLASH_BUFFER];

    for(uint32 j = 0; j < DBCAchievementCategory.getNumRows(); j++)
    {
        // new insert block
        if((j % SQL_INSERTS_PER_QUERY) == 0)
        {
            fprintf(fAchievementCategorySql, "\nINSERT INTO `%s` (", ACHIEVEMENT_CATEGORY_TABLE);
            for(uint16 i = 0; i < ACHIEVEMENT_CATEGORY_DBC_COLUMN_NUMS; i++)
            {
                fprintf(fAchievementCategorySql, "`%s`", achievement_category_translation[i][1]);
                if(i != ACHIEVEMENT_CATEGORY_DBC_COLUMN_NUMS - 1)
                    fprintf(fAchievementCategorySql, ",");
            }
            fprintf(fAchievementCategorySql, ") VALUES \n");
            fprintf(fAchievementCategorySql, "(");
        }
        else
            fprintf(fAchievementCategorySql, ",(");

        for(uint16 i = 0; i < ACHIEVEMENT_CATEGORY_DBC_COLUMN_NUMS; i++)
        {
            if(!strcmp(achievement_category_translation[i][0], "uint32"))
                fprintf(fAchievementCategorySql, "%lu", DBCAchievementCategory.getRecord(j).getUInt32(i));
            else if(!strcmp(achievement_category_translation[i][0], "int32"))
                fprintf(fAchievementCategorySql, "%ld", DBCAchievementCategory.getRecord(j).getInt32(i));
            else if(!strcmp(achievement_category_translation[i][0], "float"))
                fprintf(fAchievementCategorySql, "%f", DBCAchievementCategory.getRecord(j).getFloat(i));
            else if(!strcmp(achievement_category_translation[i][0], "flag96"))
                fprintf(fAchievementCategorySql, "%lu", DBCAchievementCategory.getRecord(j).getUInt32(i));
            else if(!strcmp(achievement_category_translation[i][0], "char*"))
            {
                const char *dstr = DBCAchievementCategory.getRecord(j).getString(i);
                uint16 otherindex = 0;
                for(uint16 k = 0; k <= strlen(dstr); k++)
                {
                    if(dstr[k] == '\'' || dstr[k] == '"')
                    {
                        tstrAclhievementCategory[otherindex++] = '\\';
                        tstrAclhievementCategory[otherindex++] = dstr[k];
                    }
                    else
                        tstrAclhievementCategory[otherindex++] = dstr[k];
                }
                fprintf(fAchievementCategorySql, "\"%s\"", tstrAclhievementCategory);
            }

            if(i != ACHIEVEMENT_CATEGORY_DBC_COLUMN_NUMS - 1)
                fprintf(fAchievementCategorySql, ",");
        }

        // end of insert block
        if((( j + 1) % SQL_INSERTS_PER_QUERY) == 0)
            fprintf(fAchievementCategorySql, ");\n");
        else if(j == DBCAchievementCategory.getNumRows() - 1)
            fprintf(fAchievementCategorySql, ");\n");
        else
            fprintf(fAchievementCategorySql, ")\n");

        ProgressAclhievementCategory.Step();
    }

    std::cout << std::endl << ACHIEVEMENT_CATEGORY_DBC << " - DONE\n\n";

    fprintf(fAchievementCategorySql, "\n");
    fprintf(fAchievementCategorySql, "-- EOF\n");
    fflush(fAchievementCategorySql);
    fclose(fAchievementCategorySql);

    std::cout << ACHIEVEMENT_CATEGORY_DBC << " - Closed\n\n"; 

    /********** END: Achievement_Category.dbc **********/

    /********** START: Achievement_Criteria.dbc **********/

    FILE *fAchievementCriteriaSql = fopen(ACHIEVEMENT_CRITERIA_SQL, "w");
    if(!fAchievementCriteriaSql)
        return;

    std::cout << ACHIEVEMENT_CRITERIA_DBC << " - Creating the SQL table struct...\n";

    fprintf(fAchievementCriteriaSql, "-- DBCtoSQL tool. Expected client build: %s\n\n", EXPECTED_CLIENT_BUILT);

    fprintf(fAchievementCriteriaSql, "DROP TABLE IF EXISTS `%s`;\n", ACHIEVEMENT_CRITERIA_TABLE);
    fprintf(fAchievementCriteriaSql, "CREATE TABLE `%s` (\n", ACHIEVEMENT_CRITERIA_TABLE);

    for(uint16 i = 0; i < ACHIEVEMENT_CRITERIA_DBC_COLUMN_NUMS; i++)
    {
        if(!strcmp(achievement_criteria_translation[i][0], "uint32"))
            fprintf(fAchievementCriteriaSql, "    `%s` INT (11) UNSIGNED DEFAULT '0' NOT NULL,\n", achievement_criteria_translation[i][1]);
        else if(!strcmp(achievement_criteria_translation[i][0], "int32"))
            fprintf(fAchievementCriteriaSql, "    `%s` INT (11) DEFAULT '0' NOT NULL,\n", achievement_criteria_translation[i][1]);
        else if(!strcmp(achievement_criteria_translation[i][0], "float"))
            fprintf(fAchievementCriteriaSql, "    `%s` FLOAT DEFAULT '0' NOT NULL,\n", achievement_criteria_translation[i][1]);
        else if(!strcmp(achievement_criteria_translation[i][0], "flag96"))
            fprintf(fAchievementCriteriaSql, "    `%s` INT (11) UNSIGNED DEFAULT '0' NOT NULL,\n", achievement_criteria_translation[i][1]);
        else if(!strcmp(achievement_criteria_translation[i][0], "char*"))
            fprintf(fAchievementCriteriaSql, "    `%s` TEXT,\n", achievement_criteria_translation[i][1]);
        else
            fprintf(fAchievementCriteriaSql, "    ERROR: unknown column type: %s in column: %s\n", achievement_criteria_translation[i][0], achievement_criteria_translation[i][1]);
    }

    fprintf(fAchievementCriteriaSql, "    PRIMARY KEY(`%s`)\n", ACHIEVEMENT_CRITERIA_TABLE_INDEX);
    fprintf(fAchievementCriteriaSql, ") ENGINE=MyISAM DEFAULT CHARSET=utf8;\n");

    fprintf(fAchievementCriteriaSql, "\n\n");

    std::cout << ACHIEVEMENT_CRITERIA_DBC << " - DONE\n\n";

    // start dumping the data from the DBC

    std::cout << ACHIEVEMENT_CRITERIA_DBC << " - Dumping data...\n";

    Bar ProgressAchievementCriteria(DBCAchievementCriteria.getNumRows());

    char tstrAchievementCriteria[SLASH_BUFFER];

    for(uint32 j = 0; j < DBCAchievementCriteria.getNumRows(); j++)
    {
        // new insert block
        if((j % SQL_INSERTS_PER_QUERY) == 0)
        {
            fprintf(fAchievementCriteriaSql, "\nINSERT INTO `%s` (", ACHIEVEMENT_CRITERIA_TABLE);
            for(uint16 i = 0; i < ACHIEVEMENT_CRITERIA_DBC_COLUMN_NUMS; i++)
            {
                fprintf(fAchievementCriteriaSql, "`%s`", achievement_criteria_translation[i][1]);
                if(i != ACHIEVEMENT_CRITERIA_DBC_COLUMN_NUMS - 1)
                    fprintf(fAchievementCriteriaSql, ",");
            }
            fprintf(fAchievementCriteriaSql, ") VALUES \n");
            fprintf(fAchievementCriteriaSql, "(");
        }
        else
            fprintf(fAchievementCriteriaSql, ",(");

        for(uint16 i = 0; i < ACHIEVEMENT_CRITERIA_DBC_COLUMN_NUMS; i++)
        {
            if(!strcmp(achievement_criteria_translation[i][0], "uint32"))
                fprintf(fAchievementCriteriaSql, "%lu", DBCAchievementCriteria.getRecord(j).getUInt32(i));
            else if(!strcmp(achievement_criteria_translation[i][0], "int32"))
                fprintf(fAchievementCriteriaSql, "%ld", DBCAchievementCriteria.getRecord(j).getInt32(i));
            else if(!strcmp(achievement_criteria_translation[i][0], "float"))
                fprintf(fAchievementCriteriaSql, "%f", DBCAchievementCriteria.getRecord(j).getFloat(i));
            else if(!strcmp(achievement_criteria_translation[i][0], "flag96"))
                fprintf(fAchievementCriteriaSql, "%lu", DBCAchievementCriteria.getRecord(j).getUInt32(i));
            else if(!strcmp(achievement_criteria_translation[i][0], "char*"))
            {
                const char *dstr = DBCAchievementCriteria.getRecord(j).getString(i);
                uint16 otherindex = 0;
                for(uint16 k = 0; k <= strlen(dstr); k++)
                {
                    if(dstr[k] == '\'' || dstr[k] == '"')
                    {
                        tstrAchievementCriteria[otherindex++] = '\\';
                        tstrAchievementCriteria[otherindex++] = dstr[k];
                    }
                    else
                        tstrAchievementCriteria[otherindex++] = dstr[k];
                }
                fprintf(fAchievementCriteriaSql, "\"%s\"", tstrAchievementCriteria);
            }

            if(i != ACHIEVEMENT_CRITERIA_DBC_COLUMN_NUMS - 1)
                fprintf(fAchievementCriteriaSql, ",");
        }

        // end of insert block
        if((( j + 1) % SQL_INSERTS_PER_QUERY) == 0)
            fprintf(fAchievementCriteriaSql, ");\n");
        else if(j == DBCAchievementCriteria.getNumRows() - 1)
            fprintf(fAchievementCriteriaSql, ");\n");
        else
            fprintf(fAchievementCriteriaSql, ")\n");

        ProgressAchievementCriteria.Step();
    }

    std::cout << std::endl << ACHIEVEMENT_CRITERIA_DBC << " - DONE\n\n";

    fprintf(fAchievementCriteriaSql, "\n");
    fprintf(fAchievementCriteriaSql, "-- EOF\n");
    fflush(fAchievementCriteriaSql);
    fclose(fAchievementCriteriaSql);

    std::cout << ACHIEVEMENT_CRITERIA_DBC << " - Closed\n\n"; 

    /********** END: Achievement_Criteria.dbc **********/
}
