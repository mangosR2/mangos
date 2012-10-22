#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "../values/LastMovementValue.h"
#include "MovementActions.h"
#include "../../../MotionMaster.h"
#include "../../../MovementGenerator.h"
#include "../../FleeManager.h"
#include "../../LootObjectStack.h"
#include "../../PlayerbotAIConfig.h"

using namespace ai;

bool MovementAction::MoveNear(uint32 mapId, float x, float y, float z, float distance)
{
    float angle = GetFollowAngle();
    return MoveTo(mapId, x + cos(angle) * distance, y + sin(angle) * distance, z);
}

bool MovementAction::MoveNear(WorldObject* target, float distance)
{
    if (!target)
        return false;

    float followAngle = GetFollowAngle();
    for (float angle = followAngle - M_PI; angle <= followAngle + M_PI; angle += M_PI / 4)
    {
        bool moved = MoveTo(target->GetMapId(),
            target->GetPositionX() + cos(angle) * distance,
            target->GetPositionY()+ sin(angle) * distance,
            target->GetPositionZ());
        if (moved)
            return true;
    }
    return false;
}

bool MovementAction::MoveTo(uint32 mapId, float x, float y, float z)
{
    if (!IsMovingAllowed(mapId, x, y, z))
        return false;

    float distance = bot->GetDistance(x, y, z);
    if (distance > sPlayerbotAIConfig.meleeDistance / 2)
    {
        WaitForReach(distance);

        if (bot->IsSitState())
            bot->SetStandState(UNIT_STAND_STATE_STAND);

        bot->CastStop();

        bool generatePath = bot->GetAurasByType(SPELL_AURA_MOD_FLIGHT_SPEED_MOUNTED).empty() &&
                !bot->IsFlying() && !bot->IsUnderWater();
        MotionMaster &mm = *bot->GetMotionMaster();
        mm.Clear();
        mm.MovePoint(mapId, x, y, z, generatePath);
    }

    AI_VALUE(LastMovement&, "last movement").Set(x, y, z, bot->GetOrientation());
    return true;
}

bool MovementAction::MoveTo(WorldObject* target)
{
    return MoveTo(target->GetMapId(), target->GetPositionX(), target->GetPositionY(), target->GetPositionZ());
}

bool MovementAction::MoveTo(Unit* target, float distance)
{
    if (!IsMovingAllowed(target))
        return false;

    float bx = bot->GetPositionX();
    float by = bot->GetPositionY();
    float bz = bot->GetPositionZ();

    float tx = target->GetPositionX();
    float ty = target->GetPositionY();
    float tz = target->GetPositionZ();

    float distanceToTarget = bot->GetDistance(target);
    float angle = bot->GetAngle(target);
    float needToGo = distanceToTarget - distance;

    float maxDistance = 2 * bot->GetSpeed(MOVE_RUN);
    if (needToGo > 0 && needToGo > maxDistance)
        needToGo = maxDistance;
    else if (needToGo < 0 && needToGo < -maxDistance)
        needToGo = -maxDistance;

    float dx = cos(angle) * needToGo + bx;
    float dy = sin(angle) * needToGo + by;

    return MoveTo(target->GetMapId(), dx, dy, tz);
}

float MovementAction::GetFollowAngle()
{
    Group* group = bot->GetGroup();
    if (!group)
        return 0.0f;

    GroupReference *gref = group->GetFirstMember();
    int index = 1;
    while( gref )
    {
        if( gref->getSource() == bot)
            return 2 * M_PI / (group->GetMembersCount() -1) * index;

        gref = gref->next();
        index++;
    }
    return 0;
}

bool MovementAction::IsMovingAllowed(Unit* target)
{
    if (!target)
        return false;

    if (bot->GetMapId() != target->GetMapId())
        return false;

    float distance = bot->GetDistance(target);
    if (distance > sPlayerbotAIConfig.reactDistance)
        return false;

    return IsMovingAllowed();
}

bool MovementAction::IsMovingAllowed(uint32 mapId, float x, float y, float z)
{
    float distance = bot->GetDistance(x, y, z);
    if (distance > sPlayerbotAIConfig.reactDistance)
        return false;

    return IsMovingAllowed();
}

bool MovementAction::IsMovingAllowed()
{
    if (bot->isFrozen() || bot->IsPolymorphed() ||
            (bot->isDead() && !bot->GetCorpse()) ||
            bot->IsBeingTeleported() || bot->isInRoots())
        return false;

    MotionMaster &mm = *bot->GetMotionMaster();
    return mm.GetCurrentMovementGeneratorType() != FLIGHT_MOTION_TYPE;
}

bool MovementAction::Follow(Unit* target, float distance)
{
    return Follow(target, distance, GetFollowAngle());
}

bool MovementAction::Follow(Unit* target, float distance, float angle)
{
    MotionMaster &mm = *bot->GetMotionMaster();

    if (bot->GetDistance2d(master->GetPositionX(), master->GetPositionY()) <= sPlayerbotAIConfig.sightDistance &&
            abs(bot->GetPositionZ() - master->GetPositionZ()) >= sPlayerbotAIConfig.spellDistance)
    {
        mm.Clear();
        float x = bot->GetPositionX(), y = bot->GetPositionY(), z = master->GetPositionZ();
        if (master->GetMapId() && bot->GetMapId() != master->GetMapId())
        {
            bot->TeleportTo(master->GetMapId(), x, y, z, bot->GetOrientation());
        }
        else
        {
            bot->SetPosition(x, y, z, bot->GetOrientation(), true);
        }
        AI_VALUE(LastMovement&, "last movement").Set(target);
        return true;
    }

    if (!IsMovingAllowed(target))
        return false;

    if (target->IsFriendlyTo(bot) && bot->IsMounted() && AI_VALUE(list<ObjectGuid>, "possible targets").empty())
        distance += angle;

	bool canMove = MoveNear(target, distance);
	if (!canMove)
		return false;
    //mm.MoveFollow(target, distance, angle);

    AI_VALUE(LastMovement&, "last movement").Set(target);
    return true;
}

void MovementAction::WaitForReach(float distance)
{
    float delay = 1000.0f * distance / bot->GetSpeed(MOVE_RUN) + sPlayerbotAIConfig.reactDelay;

    if (delay > sPlayerbotAIConfig.globalCoolDown)
        delay = sPlayerbotAIConfig.globalCoolDown;

    ai->SetNextCheckDelay((uint32)delay);
}

bool MovementAction::Flee(Unit *target)
{
    if (!target)
        target = master;

    if (!IsMovingAllowed())
        return false;

    FleeManager manager(bot, sPlayerbotAIConfig.fleeDistance, GetFollowAngle());

    float rx, ry, rz;
    if (!manager.CalculateDestination(&rx, &ry, &rz))
        return false;

    return MoveTo(0, rx, ry, rz);
}

bool FleeAction::Execute(Event event)
{
    return Flee(AI_VALUE(Unit*, "current target"));
}

bool FleeAction::isUseful()
{
    return AI_VALUE(uint8, "attacker count") > 0 &&
            AI_VALUE2(float, "distance", "current target") <= sPlayerbotAIConfig.tooCloseDistance;
}

bool RunAwayAction::Execute(Event event)
{
    return Flee(AI_VALUE(Unit*, "master target"));
}

bool MoveRandomAction::Execute(Event event)
{
    WorldObject* target = NULL;

    if (!(rand() % 3))
    {
        list<ObjectGuid> npcs = AI_VALUE(list<ObjectGuid>, "nearest npcs");
        if (!npcs.empty())
        {
            size_t pos = rand() % npcs.size();
            for (list<ObjectGuid>::iterator i = npcs.begin(); i != npcs.end() && pos; i++)
            {
                target = ai->GetUnit(*i);
                pos--;

                if (target && !pos)
                {
                    ostringstream out; out << "I will check " << target->GetName();
                    ai->TellMaster(out);
                }
            }
        }
    }

    if (!target || !(rand() % 3))
    {
        list<ObjectGuid> gos = AI_VALUE(list<ObjectGuid>, "nearest game objects");
        if (!gos.empty())
        {
            size_t pos = rand() % gos.size();
            for (list<ObjectGuid>::iterator i = gos.begin(); i != gos.end() && pos; i++)
            {
                target = ai->GetGameObject(*i);
                pos--;

                if (target && !pos)
                {
                    AI_VALUE(LootObjectStack*, "available loot")->Add(target->GetObjectGuid());
                    ostringstream out; out << "I will check " << chat->formatGameobject((GameObject*)target);
                    ai->TellMaster(out);
                }
            }
        }
    }

    float distance = (rand() % 15) / 10.0f;

    if (!target || !(rand() % 3))
    {
        float x = bot->GetPositionX();
        float y = bot->GetPositionY();
        float z = bot->GetPositionZ();
        x += urand(0, sPlayerbotAIConfig.sightDistance) - sPlayerbotAIConfig.sightDistance / 2;
        y += urand(0, sPlayerbotAIConfig.sightDistance) - sPlayerbotAIConfig.sightDistance / 2;
        bot->UpdateGroundPositionZ(x, y, z);
        return MoveNear(bot->GetMapId(), x, y, z, distance);
    }

    return MoveNear(target);
}

bool MoveToLootAction::Execute(Event event)
{
    LootObject loot = AI_VALUE(LootObject, "loot target");
    if (!loot.IsLootPossible(bot))
        return false;

    return MoveNear(loot.GetWorldObject(bot));
}

bool MoveOutOfEnemyContactAction::Execute(Event event)
{
    Unit* target = AI_VALUE(Unit*, "current target");
    if (!target)
        return false;

    return MoveNear(target, sPlayerbotAIConfig.meleeDistance);
}

bool MoveOutOfEnemyContactAction::isUseful()
{
    return AI_VALUE2(float, "distance", "current target") <= sPlayerbotAIConfig.meleeDistance / 2;
}

bool SetFacingTargetAction::Execute(Event event)
{
    Unit* target = AI_VALUE(Unit*, "current target");
    if (!target)
        return false;

    bot->SetFacingTo(bot->GetAngle(target));
    return true;
}

bool SetFacingTargetAction::isUseful()
{
    return !AI_VALUE2(bool, "facing", "current target");
}
