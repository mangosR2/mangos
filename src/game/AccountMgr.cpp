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

#include "AccountMgr.h"
#include "Database/DatabaseEnv.h"
#include "ObjectAccessor.h"
#include "ObjectGuid.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "World.h"
#include "Policies/SingletonImp.h"
#include "Util.h"
#include "Auth/Sha1.h"

extern DatabaseType LoginDatabase;

INSTANTIATE_SINGLETON_1(AccountMgr);

AccountMgr::AccountMgr()
{
    mPlayerDataCacheMap.clear();
    mRAFLinkedMap.clear();
}

AccountMgr::~AccountMgr()
{}

AccountOpResult AccountMgr::CreateAccount(std::string username, std::string password)
{
    if (utf8length(username) > MAX_ACCOUNT_STR)
        return AOR_NAME_TOO_LONG;                           // username's too long

    normalizeString(username);
    normalizeString(password);

    if (GetId(username))
    {
        return AOR_NAME_ALREDY_EXIST;                       // username does already exist
    }

    if (!LoginDatabase.PExecute("INSERT INTO account(username,sha_pass_hash,joindate) VALUES('%s','%s',NOW())", username.c_str(), CalculateShaPassHash(username, password).c_str()))
        return AOR_DB_INTERNAL_ERROR;                       // unexpected error
    LoginDatabase.Execute("INSERT INTO realmcharacters (realmid, acctid, numchars) SELECT realmlist.id, account.id, 0 FROM realmlist,account LEFT JOIN realmcharacters ON acctid=account.id WHERE acctid IS NULL");

    return AOR_OK;                                          // everything's fine
}

AccountOpResult AccountMgr::DeleteAccount(uint32 accid)
{
    QueryResult* result = LoginDatabase.PQuery("SELECT 1 FROM account WHERE id='%u'", accid);
    if (!result)
        return AOR_NAME_NOT_EXIST;                          // account doesn't exist
    delete result;

    // existing characters list
    result = CharacterDatabase.PQuery("SELECT guid FROM characters WHERE account='%u'", accid);
    if (result)
    {
        do
        {
            Field* fields = result->Fetch();
            uint32 guidlo = fields[0].GetUInt32();
            ObjectGuid guid = ObjectGuid(HIGHGUID_PLAYER, guidlo);

            // kick if player currently
            ObjectAccessor::KickPlayer(guid);
            Player::DeleteFromDB(guid, accid, false);       // no need to update realm characters
        }
        while (result->NextRow());

        delete result;
    }

    // table realm specific but common for all characters of account for realm
    CharacterDatabase.PExecute("DELETE FROM character_tutorial WHERE account = '%u'", accid);

    LoginDatabase.BeginTransaction();

    bool res =
        LoginDatabase.PExecute("DELETE FROM account WHERE id='%u'", accid) &&
        LoginDatabase.PExecute("DELETE FROM account_access WHERE id ='%d'", accid) &&
        LoginDatabase.PExecute("DELETE FROM realmcharacters WHERE acctid='%u'", accid);

    LoginDatabase.CommitTransaction();

    if (!res)
        return AOR_DB_INTERNAL_ERROR;                       // unexpected error;

    return AOR_OK;
}

AccountOpResult AccountMgr::ChangeUsername(uint32 accid, std::string new_uname, std::string new_passwd)
{
    QueryResult* result = LoginDatabase.PQuery("SELECT 1 FROM account WHERE id='%u'", accid);
    if (!result)
        return AOR_NAME_NOT_EXIST;                          // account doesn't exist
    delete result;

    if (utf8length(new_uname) > MAX_ACCOUNT_STR)
        return AOR_NAME_TOO_LONG;

    if (utf8length(new_passwd) > MAX_ACCOUNT_STR)
        return AOR_PASS_TOO_LONG;

    normalizeString(new_uname);
    normalizeString(new_passwd);

    std::string safe_new_uname = new_uname;
    LoginDatabase.escape_string(safe_new_uname);

    if (!LoginDatabase.PExecute("UPDATE account SET v='0',s='0',username='%s',sha_pass_hash='%s' WHERE id='%u'", safe_new_uname.c_str(),
                                CalculateShaPassHash(new_uname, new_passwd).c_str(), accid))
        return AOR_DB_INTERNAL_ERROR;                       // unexpected error

    return AOR_OK;
}

AccountOpResult AccountMgr::ChangePassword(uint32 accid, std::string new_passwd)
{
    std::string username;

    if (!GetName(accid, username))
        return AOR_NAME_NOT_EXIST;                          // account doesn't exist

    if (utf8length(new_passwd) > MAX_ACCOUNT_STR)
        return AOR_PASS_TOO_LONG;

    normalizeString(new_passwd);

    // also reset s and v to force update at next realmd login
    if (!LoginDatabase.PExecute("UPDATE account SET v='0', s='0', sha_pass_hash='%s' WHERE id='%u'",
                                CalculateShaPassHash(username, new_passwd).c_str(), accid))
        return AOR_DB_INTERNAL_ERROR;                       // unexpected error

    return AOR_OK;
}

uint32 AccountMgr::GetId(std::string username)
{
    LoginDatabase.escape_string(username);
    QueryResult* result = LoginDatabase.PQuery("SELECT id FROM account WHERE username = '%s'", username.c_str());
    if (!result)
        return 0;
    else
    {
        uint32 id = (*result)[0].GetUInt32();
        delete result;
        return id;
    }
}

AccountTypes AccountMgr::GetSecurity(uint32 acc_id)
{
    QueryResult* result = LoginDatabase.PQuery("SELECT `gmlevel` FROM `account_access` WHERE `id` = '%u' AND (`RealmID` = '%u' OR `RealmID` = -1)", acc_id, realmID);
    if (result)
    {
        AccountTypes sec = AccountTypes((*result)[0].GetInt32());
        delete result;
        return sec;
    }

    return SEC_PLAYER;
}

bool AccountMgr::GetName(uint32 acc_id, std::string& name)
{
    QueryResult* result = LoginDatabase.PQuery("SELECT username FROM account WHERE id = '%u'", acc_id);
    if (result)
    {
        name = (*result)[0].GetCppString();
        delete result;
        return true;
    }

    return false;
}

uint32 AccountMgr::GetCharactersCount(uint32 acc_id)
{
    // check character count
    QueryResult* result = CharacterDatabase.PQuery("SELECT COUNT(guid) FROM characters WHERE account = '%u'", acc_id);
    if (result)
    {
        Field* fields = result->Fetch();
        uint32 charcount = fields[0].GetUInt32();
        delete result;
        return charcount;
    }
    else
        return 0;
}

bool AccountMgr::CheckPassword(uint32 accid, std::string passwd)
{
    std::string username;
    if (!GetName(accid, username))
        return false;

    normalizeString(passwd);

    QueryResult* result = LoginDatabase.PQuery("SELECT 1 FROM account WHERE id='%u' AND sha_pass_hash='%s'", accid, CalculateShaPassHash(username, passwd).c_str());
    if (result)
    {
        delete result;
        return true;
    }

    return false;
}

bool AccountMgr::normalizeString(std::string& utf8str)
{
    wchar_t wstr_buf[MAX_ACCOUNT_STR + 1];

    size_t wstr_len = MAX_ACCOUNT_STR;
    if (!Utf8toWStr(utf8str, wstr_buf, wstr_len))
        return false;

    std::transform(&wstr_buf[0], wstr_buf + wstr_len, &wstr_buf[0], wcharToUpperOnlyLatin);

    return WStrToUtf8(wstr_buf, wstr_len, utf8str);
}

std::string AccountMgr::CalculateShaPassHash(std::string& name, std::string& password)
{
    Sha1Hash sha;
    sha.Initialize();
    sha.UpdateData(name);
    sha.UpdateData(":");
    sha.UpdateData(password);
    sha.Finalize();

    std::string encoded;
    hexEncodeByteArray(sha.GetDigest(), sha.GetLength(), encoded);

    return encoded;
}

RafLinkedList* AccountMgr::GetRAFAccounts(uint32 accid, bool referred)
{

    RafLinkedMap::iterator itr = mRAFLinkedMap.find(std::pair<uint32,bool>(accid, referred));
    if (itr == mRAFLinkedMap.end())
    {
        QueryResult* result;

        if (referred)
            result = LoginDatabase.PQuery("SELECT `friend_id` FROM `account_friends` WHERE `id` = %u AND `expire_date` > NOW() LIMIT %u", accid, sWorld.getConfig(CONFIG_UINT32_RAF_MAXREFERERS));
        else
            result = LoginDatabase.PQuery("SELECT `id` FROM `account_friends` WHERE `friend_id` = %u AND `expire_date` > NOW() LIMIT %u", accid, sWorld.getConfig(CONFIG_UINT32_RAF_MAXREFERALS));

        RafLinkedList acclist;

        if (result)
        {
            do
            {
                Field* fields = result->Fetch();
                uint32 refaccid = fields[0].GetUInt32();
                acclist.push_back(refaccid);
            }
            while (result->NextRow());
            delete result;
        }
        ReadGuard Guard(GetLock());
        mRAFLinkedMap.insert(RafLinkedMap::value_type(std::pair<uint32,bool>(accid, referred), acclist));
        itr = mRAFLinkedMap.find(std::pair<uint32,bool>(accid, referred));
    }

    return &itr->second;
}

AccountOpResult AccountMgr::AddRAFLink(uint32 accid, uint32 friendid)
{
    if (!LoginDatabase.PExecute("INSERT INTO `account_friends`  (`id`, `friend_id`, `expire_date`) VALUES (%u,%u,NOW() + INTERVAL 3 MONTH)", accid, friendid))
        return AOR_DB_INTERNAL_ERROR;

    RafLinkedList* referred = GetRAFAccounts(accid, true);
    if (referred)
        referred->push_back(friendid);

    RafLinkedList* referal = GetRAFAccounts(friendid, false);
    if (referal)
        referal->push_back(accid);

    return AOR_OK;
}

AccountOpResult AccountMgr::DeleteRAFLink(uint32 accid, uint32 friendid)
{
    if (!LoginDatabase.PExecute("DELETE FROM `account_friends` WHERE `id` = %u AND `friend_id` = %u", accid, friendid))
        return AOR_DB_INTERNAL_ERROR;

    RafLinkedList* referred = GetRAFAccounts(accid, true);
    if (referred)
    {
        for (RafLinkedList::iterator itr1 = referred->begin(); itr1 != referred->end();)
        {
            if (*itr1 == accid)
                itr1 = referred->erase(itr1);
            else
                ++itr1;
        }
    }

    RafLinkedList* referal = GetRAFAccounts(friendid, false);
    if (referal)
    {
        for (RafLinkedList::iterator itr1 = referal->begin(); itr1 != referal->end();)
        {
            if (*itr1 == friendid)
                itr1 = referal->erase(itr1);
            else
                ++itr1;
        }
    }

    return AOR_OK;
}

// name must be checked to correctness (if received) before call this function
ObjectGuid AccountMgr::GetPlayerGuidByName(std::string name)
{
    ObjectGuid guid;

    PlayerDataCache const* cache = GetPlayerDataCache(name);
    if (cache)
    {
        guid = ObjectGuid(HIGHGUID_PLAYER, cache->lowguid);
    }

    return guid;
}

bool AccountMgr::GetPlayerNameByGUID(ObjectGuid guid, std::string& name)
{
    PlayerDataCache const* cache = GetPlayerDataCache(guid);
    if (cache)
    {
        name = cache->name;
        return true;
    }

    return false;
}

Team AccountMgr::GetPlayerTeamByGUID(ObjectGuid guid)
{
    PlayerDataCache const* cache = GetPlayerDataCache(guid);
    if (cache)
        return Player::TeamForRace(cache->race);

    return TEAM_NONE;
}

uint32 AccountMgr::GetPlayerAccountIdByGUID(ObjectGuid guid)
{
    if (!guid.IsPlayer())
        return 0;

    PlayerDataCache const* cache = GetPlayerDataCache(guid);
    if (cache)
        return cache->account;

    return 0;
}

uint32 AccountMgr::GetPlayerAccountIdByPlayerName(const std::string& name)
{
    PlayerDataCache const* cache = GetPlayerDataCache(name);
    if (cache)
        return cache->account;

    return 0;
}

void AccountMgr::ClearPlayerDataCache(ObjectGuid guid)
{
    if (!guid || !guid.IsPlayer())
        return;

    PlayerDataCache const* cache = GetPlayerDataCache(guid, false);

    if (cache)
    {
        uint32 accId = cache->account;

        WriteGuard Guard(GetLock());
        PlayerDataCacheMap::iterator itr = mPlayerDataCacheMap.find(guid);
        if (itr != mPlayerDataCacheMap.end())
            mPlayerDataCacheMap.erase(itr);

        RafLinkedMap::iterator itr1 = mRAFLinkedMap.find(std::pair<uint32,bool>(accId, true));
        if (itr1 != mRAFLinkedMap.end())
            mRAFLinkedMap.erase(itr1);
        itr1 = mRAFLinkedMap.find(std::pair<uint32,bool>(accId, false));
        if (itr1 != mRAFLinkedMap.end())
            mRAFLinkedMap.erase(itr1);
    }

}

void AccountMgr::MakePlayerDataCache(Player* player)
{
    if (!player || !player->GetSession())
        return;

    ObjectGuid guid = player->GetObjectGuid();

    WriteGuard Guard(GetLock());

    PlayerDataCache cache;
    cache.account  = player->GetSession()->GetAccountId();;
    cache.lowguid  = guid.GetCounter();
    cache.race     = player->getRace();
    cache.name     = player->GetName();

    mPlayerDataCacheMap.insert(PlayerDataCacheMap::value_type(guid, cache));
}

PlayerDataCache const* AccountMgr::GetPlayerDataCache(ObjectGuid guid, bool force)
{
    PlayerDataCacheMap::const_iterator itr;
    {
        ReadGuard Guard(GetLock());
        itr = mPlayerDataCacheMap.find(guid);
        if (itr != mPlayerDataCacheMap.end()) 
            return &itr->second;
    }
    if (!force)
        return NULL;

    Player* player = sObjectMgr.GetPlayer(guid);
    if (player)
    {
        MakePlayerDataCache(player);
    }
    else
    {
        QueryResult* result = CharacterDatabase.PQuery("SELECT account, name, race FROM characters WHERE guid = '%u'", guid.GetCounter());
        if (result)
        {
            PlayerDataCache cache;
            cache.account = (*result)[0].GetUInt32();
            cache.lowguid = guid.GetCounter();
            cache.name    = (*result)[1].GetCppString();
            cache.race    = (*result)[2].GetUInt8();

            WriteGuard Guard(GetLock());
            mPlayerDataCacheMap.insert(PlayerDataCacheMap::value_type(guid, cache));
            delete result;
        }
    }

    {
        ReadGuard Guard(GetLock());
        itr = mPlayerDataCacheMap.find(guid);
        if (itr != mPlayerDataCacheMap.end()) 
            return &itr->second;
    }

    return NULL;
}

PlayerDataCache const* AccountMgr::GetPlayerDataCache(const std::string& name)
{
    {
        ReadGuard Guard(GetLock());
        for (PlayerDataCacheMap::const_iterator itr = mPlayerDataCacheMap.begin(); itr != mPlayerDataCacheMap.end(); ++itr)
            if (itr->second.name == name)
                return &itr->second;
    }

    ObjectGuid guid;

    QueryResult* result = CharacterDatabase.PQuery("SELECT account, guid, race FROM characters WHERE name = '%s'", name.c_str());
    if (result)
    {
        PlayerDataCache cache;
        cache.account  = (*result)[0].GetUInt32();
        cache.lowguid  = (*result)[1].GetUInt32();
        cache.race     = (*result)[2].GetUInt8();
        cache.name     = name;

        guid = ObjectGuid(HIGHGUID_PLAYER, cache.lowguid);

        WriteGuard Guard(GetLock());
        mPlayerDataCacheMap.insert(PlayerDataCacheMap::value_type(guid, cache));
        delete result;
    }

    {
        ReadGuard Guard(GetLock());
        PlayerDataCacheMap::const_iterator itr = mPlayerDataCacheMap.find(guid);
        if (itr != mPlayerDataCacheMap.end()) 
            return &itr->second;
    }

    return NULL;
}

uint32 AccountMgr::GetCharactersCount(uint32 acc_id, bool full)
{
    if (full)
    {
        QueryResult* result = LoginDatabase.PQuery("SELECT SUM(numchars) FROM realmcharacters WHERE acctid = '%u'", acc_id);
        if (result)
        {
            Field* fields =result->Fetch();
            uint32 acctcharcount = fields[0].GetUInt32();
            delete result;
            return acctcharcount;
        }
    }
    else
    {
        QueryResult* result = CharacterDatabase.PQuery("SELECT COUNT(guid) FROM characters WHERE account = '%u'", acc_id);
        uint8 charcount = 0;
        if (result)
        {
            Field *fields = result->Fetch();
            charcount = fields[0].GetUInt8();
            delete result;
            return charcount;
        }
    }
    return 0;
}

void AccountMgr::UpdateCharactersCount(uint32 acc_id, uint32 realm_id)
{
    uint32 charcount = GetCharactersCount(acc_id, false);
    LoginDatabase.BeginTransaction();
    LoginDatabase.PExecute("DELETE FROM realmcharacters WHERE acctid= '%u' AND realmid = '%u'", acc_id, realm_id);
    LoginDatabase.PExecute("INSERT INTO realmcharacters (numchars, acctid, realmid) VALUES (%u, %u, %u)",  charcount, acc_id, realm_id);
    LoginDatabase.CommitTransaction();
}

void AccountMgr::LockAccount(uint32 acc_id, bool lock)
{
    LoginDatabase.PExecute( "UPDATE account SET locked = '%u' WHERE id = '%u'", uint32(lock), acc_id);
}
