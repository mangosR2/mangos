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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

#ifndef WORLD_PVP_SI
#define WORLD_PVP_SI

enum
{
    // npcs
    NPC_SILITHUS_DUST_QUEST_ALY     = 17090,        // dummy npcs for quest credit
    NPC_SILITHUS_DUST_QUEST_HORDE   = 18199,

    // game objects
    GO_SILITHYST_MOUND              = 181597,       // created when a player drops the flag
    GO_SILITHYST_GEYSER             = 181598,       // spawn on the map by default

    // spells
    //SPELL_SILITHYST_OBJECT          = 29518,        // unk, related to the GO
    SPELL_SILITHYST                 = 29519,        // buff recieved when you are carrying a silithyst
    SPELL_TRACES_OF_SILITHYST       = 29534,        // individual buff recieved when succesfully delivered a silithyst
    SPELL_CENARION_FAVOR            = 30754,        // zone buff recieved when a faction gathers 200 silithysts
    SPELL_SILITHYST_FLAG_DROP       = 29533,        // drop the flag

    // quests
    QUEST_SCOURING_DESERT_ALY       = 9419,
    QUEST_SCOURING_DESERT_HORDE     = 9422,

    // zone ids
    ZONE_ID_SILITHUS                = 1377,
    ZONE_ID_TEMPLE_OF_AQ            = 3428,         // ToDo - research
    ZONE_ID_RUINS_OF_AQ             = 3429,         // don't know yet how to handle the buff inside the instances
    ZONE_ID_GATES_OF_AQ             = 3478,         // not sure if needed

    // area triggers
    AREATRIGGER_SILITHUS_ALY        = 4162,         // areatriggers ids
    AREATRIGGER_SILITHUS_HORDE      = 4168,

    FACTION_CENARION_CIRCLE         = 609,
    HONOR_REWARD_SILITHYST          = 19,
    REPUTATION_REWARD_SILITHYST     = 20,
    MAX_SILITHYST                   = 200,

    // world states
    WORLD_STATE_SI_GATHERED_A       = 2313,         // world state ids
    WORLD_STATE_SI_GATHERED_H       = 2314,
    WORLD_STATE_SI_SILITHYST_MAX    = 2317,
};

struct SilithusLocations
{
    float m_fX, m_fY, m_fZ;
};

// Area trigger location - workaround to check the flag drop handling
static SilithusLocations aSilithusLocs[2] =
{
    {-7142.04f, 1397.92f, 4.327f},      // aly
    {-7588.48f, 756.806f, -16.425f}     // horde
};

class WorldPvPSI : public WorldPvP
{
    public:
        WorldPvPSI();

        bool InitWorldPvPArea();

        void HandlePlayerEnterZone(Player* pPlayer);
        void HandlePlayerLeaveZone(Player* pPlayer);

        void FillInitialWorldStates(WorldPacket& data, uint32& count);
        void SendRemoveWorldStates(Player* pPlayer);
        void UpdateWorldState();

        bool HandleAreaTrigger(Player* pPlayer, uint32 uiTriggerId);
        bool HandleObjectUse(Player* pPlayer, GameObject* pGo);
        bool HandleDropFlag(Player* pPlayer, uint32 uiSpellId);

    private:
        uint32 m_uiResourcesAly;
        uint32 m_uiResourcesHorde;
        uint32 m_uiLastControllerTeam;
};

#endif
