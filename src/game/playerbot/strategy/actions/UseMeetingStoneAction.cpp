#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "UseMeetingStoneAction.h"

#include "../../../GridNotifiers.h"
#include "../../../GridNotifiersImpl.h"
#include "../../../CellImpl.h"
#include "../../PlayerbotAIConfig.h"

namespace MaNGOS
{
    class GameObjectByGuidInRangeCheck
    {
    public:
        GameObjectByGuidInRangeCheck(WorldObject const* obj, ObjectGuid guid, float range) : i_obj(obj), i_range(range), i_guid(guid) {}
        WorldObject const& GetFocusObject() const { return *i_obj; }
        bool operator()(GameObject* u)
        {
            if (u && i_obj->IsWithinDistInMap(u, i_range) && u->isSpawned() && u->GetGOInfo() && u->GetObjectGuid() == i_guid)
                return true;

            return false;
        }
    private:
        WorldObject const* i_obj;
        float i_range;
        ObjectGuid i_guid;
    };
};

bool UseMeetingStoneAction::Execute(Event event)
{
    WorldPacket p(event.getPacket());
    p.rpos(0);
    ObjectGuid guid;
    p >> guid;

    if (master->GetSelectionGuid() && master->GetSelectionGuid() != bot->GetObjectGuid())
        return false;

    if (!master->GetSelectionGuid() && master->GetGroup() != bot->GetGroup())
        return false;

    if (master->IsBeingTeleported())
        return false;

    list<GameObject*> targets;

    MaNGOS::GameObjectByGuidInRangeCheck u_check(master, guid, sPlayerbotAIConfig.sightDistance);
    MaNGOS::GameObjectListSearcher<MaNGOS::GameObjectByGuidInRangeCheck> searcher(targets, u_check);
    Cell::VisitAllObjects(master, searcher, sPlayerbotAIConfig.sightDistance);

    GameObject* gameObject = NULL;
    for(list<GameObject*>::iterator i = targets.begin(); i != targets.end(); i++)
    {
        GameObject* go = *i;
        if (go && go->isSpawned())
        {
            gameObject = go;
            break;
        }
    }

    if (!gameObject)
        return false;

    const GameObjectInfo* goInfo = gameObject->GetGOInfo();
    if (!goInfo || goInfo->type != GAMEOBJECT_TYPE_SUMMONING_RITUAL)
        return false;

    PlayerbotChatHandler ch(master);
    if (!ch.teleport(*bot))
    {
        ai->TellMaster("You cannot summon me");
        return false;
    }

    return true;
}


bool SummonAction::Execute(Event event)
{
    if (!master->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_RESTING) && master->GetSession()->GetSecurity() < SEC_GAMEMASTER)
    {
        ai->TellMaster("You must be in a city or inn to summon me");
        return false;
    }

    PlayerbotChatHandler ch(master);
    if (!ch.teleport(*bot))
    {
        ai->TellMaster("You cannot summon me");
        return false;
    }

    return true;
}
