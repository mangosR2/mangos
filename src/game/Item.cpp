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

#include "Item.h"
#include "AccountMgr.h"
#include "ObjectMgr.h"
#include "ObjectGuid.h"
#include "WorldPacket.h"
#include "Database/DatabaseEnv.h"
#include "ItemEnchantmentMgr.h"
#include "SQLStorages.h"

void AddItemsSetItem(Player* player, Item* item)
{
    ItemPrototype const* proto = item->GetProto();
    uint32 setid = proto->ItemSet;

    ItemSetEntry const* set = sItemSetStore.LookupEntry(setid);
    if (!set)
    {
        sLog.outErrorDb("Item set %u for item (id %u) not found, mods not applied.", setid, proto->ItemId);
        return;
    }

    if (set->required_skill_id && player->GetSkillValue(set->required_skill_id) < set->required_skill_value)
        return;

    ItemSetEffect* eff = NULL;

    for (size_t x = 0; x < player->ItemSetEff.size(); ++x)
    {
        if (player->ItemSetEff[x] && player->ItemSetEff[x]->setid == setid)
        {
            eff = player->ItemSetEff[x];
            break;
        }
    }

    if (!eff)
    {
        eff = new ItemSetEffect;
        memset(eff, 0, sizeof(ItemSetEffect));
        eff->setid = setid;

        size_t x = 0;
        for (; x < player->ItemSetEff.size(); ++x)
        {
            if (!player->ItemSetEff[x])
                break;
        }

        if (x < player->ItemSetEff.size())
            player->ItemSetEff[x] = eff;
        else
            player->ItemSetEff.push_back(eff);
    }

    ++eff->item_count;

    for (uint32 x = 0; x < 8; ++x)
    {
        if (!set->spells[x])
            continue;

        // not enough for  spell
        if (set->items_to_triggerspell[x] > eff->item_count)
            continue;

        uint32 z = 0;
        for (; z < 8; ++z)
        {
            if (eff->spells[z] && eff->spells[z]->Id == set->spells[x])
                break;
        }

        if (z < 8)
            continue;

        // new spell
        for (uint32 y = 0; y < 8; ++y)
        {
            if (!eff->spells[y])                             // free slot
            {
                SpellEntry const* spellInfo = sSpellStore.LookupEntry(set->spells[x]);
                if (!spellInfo)
                {
                    sLog.outError("WORLD: unknown spell id %u in items set %u effects", set->spells[x], setid);
                    break;
                }

                // spell casted only if fit form requirement, in other case will casted at form change
                player->ApplyEquipSpell(spellInfo, NULL, true);
                eff->spells[y] = spellInfo;
                break;
            }
        }
    }
}

void RemoveItemsSetItem(Player* player, ItemPrototype const* proto)
{
    uint32 setid = proto->ItemSet;

    ItemSetEntry const* set = sItemSetStore.LookupEntry(setid);
    if (!set)
    {
        sLog.outErrorDb("Item set #%u for item #%u not found, mods not removed.", setid, proto->ItemId);
        return;
    }

    ItemSetEffect* eff = NULL;
    size_t setindex = 0;

    for (; setindex < player->ItemSetEff.size(); ++setindex)
    {
        if (player->ItemSetEff[setindex] && player->ItemSetEff[setindex]->setid == setid)
        {
            eff = player->ItemSetEff[setindex];
            break;
        }
    }

    // can be in case now enough skill requirement for set appling but set has been appliend when skill requirement not enough
    if (!eff)
        return;

    --eff->item_count;

    for (uint32 x = 0; x < 8; ++x)
    {
        if (!set->spells[x])
            continue;

        // enough for spell
        if (set->items_to_triggerspell[x] <= eff->item_count)
            continue;

        for (uint32 z = 0; z < 8; ++z)
        {
            if (eff->spells[z] && eff->spells[z]->Id == set->spells[x])
            {
                // spell can be not active if not fit form requirement
                player->ApplyEquipSpell(eff->spells[z], NULL, false);
                eff->spells[z] = NULL;
                break;
            }
        }
    }

    if (!eff->item_count)                                   // all items of a set were removed
    {
        MANGOS_ASSERT(eff == player->ItemSetEff[setindex]);
        delete eff;
        player->ItemSetEff[setindex] = NULL;
    }
}

bool ItemCanGoIntoBag(ItemPrototype const* pProto, ItemPrototype const* pBagProto)
{
    if (!pProto || !pBagProto)
        return false;

    switch (pBagProto->Class)
    {
        case ITEM_CLASS_CONTAINER:
        {
            switch (pBagProto->SubClass)
            {
                case ITEM_SUBCLASS_CONTAINER:
                    return true;
                case ITEM_SUBCLASS_SOUL_CONTAINER:
                    if (!(pProto->BagFamily & BAG_FAMILY_MASK_SOUL_SHARDS))
                        return false;
                    return true;
                case ITEM_SUBCLASS_HERB_CONTAINER:
                    if (!(pProto->BagFamily & BAG_FAMILY_MASK_HERBS))
                        return false;
                    return true;
                case ITEM_SUBCLASS_ENCHANTING_CONTAINER:
                    if (!(pProto->BagFamily & BAG_FAMILY_MASK_ENCHANTING_SUPP))
                        return false;
                    return true;
                case ITEM_SUBCLASS_MINING_CONTAINER:
                    if (!(pProto->BagFamily & BAG_FAMILY_MASK_MINING_SUPP))
                        return false;
                    return true;
                case ITEM_SUBCLASS_ENGINEERING_CONTAINER:
                    if (!(pProto->BagFamily & BAG_FAMILY_MASK_ENGINEERING_SUPP))
                        return false;
                    return true;
                case ITEM_SUBCLASS_GEM_CONTAINER:
                    if (!(pProto->BagFamily & BAG_FAMILY_MASK_GEMS))
                        return false;
                    return true;
                case ITEM_SUBCLASS_LEATHERWORKING_CONTAINER:
                    if (!(pProto->BagFamily & BAG_FAMILY_MASK_LEATHERWORKING_SUPP))
                        return false;
                    return true;
                case ITEM_SUBCLASS_INSCRIPTION_CONTAINER:
                    if (!(pProto->BagFamily & BAG_FAMILY_MASK_INSCRIPTION_SUPP))
                        return false;
                    return true;
                default:
                    break;
            }
            break;
        }
        case ITEM_CLASS_QUIVER:
        {
            switch (pBagProto->SubClass)
            {
                case ITEM_SUBCLASS_QUIVER:
                    if (!(pProto->BagFamily & BAG_FAMILY_MASK_ARROWS))
                        return false;
                    return true;
                case ITEM_SUBCLASS_AMMO_POUCH:
                    if (!(pProto->BagFamily & BAG_FAMILY_MASK_BULLETS))
                        return false;
                    return true;
                default:
                    return false;
            }
            break;
        }
        default:
            break;
    }
    return false;
}

Item::Item() :
    loot(NULL)
{
    m_objectType  |= TYPEMASK_ITEM;
    m_objectTypeId = TYPEID_ITEM;

    m_updateFlag   = UPDATEFLAG_HIGHGUID;
    m_valuesCount  = ITEM_END;

    m_slot         = 0;
    m_state        = ITEM_NEW;
    m_queuePos     = -1;
    m_container    = NULL;
    m_lootState    = ITEM_LOOT_NONE;
    mb_in_trade    = false;

    m_paidCost     = 0;
    m_paidExtCost  = 0;
}

bool Item::Create(uint32 guidlow, uint32 itemId, Player const* owner)
{
    Object::_Create(guidlow, 0, HIGHGUID_ITEM);

    SetEntry(itemId);
    SetObjectScale(DEFAULT_OBJECT_SCALE);

    SetGuidValue(ITEM_FIELD_OWNER, owner ? owner->GetObjectGuid() : ObjectGuid());
    SetGuidValue(ITEM_FIELD_CONTAINED, ObjectGuid());

    ItemPrototype const* itemProto = ObjectMgr::GetItemPrototype(itemId);
    if (!itemProto)
        return false;

    SetUInt32Value(ITEM_FIELD_STACK_COUNT, 1);
    SetUInt32Value(ITEM_FIELD_MAXDURABILITY, itemProto->MaxDurability);
    SetUInt32Value(ITEM_FIELD_DURABILITY, itemProto->MaxDurability);

    for (uint8 i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
        SetSpellCharges(i, itemProto->Spells[i].SpellCharges);

    SetUInt32Value(ITEM_FIELD_DURATION, itemProto->Duration);

    return true;
}

void Item::GetDataValuesStr(std::ostringstream& ss)
{
    if (!m_valuesCount)
        return;

    ss << GetUInt32Value(0);
    for (uint16 i = 1; i < m_valuesCount; ++i)
        ss << ' ' << GetUInt32Value(i);
}

void Item::UpdateDuration(Player* owner, uint32 diff)
{
    if (!GetUInt32Value(ITEM_FIELD_DURATION))
        return;

    // DEBUG_LOG("Item::UpdateDuration Item (Entry: %u Duration %u Diff %u)", GetEntry(), GetUInt32Value(ITEM_FIELD_DURATION), diff);

    if (GetUInt32Value(ITEM_FIELD_DURATION) <= diff)
    {
        if (uint32 newItemId = sObjectMgr.GetItemExpireConvert(GetEntry()))
            owner->ConvertItem(this, newItemId);
        else
            owner->DestroyItem(GetBagSlot(), GetSlot(), true);
        return;
    }

    SetUInt32Value(ITEM_FIELD_DURATION, GetUInt32Value(ITEM_FIELD_DURATION) - diff);
    SetState(ITEM_CHANGED, owner);                          // save new time in database
}

void Item::SaveToDB()
{
    uint32 guid = GetGUIDLow();

    switch(m_state)
    {
        case ITEM_NEW:
        {
            DeleteFromDB(guid);

            std::ostringstream ss;
            GetDataValuesStr(ss);

            static SqlStatementID insItem;
            SqlStatement stmt = CharacterDatabase.CreateStatement(insItem, "INSERT INTO item_instance (guid, owner_guid, data, text) VALUES (?, ?, ?, ?)");
            stmt.PExecute(guid, GetOwnerGuid().GetCounter(), ss.str().c_str(), m_text.c_str());

            break;
        }
        case ITEM_CHANGED:
        {
            std::ostringstream ss;
            GetDataValuesStr(ss);

            static SqlStatementID updInstance;
            SqlStatement stmt = CharacterDatabase.CreateStatement(updInstance, "UPDATE item_instance SET data = ?, owner_guid = ?, text = ? WHERE guid = ?");
            stmt.PExecute(ss.str().c_str(), GetOwnerGuid().GetCounter(), m_text.c_str(), guid);

            if (HasFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_WRAPPED))
            {
                static SqlStatementID updGifts;
                stmt = CharacterDatabase.CreateStatement(updGifts, "UPDATE character_gifts SET guid = ? WHERE item_guid = ?");
                stmt.PExecute(GetOwnerGuid().GetCounter(), GetGUIDLow());
            }

            break;
        }
        case ITEM_REMOVED:
        {
            DeleteFromDB(guid);

            if (HasFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_WRAPPED))
                DeleteGiftsFromDB();

            if (HasSavedLoot())
                DeleteLootFromDB();

            if (HasFlag(ITEM_FIELD_FLAGS, ITEM_FLAG_REFUNDABLE))
                DeleteRefundDataFromDB();

            if (HasFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_BOP_TRADEABLE))
                DeleteSoulboundTradeableFromDB();

            delete this;
            return;
        }
        case ITEM_UNCHANGED:
            return;
    }

    if (m_lootState == ITEM_LOOT_CHANGED || m_lootState == ITEM_LOOT_REMOVED)
        DeleteLootFromDB();

    if (m_lootState == ITEM_LOOT_NEW || m_lootState == ITEM_LOOT_CHANGED)
    {
        if (Player* owner = GetOwner())
        {
            // save money as 0 itemid data
            if (loot.gold)
            {
                static SqlStatementID saveGold;
                SqlStatement stmt = CharacterDatabase.CreateStatement(saveGold, "INSERT INTO item_loot (guid, owner_guid, itemid, amount, suffix, property) VALUES (?, ?, 0, ?, 0, 0)");
                stmt.PExecute(GetGUIDLow(), owner->GetGUIDLow(), loot.gold);
            }

            // save items and quest items (at load its all will added as normal, but this not important for item loot case)
            if (uint32 lootItemCount = loot.GetMaxSlotInLootFor(owner))
            {
                static SqlStatementID saveLoot;
                SqlStatement stmt1 = CharacterDatabase.CreateStatement(saveLoot, "INSERT INTO item_loot (guid, owner_guid, itemid, amount, suffix, property) VALUES (?, ?, ?, ?, ?, ?)");

                for (uint32 i = 0; i < lootItemCount; ++i)
                {
                    QuestItem* qitem = NULL;

                    LootItem* item = loot.LootItemInSlot(i, owner, &qitem);
                    if (!item)
                        continue;

                    // questitems use the blocked field for other purposes
                    if (!qitem && item->is_blocked)
                        continue;

                    stmt1.addUInt32(GetGUIDLow());
                    stmt1.addUInt32(owner->GetGUIDLow());
                    stmt1.addUInt32(item->itemid);
                    stmt1.addUInt8(item->count);
                    stmt1.addUInt32(item->randomSuffix);
                    stmt1.addInt32(item->randomPropertyId);
                    stmt1.Execute();
                }
            }
        }
    }

    if (m_lootState != ITEM_LOOT_NONE && m_lootState != ITEM_LOOT_TEMPORARY)
        SetLootState(ITEM_LOOT_UNCHANGED);

    SetState(ITEM_UNCHANGED);
}

bool Item::LoadFromDB(uint32 guidLow, Field* fields, ObjectGuid ownerGuid)
{
    // create item before any checks for store correct guid
    // and allow use "FSetState(ITEM_REMOVED); SaveToDB();" for deleting item from DB
    Object::_Create(ObjectGuid(HIGHGUID_ITEM, guidLow));

    if (!LoadValues(fields[0].GetString()))
    {
        sLog.outError("Item::LoadFromDB: %s have broken data in `data` field. Can't be loaded.", GetGuidStr().c_str());
        return false;
    }

    SetText(fields[1].GetCppString());

    bool needSave = false;                                  // need explicit save data at load fixes

    // overwrite possible wrong/corrupted guid
    ObjectGuid new_item_guid = ObjectGuid(HIGHGUID_ITEM, guidLow);
    if (GetGuidValue(OBJECT_FIELD_GUID) != new_item_guid)
    {
        SetGuidValue(OBJECT_FIELD_GUID, new_item_guid);
        needSave = true;
    }

    ItemPrototype const* proto = GetProto();
    if (!proto)
        return false;

    // update max durability (and durability) if need
    if (proto->MaxDurability != GetUInt32Value(ITEM_FIELD_MAXDURABILITY))
    {
        SetUInt32Value(ITEM_FIELD_MAXDURABILITY, proto->MaxDurability);
        if (GetUInt32Value(ITEM_FIELD_DURABILITY) > proto->MaxDurability)
            SetUInt32Value(ITEM_FIELD_DURABILITY, proto->MaxDurability);

        needSave = true;
    }

    // recalculate suffix factor
    if (GetItemRandomPropertyId() < 0)
    {
        if (UpdateItemSuffixFactor())
            needSave = true;
    }

    // Remove bind flag for items vs NO_BIND set
    if (IsSoulBound() && proto->Bonding == NO_BIND)
    {
        ApplyModFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_BINDED, false);
        needSave = true;
    }

    // update duration if need, and remove if not need
    if ((proto->Duration == 0) != (GetUInt32Value(ITEM_FIELD_DURATION) == 0))
    {
        SetUInt32Value(ITEM_FIELD_DURATION, proto->Duration);
        needSave = true;
    }

    // set correct owner
    if (ownerGuid && GetOwnerGuid() != ownerGuid)
    {
        SetOwnerGuid(ownerGuid);
        needSave = true;
    }

    // set correct wrapped state
    if (HasFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_WRAPPED))
    {
        // wrapped item must be wrapper (used version that not stackable)
        if (!(proto->Flags & ITEM_FLAG_WRAPPER) || GetMaxStackCount() > 1)
        {
            RemoveFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_WRAPPED);
            needSave = true;

            // also cleanup for sure gift table
            DeleteGiftsFromDB();
        }
    }

    if (needSave)                                          // normal item changed state set not work at loading
    {
        std::ostringstream ss;
        GetDataValuesStr(ss);

        static SqlStatementID updItem;
        SqlStatement stmt = CharacterDatabase.CreateStatement(updItem, "UPDATE item_instance SET owner_guid = ?, data = ? WHERE guid = ?");
        stmt.PExecute(GetOwnerGuid().GetCounter(), ss.str().c_str(), guidLow);
    }

    return true;
}

void Item::LoadLootFromDB(Field* fields)
{
    uint32 itemId     = fields[1].GetUInt32();
    uint32 itemAmount = fields[2].GetUInt32();

    // money value special case
    if (!itemId)
    {
        loot.gold = itemAmount;
        SetLootState(ITEM_LOOT_UNCHANGED);
        return;
    }

    // normal item case
    ItemPrototype const* proto = ObjectMgr::GetItemPrototype(itemId);
    if (!proto)
    {
        DeleteLootFromDB(GetGUIDLow(), itemId);
        sLog.outError("Item::LoadLootFromDB: %s has an unknown item (id: %u) in item_loot, deleted.", GetGuidStr().c_str(), itemId);
        return;
    }

    uint32 itemSuffix = fields[3].GetUInt32();
    int32  itemPropId = fields[4].GetInt32();

    loot.items.push_back(LootItem(itemId, itemAmount, itemSuffix, itemPropId));
    ++loot.unlootedCount;

    SetLootState(ITEM_LOOT_UNCHANGED);
}

void Item::DeleteFromDB(uint32 guidLow)
{
    static SqlStatementID delItem;
    SqlStatement stmt = CharacterDatabase.CreateStatement(delItem, "DELETE FROM item_instance WHERE guid = ?");
    stmt.PExecute(guidLow);
}

void Item::DeleteFromDB()
{
    DeleteFromDB(GetGUIDLow());
}

void Item::DeleteFromInventoryDB(uint32 guidLow)
{
    static SqlStatementID delInv;
    SqlStatement stmt = CharacterDatabase.CreateStatement(delInv, "DELETE FROM character_inventory WHERE item = ?");
    stmt.PExecute(guidLow);
}

void Item::DeleteFromInventoryDB()
{
    DeleteFromInventoryDB(GetGUIDLow());
}

void Item::DeleteGiftsFromDB()
{
    static SqlStatementID delGifts;
    SqlStatement stmt = CharacterDatabase.CreateStatement(delGifts, "DELETE FROM character_gifts WHERE item_guid = ?");
    stmt.PExecute(GetGUIDLow());
}

void Item::DeleteLootFromDB(uint32 guidLow, uint32 itemId/*=0*/)
{
    static SqlStatementID delLoot;
    if (itemId)
    {
        SqlStatement stmt = CharacterDatabase.CreateStatement(delLoot, "DELETE FROM item_loot WHERE guid = ? AND itemid = ?");
        stmt.PExecute(guidLow, itemId);
    }
    else
    {
        SqlStatement stmt = CharacterDatabase.CreateStatement(delLoot, "DELETE FROM item_loot WHERE guid = ?");
        stmt.PExecute(guidLow);
    }
}

void Item::DeleteLootFromDB()
{
    DeleteLootFromDB(GetGUIDLow());
}

ItemPrototype const* Item::GetProto() const
{
    return ObjectMgr::GetItemPrototype(GetEntry());
}

Player* Item::GetOwner() const
{
    return sObjectMgr.GetPlayer(GetOwnerGuid(), false);
}

uint32 Item::GetSkill()
{
    const static uint32 item_weapon_skills[MAX_ITEM_SUBCLASS_WEAPON] =
    {
        SKILL_AXES,     SKILL_2H_AXES,  SKILL_BOWS,          SKILL_GUNS,      SKILL_MACES,
        SKILL_2H_MACES, SKILL_POLEARMS, SKILL_SWORDS,        SKILL_2H_SWORDS, 0,
        SKILL_STAVES,   0,              0,                   SKILL_UNARMED,   0,
        SKILL_DAGGERS,  SKILL_THROWN,   SKILL_ASSASSINATION, SKILL_CROSSBOWS, SKILL_WANDS,
        SKILL_FISHING
    };

    const static uint32 item_armor_skills[MAX_ITEM_SUBCLASS_ARMOR] =
    {
        0, SKILL_CLOTH, SKILL_LEATHER, SKILL_MAIL, SKILL_PLATE_MAIL, 0, SKILL_SHIELD, 0, 0, 0, 0
    };

    ItemPrototype const* proto = GetProto();

    switch (proto->Class)
    {
        case ITEM_CLASS_WEAPON:
            if (proto->SubClass >= MAX_ITEM_SUBCLASS_WEAPON)
                return 0;
            else
                return item_weapon_skills[proto->SubClass];

        case ITEM_CLASS_ARMOR:
            if (proto->SubClass >= MAX_ITEM_SUBCLASS_ARMOR)
                return 0;
            else
                return item_armor_skills[proto->SubClass];

        default:
            return 0;
    }
}

uint32 Item::GetSpell()
{
    ItemPrototype const* proto = GetProto();

    switch (proto->Class)
    {
        case ITEM_CLASS_WEAPON:
            switch (proto->SubClass)
            {
                case ITEM_SUBCLASS_WEAPON_AXE:     return  196;
                case ITEM_SUBCLASS_WEAPON_AXE2:    return  197;
                case ITEM_SUBCLASS_WEAPON_BOW:     return  264;
                case ITEM_SUBCLASS_WEAPON_GUN:     return  266;
                case ITEM_SUBCLASS_WEAPON_MACE:    return  198;
                case ITEM_SUBCLASS_WEAPON_MACE2:   return  199;
                case ITEM_SUBCLASS_WEAPON_POLEARM: return  200;
                case ITEM_SUBCLASS_WEAPON_SWORD:   return  201;
                case ITEM_SUBCLASS_WEAPON_SWORD2:  return  202;
                case ITEM_SUBCLASS_WEAPON_STAFF:   return  227;
                case ITEM_SUBCLASS_WEAPON_DAGGER:  return 1180;
                case ITEM_SUBCLASS_WEAPON_THROWN:  return 2567;
                case ITEM_SUBCLASS_WEAPON_SPEAR:   return 3386;
                case ITEM_SUBCLASS_WEAPON_CROSSBOW: return 5011;
                case ITEM_SUBCLASS_WEAPON_WAND:    return 5009;
                default: return 0;
            }
            break;
        case ITEM_CLASS_ARMOR:
            switch (proto->SubClass)
            {
                case ITEM_SUBCLASS_ARMOR_CLOTH:    return 9078;
                case ITEM_SUBCLASS_ARMOR_LEATHER:  return 9077;
                case ITEM_SUBCLASS_ARMOR_MAIL:     return 8737;
                case ITEM_SUBCLASS_ARMOR_PLATE:    return  750;
                case ITEM_SUBCLASS_ARMOR_SHIELD:   return 9116;
                default: return 0;
            }
            break;
        default:
            break;
    }
    return 0;
}

int32 Item::GenerateItemRandomPropertyId(uint32 item_id)
{
    ItemPrototype const* itemProto = sItemStorage.LookupEntry<ItemPrototype>(item_id);

    if (!itemProto)
        return 0;

    // item must have one from this field values not null if it can have random enchantments
    if ((!itemProto->RandomProperty) && (!itemProto->RandomSuffix))
        return 0;

    // Random Property case
    if (itemProto->RandomProperty)
    {
        uint32 randomPropId = GetItemEnchantMod(itemProto->RandomProperty);
        ItemRandomPropertiesEntry const* random_id = sItemRandomPropertiesStore.LookupEntry(randomPropId);
        if (!random_id)
        {
            sLog.outErrorDb("Enchantment id #%u used but it doesn't have records in 'ItemRandomProperties.dbc'", randomPropId);
            return 0;
        }

        return random_id->ID;
    }
    // Random Suffix case
    else
    {
        uint32 randomPropId = GetItemEnchantMod(itemProto->RandomSuffix);
        ItemRandomSuffixEntry const* random_id = sItemRandomSuffixStore.LookupEntry(randomPropId);
        if (!random_id)
        {
            sLog.outErrorDb("Enchantment id #%u used but it doesn't have records in sItemRandomSuffixStore.", randomPropId);
            return 0;
        }

        return -int32(random_id->ID);
    }
}

void Item::SetItemRandomProperties(int32 randomPropId)
{
    if (!randomPropId)
        return;

    if (randomPropId > 0)
    {
        ItemRandomPropertiesEntry const* item_rand = sItemRandomPropertiesStore.LookupEntry(randomPropId);
        if (item_rand)
        {
            if (GetInt32Value(ITEM_FIELD_RANDOM_PROPERTIES_ID) != int32(item_rand->ID))
            {
                SetInt32Value(ITEM_FIELD_RANDOM_PROPERTIES_ID, item_rand->ID);
                SetState(ITEM_CHANGED);
            }
            for (uint32 i = PROP_ENCHANTMENT_SLOT_2; i < PROP_ENCHANTMENT_SLOT_2 + 3; ++i)
                SetEnchantment(EnchantmentSlot(i), item_rand->enchant_id[i - PROP_ENCHANTMENT_SLOT_2], 0, 0);
        }
    }
    else
    {
        ItemRandomSuffixEntry const* item_rand = sItemRandomSuffixStore.LookupEntry(-randomPropId);
        if (item_rand)
        {
            if (GetInt32Value(ITEM_FIELD_RANDOM_PROPERTIES_ID) != -int32(item_rand->ID) ||
                !GetItemSuffixFactor())
            {
                SetInt32Value(ITEM_FIELD_RANDOM_PROPERTIES_ID, -int32(item_rand->ID));
                UpdateItemSuffixFactor();
                SetState(ITEM_CHANGED);
            }

            for (uint32 i = PROP_ENCHANTMENT_SLOT_0; i < PROP_ENCHANTMENT_SLOT_0 + 3; ++i)
                SetEnchantment(EnchantmentSlot(i), item_rand->enchant_id[i - PROP_ENCHANTMENT_SLOT_0], 0, 0);
        }
    }
}

bool Item::UpdateItemSuffixFactor()
{
    uint32 suffixFactor = GenerateEnchSuffixFactor(GetEntry());
    if (GetItemSuffixFactor() == suffixFactor)
        return false;

    SetUInt32Value(ITEM_FIELD_PROPERTY_SEED, suffixFactor);
    return true;
}

void Item::SetState(ItemUpdateState state, Player* forPlayer)
{
    if (m_state == ITEM_NEW && state == ITEM_REMOVED)
    {
        // pretend the item never existed
        if (forPlayer || GetOwnerGuid())
            RemoveFromUpdateQueueOf(forPlayer);

        if (forPlayer)
            forPlayer->RemoveItemWithTimeCheck(GetGUIDLow());

        delete this;
        return;
    }

    if (state != ITEM_UNCHANGED)
    {
        // new items must stay in new state until saved
        if (m_state != ITEM_NEW)
            m_state = state;

        if (forPlayer || GetOwnerGuid())
            AddToUpdateQueueOf(forPlayer);
    }
    else
    {
        // unset in queue
        // the item must be removed from the queue manually
        m_queuePos = -1;
        m_state = ITEM_UNCHANGED;
    }
}

void Item::AddToUpdateQueueOf(Player* player)
{
    if (IsInUpdateQueue())
        return;

    if (!player)
    {
        player = GetOwner();
        if (!player)
        {
            DeleteFromInventoryDB();
            DeleteFromDB();

            sLog.outError("Item::AddToUpdateQueueOf - %s current owner (%s) not in world!",
                GetGuidStr().c_str(), GetOwnerGuid().GetString().c_str());
            return;
        }
    }

    if (player->GetObjectGuid() != GetOwnerGuid())
    {
        sLog.outError("Item::AddToUpdateQueueOf - %s current owner (%s) and inventory owner (%s) don't match!",
            GetGuidStr().c_str(), GetOwnerGuid().GetString().c_str(), player->GetGuidStr().c_str());
        return;
    }

    if (player->m_itemUpdateQueueBlocked)
        return;

    player->m_itemUpdateQueue.push_back(this);
    m_queuePos = player->m_itemUpdateQueue.size() - 1;
}

void Item::RemoveFromUpdateQueueOf(Player* player)
{
    if (!IsInUpdateQueue())
        return;

    if (!player)
    {
        player = GetOwner();
        if (!player)
        {
            sLog.outError("Item::RemoveFromUpdateQueueOf - %s current owner (%s) not in world!",
                GetGuidStr().c_str(), GetOwnerGuid().GetString().c_str());
            return;
        }
    }

    if (player->GetObjectGuid() != GetOwnerGuid())
    {
        sLog.outError("Item::RemoveFromUpdateQueueOf - %s current owner (%s) and inventory owner (%s) don't match!",
            GetGuidStr().c_str(), GetOwnerGuid().GetString().c_str(), player->GetGuidStr().c_str());
        return;
    }

    if (player->m_itemUpdateQueueBlocked)
        return;

    player->m_itemUpdateQueue[m_queuePos] = NULL;
    m_queuePos = -1;
}

uint8 Item::GetBagSlot() const
{
    return m_container ? m_container->GetSlot() : uint8(INVENTORY_SLOT_BAG_0);
}

bool Item::IsEquipped() const
{
    return !IsInBag() && m_slot < EQUIPMENT_SLOT_END;
}

bool Item::CanBeTraded(bool mail, bool trade) const
{
    if ((!mail || !IsBoundAccountWide()) && (IsSoulBound() && (!HasFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_BOP_TRADEABLE) || !trade)))
        return false;

    if (IsBag() && (Player::IsBagPos(GetPos()) || !((Bag const*)this)->IsEmpty()))
        return false;

    if (Player* owner = GetOwner())
    {
        if (owner->CanUnequipItem(GetPos(), false) !=  EQUIP_ERR_OK)
            return false;
        if (owner->GetLootGuid() == GetObjectGuid())
            return false;
    }

    if (HasGeneratedLoot())
        return false;

    if (IsBoundByEnchant())
        return false;

    return true;
}

bool Item::IsBoundByEnchant() const
{
    // Check all enchants for soulbound
    for (uint32 enchant_slot = PERM_ENCHANTMENT_SLOT; enchant_slot < MAX_ENCHANTMENT_SLOT; ++enchant_slot)
    {
        uint32 enchant_id = GetEnchantmentId(EnchantmentSlot(enchant_slot));
        if (!enchant_id)
            continue;

        SpellItemEnchantmentEntry const* enchantEntry = sSpellItemEnchantmentStore.LookupEntry(enchant_id);
        if (!enchantEntry)
            continue;

        if (enchantEntry->slot & ENCHANTMENT_CAN_SOULBOUND)
            return true;
    }
    return false;
}

bool Item::IsFitToSpellRequirements(SpellEntry const* spellInfo) const
{
    ItemPrototype const* proto = GetProto();

    // Enchant spells only use Effect[0] (patch 3.3.2)
    if (proto->IsVellum() && spellInfo->Effect[EFFECT_INDEX_0] == SPELL_EFFECT_ENCHANT_ITEM)
    {
        // EffectItemType[0] is the associated scroll itemID, if a scroll can be made
        if (spellInfo->EffectItemType[EFFECT_INDEX_0] == 0)
            return false;
        // Other checks do not apply to vellum enchants, so return final result
        return ((proto->SubClass == ITEM_SUBCLASS_WEAPON_ENCHANTMENT && spellInfo->EquippedItemClass == ITEM_CLASS_WEAPON) ||
                (proto->SubClass == ITEM_SUBCLASS_ARMOR_ENCHANTMENT && spellInfo->EquippedItemClass == ITEM_CLASS_ARMOR));
    }

    if (spellInfo->EquippedItemClass != -1)                 // -1 == any item class
    {
        if (spellInfo->EquippedItemClass != int32(proto->Class))
            return false;                                   //  wrong item class

        if (spellInfo->EquippedItemSubClassMask != 0)       // 0 == any subclass
        {
            if ((spellInfo->EquippedItemSubClassMask & (1 << proto->SubClass)) == 0)
                return false;                               // subclass not present in mask
        }
    }

    // Only check for item enchantments (TARGET_FLAG_ITEM), all other spells are either NPC spells
    // or spells where slot requirements are already handled with AttributesEx3 fields
    // and special code (Titan's Grip, Windfury Attack). Check clearly not applicable for Lava Lash.
    if (spellInfo->EquippedItemInventoryTypeMask != 0 && (spellInfo->Targets & TARGET_FLAG_ITEM))    // 0 == any inventory type
    {
        if ((spellInfo->EquippedItemInventoryTypeMask  & (1 << proto->InventoryType)) == 0)
            return false;                                   // inventory type not present in mask
    }

    return true;
}

bool Item::IsTargetValidForItemUse(Unit* pUnitTarget)
{
    ItemRequiredTargetMapBounds bounds = sObjectMgr.GetItemRequiredTargetMapBounds(GetProto()->ItemId);

    if (bounds.first == bounds.second)
        return true;

    if (!pUnitTarget)
        return false;

    for (ItemRequiredTargetMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
        if (itr->second.IsFitToRequirements(pUnitTarget))
            return true;

    return false;
}

void Item::SetEnchantment(EnchantmentSlot slot, uint32 id, uint32 duration, uint32 charges)
{
    // Better lost small time at check in comparison lost time at item save to DB.
    if ((GetEnchantmentId(slot) == id) && (GetEnchantmentDuration(slot) == duration) && (GetEnchantmentCharges(slot) == charges))
        return;

    SetUInt32Value(ITEM_FIELD_ENCHANTMENT_1_1 + slot * MAX_ENCHANTMENT_OFFSET + ENCHANTMENT_ID_OFFSET, id);
    SetUInt32Value(ITEM_FIELD_ENCHANTMENT_1_1 + slot * MAX_ENCHANTMENT_OFFSET + ENCHANTMENT_DURATION_OFFSET, duration);
    SetUInt32Value(ITEM_FIELD_ENCHANTMENT_1_1 + slot * MAX_ENCHANTMENT_OFFSET + ENCHANTMENT_CHARGES_OFFSET, charges);
    SetState(ITEM_CHANGED);
}

void Item::SetEnchantmentDuration(EnchantmentSlot slot, uint32 duration)
{
    if (GetEnchantmentDuration(slot) == duration)
        return;

    SetUInt32Value(ITEM_FIELD_ENCHANTMENT_1_1 + slot * MAX_ENCHANTMENT_OFFSET + ENCHANTMENT_DURATION_OFFSET, duration);
    SetState(ITEM_CHANGED);
}

void Item::SetEnchantmentCharges(EnchantmentSlot slot, uint32 charges)
{
    if (GetEnchantmentCharges(slot) == charges)
        return;

    SetUInt32Value(ITEM_FIELD_ENCHANTMENT_1_1 + slot * MAX_ENCHANTMENT_OFFSET + ENCHANTMENT_CHARGES_OFFSET, charges);
    SetState(ITEM_CHANGED);
}

void Item::ClearEnchantment(EnchantmentSlot slot)
{
    if (!GetEnchantmentId(slot))
        return;

    for (uint8 x = 0; x < 3; ++x)
        SetUInt32Value(ITEM_FIELD_ENCHANTMENT_1_1 + slot * MAX_ENCHANTMENT_OFFSET + x, 0);
    SetState(ITEM_CHANGED);
}

bool Item::GemsFitSockets() const
{
    bool fits = true;
    for (uint32 enchant_slot = SOCK_ENCHANTMENT_SLOT; enchant_slot < SOCK_ENCHANTMENT_SLOT + MAX_GEM_SOCKETS; ++enchant_slot)
    {
        uint8 SocketColor = GetProto()->Socket[enchant_slot - SOCK_ENCHANTMENT_SLOT].Color;

        if (!SocketColor) //prismatic socket
            continue;

        uint32 enchant_id = GetEnchantmentId(EnchantmentSlot(enchant_slot));
        if (!enchant_id)
        {
            if (SocketColor) fits &= false;
            continue;
        }

        SpellItemEnchantmentEntry const* enchantEntry = sSpellItemEnchantmentStore.LookupEntry(enchant_id);
        if (!enchantEntry)
        {
            if (SocketColor) fits &= false;
            continue;
        }

        uint8 GemColor = 0;

        uint32 gemid = enchantEntry->GemID;
        if (gemid)
        {
            ItemPrototype const* gemProto = sItemStorage.LookupEntry<ItemPrototype>(gemid);
            if (gemProto)
            {
                GemPropertiesEntry const* gemProperty = sGemPropertiesStore.LookupEntry(gemProto->GemProperties);
                if (gemProperty)
                    GemColor = gemProperty->color;
            }
        }

        fits &= (GemColor & SocketColor) ? true : false;
    }
    return fits;
}

uint8 Item::GetGemCountWithID(uint32 GemID) const
{
    uint8 count = 0;
    for (uint32 enchant_slot = SOCK_ENCHANTMENT_SLOT; enchant_slot < SOCK_ENCHANTMENT_SLOT + MAX_GEM_SOCKETS; ++enchant_slot)
    {
        uint32 enchant_id = GetEnchantmentId(EnchantmentSlot(enchant_slot));
        if (!enchant_id)
            continue;

        SpellItemEnchantmentEntry const* enchantEntry = sSpellItemEnchantmentStore.LookupEntry(enchant_id);
        if (!enchantEntry)
            continue;

        if (GemID == enchantEntry->GemID)
            ++count;
    }
    return count;
}

uint8 Item::GetGemCountWithLimitCategory(uint32 limitCategory) const
{
    uint8 count = 0;
    for (uint32 enchant_slot = SOCK_ENCHANTMENT_SLOT; enchant_slot < SOCK_ENCHANTMENT_SLOT + MAX_GEM_SOCKETS; ++enchant_slot)
    {
        uint32 enchant_id = GetEnchantmentId(EnchantmentSlot(enchant_slot));
        if (!enchant_id)
            continue;

        SpellItemEnchantmentEntry const* enchantEntry = sSpellItemEnchantmentStore.LookupEntry(enchant_id);
        if (!enchantEntry)
            continue;

        ItemPrototype const* gemProto = ObjectMgr::GetItemPrototype(enchantEntry->GemID);
        if (!gemProto)
            continue;

        if (gemProto->ItemLimitCategory == limitCategory)
            ++count;
    }
    return count;
}

uint8 Item::GetJewelcraftingGemCount() const
{
    uint8 count = 0;
    for (uint32 enchant_slot = SOCK_ENCHANTMENT_SLOT; enchant_slot < SOCK_ENCHANTMENT_SLOT + MAX_GEM_SOCKETS; ++enchant_slot)
    {
        uint32 enchant_id = GetEnchantmentId(EnchantmentSlot(enchant_slot));

        if (!enchant_id)
            continue;

        SpellItemEnchantmentEntry const* enchantEntry = sSpellItemEnchantmentStore.LookupEntry(enchant_id);
        if (!enchantEntry)
            continue;

        ItemPrototype const* gemProto = ObjectMgr::GetItemPrototype(enchantEntry->GemID);
        if (!gemProto)
            continue;

        if (gemProto->RequiredSkill == SKILL_JEWELCRAFTING)
            ++count;
    }
    return count;
}

bool Item::IsLimitedToAnotherMapOrZone(uint32 cur_mapId, uint32 cur_zoneId) const
{
    ItemPrototype const* proto = GetProto();
    return proto && ((proto->Map && proto->Map != cur_mapId) || (proto->Area && proto->Area != cur_zoneId));
}

// Though the client has the information in the item's data field,
// we have to send SMSG_ITEM_TIME_UPDATE to display the remaining
// time.
void Item::SendTimeUpdate(Player* owner)
{
    if (!owner || !owner->IsInWorld() || owner->GetPlayerbotAI())
        return;

    uint32 duration = GetUInt32Value(ITEM_FIELD_DURATION);
    if (!duration)
        return;

    WorldPacket data(SMSG_ITEM_TIME_UPDATE, 8 + 4);
    data << ObjectGuid(GetObjectGuid());
    data << uint32(duration);
    owner->GetSession()->SendPacket(&data);
}

Item* Item::CreateItem(uint32 item, uint32 count, Player const* player, uint32 randomPropertyId)
{
    if (count < 1)
        return NULL;                                        // don't create item at zero count

    if (ItemPrototype const* pProto = ObjectMgr::GetItemPrototype(item))
    {
        if (count > pProto->GetMaxStackSize())
            count = pProto->GetMaxStackSize();

        MANGOS_ASSERT(count != 0 && "pProto->Stackable == 0 but checked at loading already");

        Item* pItem = NewItemOrBag(pProto);
        if (pItem->Create(sObjectMgr.GenerateItemLowGuid(), item, player))
        {
            pItem->SetCount(count);
            if (uint32 randId = randomPropertyId ? randomPropertyId : Item::GenerateItemRandomPropertyId(item))
                pItem->SetItemRandomProperties(randId);

            return pItem;
        }
        else
            delete pItem;
    }
    return NULL;
}

Item* Item::CloneItem(uint32 count, Player const* player) const
{
    Item* newItem = CreateItem(GetEntry(), count, player, GetItemRandomPropertyId());
    if (!newItem)
        return NULL;

    newItem->SetGuidValue(ITEM_FIELD_CREATOR,     GetGuidValue(ITEM_FIELD_CREATOR));
    newItem->SetGuidValue(ITEM_FIELD_GIFTCREATOR, GetGuidValue(ITEM_FIELD_GIFTCREATOR));
    newItem->SetUInt32Value(ITEM_FIELD_FLAGS,     GetUInt32Value(ITEM_FIELD_FLAGS));
    newItem->SetUInt32Value(ITEM_FIELD_DURATION,  GetUInt32Value(ITEM_FIELD_DURATION));
    return newItem;
}

bool Item::IsBindedNotWith(Player const* player) const
{
    // own item
    if (GetOwnerGuid() == player->GetObjectGuid())
        return false;

    if (HasFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_BOP_TRADEABLE))
    {
        if (m_allowedLooterGuids.find(player->GetObjectGuid().GetCounter()) != m_allowedLooterGuids.end())
            return false;
    }

    // has loot with diff owner
    if (HasGeneratedLoot())
        return true;

    // not binded item
    if (!IsSoulBound())
        return false;

    // not BOA item case
    if (!IsBoundAccountWide())
        return true;

    // online
    if (Player* owner = GetOwner())
    {
        return owner->GetSession()->GetAccountId() != player->GetSession()->GetAccountId();
    }
    // offline slow case
    else
    {
        return sAccountMgr.GetPlayerAccountIdByGUID(GetOwnerGuid()) != player->GetSession()->GetAccountId();
    }
}

void Item::AddToClientUpdateList()
{
    if (Player* pPlayer = GetOwner())
        pPlayer->AddUpdateObject(GetObjectGuid());
}

void Item::RemoveFromClientUpdateList()
{
    if (Player* pPlayer = GetOwner())
        pPlayer->RemoveUpdateObject(GetObjectGuid());
}

void Item::BuildUpdateData(UpdateDataMapType& update_players)
{
    if (Player* pl = GetOwner())
        BuildUpdateDataForPlayer(pl, update_players);

    ClearUpdateMask(false);
}

InventoryResult Item::CanBeMergedPartlyWith(ItemPrototype const* proto) const
{
    // check item type
    if (GetEntry() != proto->ItemId)
        return EQUIP_ERR_ITEM_CANT_STACK;

    // check free space (full stacks can't be target of merge
    if (GetCount() >= proto->GetMaxStackSize())
        return EQUIP_ERR_ITEM_CANT_STACK;

    // not allow merge looting currently items
    if (HasGeneratedLoot())
        return EQUIP_ERR_ALREADY_LOOTED;

    return EQUIP_ERR_OK;
}

bool ItemRequiredTarget::IsFitToRequirements(Unit* pUnitTarget) const
{
    if (pUnitTarget->GetTypeId() != TYPEID_UNIT)
        return false;

    if (pUnitTarget->GetEntry() != m_uiTargetEntry)
        return false;

    switch (m_uiType)
    {
        case ITEM_TARGET_TYPE_CREATURE:
            return pUnitTarget->isAlive();
        case ITEM_TARGET_TYPE_DEAD:
            return !pUnitTarget->isAlive();
        default:
            return false;
    }
}

bool Item::HasMaxCharges() const
{
    ItemPrototype const* itemProto = GetProto();

    for (int i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
        if (GetSpellCharges(i) != itemProto->Spells[i].SpellCharges)
            return false;

    return true;
}

void Item::RestoreCharges()
{
    ItemPrototype const* itemProto = GetProto();

    for (uint8 i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
    {
        if (GetSpellCharges(i) != itemProto->Spells[i].SpellCharges)
        {
            SetSpellCharges(i, itemProto->Spells[i].SpellCharges);
            SetState(ITEM_CHANGED);
        }
    }
}

void Item::SetLootState(ItemLootUpdateState state)
{
    // ITEM_LOOT_NONE -> ITEM_LOOT_TEMPORARY -> ITEM_LOOT_NONE
    // ITEM_LOOT_NONE -> ITEM_LOOT_NEW -> ITEM_LOOT_NONE
    // ITEM_LOOT_NONE -> ITEM_LOOT_NEW -> ITEM_LOOT_UNCHANGED [<-> ITEM_LOOT_CHANGED] -> ITEM_LOOT_REMOVED -> ITEM_LOOT_NONE
    switch (state)
    {
        case ITEM_LOOT_NONE:
        case ITEM_LOOT_NEW:
            assert(false);                                 // not used in state change calls
            return;
        case ITEM_LOOT_TEMPORARY:
            assert(m_lootState == ITEM_LOOT_NONE);          // called only for not generated yet loot case
            m_lootState = ITEM_LOOT_TEMPORARY;
            break;
        case ITEM_LOOT_CHANGED:
            // new loot must stay in new state until saved, temporary must stay until remove
            if (m_lootState != ITEM_LOOT_NEW && m_lootState != ITEM_LOOT_TEMPORARY)
                m_lootState = m_lootState == ITEM_LOOT_NONE ? ITEM_LOOT_NEW : state;
            break;
        case ITEM_LOOT_UNCHANGED:
            // expected that called after DB update or load
            if (m_lootState == ITEM_LOOT_REMOVED)
                m_lootState = ITEM_LOOT_NONE;
            // temporary must stay until remove (ignore any changes)
            else if (m_lootState != ITEM_LOOT_TEMPORARY)
                m_lootState = ITEM_LOOT_UNCHANGED;
            break;
        case ITEM_LOOT_REMOVED:
            // if loot not saved then it existence in past can be just ignored
            if (m_lootState == ITEM_LOOT_NEW || m_lootState == ITEM_LOOT_TEMPORARY)
            {
                m_lootState = ITEM_LOOT_NONE;
                return;
            }

            m_lootState = ITEM_LOOT_REMOVED;
            break;
    }

    if (m_lootState != ITEM_LOOT_NONE && m_lootState != ITEM_LOOT_UNCHANGED && m_lootState != ITEM_LOOT_TEMPORARY)
        SetState(ITEM_CHANGED);
}

bool Item::HasTriggeredByAuraSpell(SpellEntry const* spellInfo) const
{
    if (!spellInfo)
        return false;

    ItemPrototype const* proto = GetProto();
    if (!proto)
        return false;

    for (uint32 i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
    {
        _Spell const& spellData = proto->Spells[i];

        // no spell
        if (!spellData.SpellId)
            continue;

        // wrong triggering type
        if (spellData.SpellTrigger != ITEM_SPELLTRIGGER_ON_EQUIP)
            continue;

        // check if it is valid spell
        SpellEntry const* spellproto = sSpellStore.LookupEntry(spellData.SpellId);
        if (!spellproto)
            continue;

        for (uint32 j = 0; j < MAX_EFFECT_INDEX; ++j)
        {
            if (spellproto->EffectTriggerSpell[j] == spellInfo->Id)
                return true;
        }
    }
    return false;
}

bool Item::IsRefundOrSoulboundTradeExpired(Player* owner) const
{
    return GetUInt32Value(ITEM_FIELD_CREATE_PLAYED_TIME) + (2 * HOUR) < owner->GetTotalPlayedTime();
}

// Item Refund

bool Item::IsEligibleForRefund() const
{
    ItemPrototype const* proto = GetProto();
    if (!proto || !(proto->Flags & ITEM_FLAG_REFUNDABLE) || (proto->GetMaxStackSize() != 1))
        return false;

    for (uint32 i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
    {
        _Spell const& spellData = proto->Spells[i];

        if (spellData.SpellCharges > 0)
            return false;
    }

    return true;
}

void Item::SetRefundable(Player* owner, uint32 paidCost, uint16 paidExtendedCost, bool load/*=false*/)
{
    SetFlag(ITEM_FIELD_FLAGS, ITEM_FLAG_REFUNDABLE);

    m_paidCost = paidCost;
    m_paidExtCost = paidExtendedCost;

    if (!load)
    {
        SetUInt32Value(ITEM_FIELD_CREATE_PLAYED_TIME, owner->GetTotalPlayedTime());
        SaveRefundDataToDB();
    }
    
    owner->AddItemWithTimeCheck(GetGUIDLow());
}

void Item::SetNotRefundable(Player* owner, bool changeState/*=true*/)
{
    if (!HasFlag(ITEM_FIELD_FLAGS, ITEM_FLAG_REFUNDABLE))
        return;

    RemoveFlag(ITEM_FIELD_FLAGS, ITEM_FLAG_REFUNDABLE);
    SetUInt32Value(ITEM_FIELD_CREATE_PLAYED_TIME, 0);

    if (changeState)
        SetState(ITEM_CHANGED, owner);

    m_paidCost = 0;
    m_paidExtCost = 0;

    DeleteRefundDataFromDB();
    owner->RemoveItemWithTimeCheck(GetGUIDLow());
}

void Item::DeleteRefundDataFromDB()
{
    static SqlStatementID delRefund;
    SqlStatement stmt = CharacterDatabase.CreateStatement(delRefund, "DELETE FROM item_refund_instance WHERE itemGuid = ?");
    stmt.PExecute(GetGUIDLow());
}

void Item::SaveRefundDataToDB()
{
    Player* owner = GetOwner();
    if (!owner)
        return;

    static SqlStatementID saveRefund;
    SqlStatement stmt = CharacterDatabase.CreateStatement(saveRefund, "REPLACE INTO item_refund_instance (itemGuid, playerGuid, paidMoney, paidExtendedCost) VALUES (?, ?, ?, ?)");
    stmt.PExecute(GetGUIDLow(), owner->GetGUIDLow(), m_paidCost, m_paidExtCost);
}

bool Item::LoadRefundDataFromDB(Player* owner)
{
    bool failed = true;

    if (!IsRefundOrSoulboundTradeExpired(owner))
    {
        QueryResult* result = CharacterDatabase.PQuery("SELECT paidMoney, paidExtendedCost FROM item_refund_instance WHERE itemGuid = %u AND playerGuid = %u", GetGUIDLow(), owner->GetGUIDLow());
        if (result)
        {
            Field* fields = result->Fetch();
            SetRefundable(owner, fields[0].GetUInt32(), fields[1].GetUInt16(), true);
            delete result;
            failed = false;
        }
    }
    else
        DeleteRefundDataFromDB();

    if (failed)
    {
        RemoveFlag(ITEM_FIELD_FLAGS, ITEM_FLAG_REFUNDABLE);
        SetUInt32Value(ITEM_FIELD_CREATE_PLAYED_TIME, 0);
        return false;
    }

    return true;
}

bool Item::CheckRefundExpired(Player* owner)
{
    if (!HasFlag(ITEM_FIELD_FLAGS, ITEM_FLAG_REFUNDABLE))
        return true;

    if (IsRefundOrSoulboundTradeExpired(owner))
    {
        SetNotRefundable(owner);
        return true;
    }

    return false;
}

// SoulboundTrade

bool Item::IsEligibleForSoulboundTrade(AllowedLooterSet* allowedLooters) const
{
    ItemPrototype const* proto = GetProto();
    if (!proto || (proto->Flags & ITEM_FLAG_LOOTABLE) || (proto->GetMaxStackSize() != 1) || !allowedLooters || !IsSoulBound())
        return false;

    uint32 ownerGuid = GetOwnerGuid().GetCounter();
    for (AllowedLooterSet::const_iterator itr = allowedLooters->begin(); itr != allowedLooters->end(); ++itr)
    {
        if (*itr == ownerGuid) // own
            continue;

        return true;
    }

    return false;
}

void Item::SetSoulboundTradeable(Player* owner, AllowedLooterSet* allowedLooters, bool load/*=false*/)
{
    if (!allowedLooters || allowedLooters->empty())
        return;

    m_allowedLooterGuids = *allowedLooters;
    SetFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_BOP_TRADEABLE);

    if (!load)
    {
        SetUInt32Value(ITEM_FIELD_CREATE_PLAYED_TIME, owner->GetTotalPlayedTime());
        SaveSoulboundTradeableToDB();
    }

    owner->AddItemWithTimeCheck(GetGUIDLow());
}

void Item::SetNotSoulboundTradeable(Player* owner, bool load/*=false*/)
{
    if (!HasFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_BOP_TRADEABLE))
        return;

    m_allowedLooterGuids.clear();
    DeleteSoulboundTradeableFromDB();

    RemoveFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_BOP_TRADEABLE);
    SetUInt32Value(ITEM_FIELD_CREATE_PLAYED_TIME, 0);

    if (!load)
    {
        SetState(ITEM_CHANGED, owner);
        owner->RemoveItemWithTimeCheck(GetGUIDLow());
    }
}

void Item::DeleteSoulboundTradeableFromDB()
{
    static SqlStatementID delData;
    SqlStatement stmt = CharacterDatabase.CreateStatement(delData, "DELETE FROM item_soulbound_trade_data WHERE itemGuid = ?");
    stmt.PExecute(GetGUIDLow());
}

void Item::SaveSoulboundTradeableToDB()
{
    std::ostringstream ss;
    if (!m_allowedLooterGuids.empty())
    {
        AllowedLooterSet::const_iterator itr = m_allowedLooterGuids.begin();
        ss << *itr;
        for (++itr; itr != m_allowedLooterGuids.end(); ++itr)
            ss << ' ' << *itr;
    }

    static SqlStatementID saveData;
    SqlStatement stmt = CharacterDatabase.CreateStatement(saveData, "REPLACE INTO item_soulbound_trade_data (itemGuid, allowedPlayers) VALUES (?, ?)");
    stmt.PExecute(GetGUIDLow(), ss.str().c_str());
}

bool Item::LoadSoulboundTradeableDataFromDB(Player* owner)
{
    QueryResult* result = CharacterDatabase.PQuery("SELECT allowedPlayers FROM item_soulbound_trade_data WHERE itemGuid = %u", GetGUIDLow());
    if (result)
    {
        Field* fields = result->Fetch();
        std::string guidsStr = fields[0].GetCppString();
        delete result;

        Tokens guidList(guidsStr, ' ');

        AllowedLooterSet looters;
        for (Tokens::iterator itr = guidList.begin(); itr != guidList.end(); ++itr)
            looters.insert(atol(*itr));

        if (!looters.empty())
            SetSoulboundTradeable(owner, &looters, true);
        else
            SetNotSoulboundTradeable(owner, true);

        return !looters.empty();
    }
    else
    {
        SetNotSoulboundTradeable(owner, true);
        return false;
    }
}

bool Item::CheckSoulboundTradeExpire(Player* owner)
{
    if (!HasFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_BOP_TRADEABLE))
        return true;

    if (IsRefundOrSoulboundTradeExpired(owner))
    {
        SetNotSoulboundTradeable(owner);
        return true;
    }

    return false;
}

void Item::AddToWorld()
{
    Object::AddToWorld();
}

void Item::RemoveFromWorld(bool remove)
{
    Object::RemoveFromWorld(remove);
}
