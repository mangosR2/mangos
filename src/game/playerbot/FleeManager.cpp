#include "../pchdef.h"
#include "playerbot.h"
#include "FleeManager.h"

using namespace ai;
using namespace std;

void FleeManager::calculateDistanceToPlayers(FleePoint *point)
{
	Group* group = bot->GetGroup();
	if (!group)
		return;

	for (GroupReference *gref = group->GetFirstMember(); gref; gref = gref->next())
    {
		Player* player = gref->getSource();
		if(player == bot)
			continue;

		float d = player->GetDistance(point->x, point->y, point->z);
		point->toAllPlayers.probe(d);
		switch (player->getClass()) {
			case CLASS_HUNTER:
			case CLASS_MAGE:
			case CLASS_PRIEST:
			case CLASS_WARLOCK:
				point->toRangedPlayers.probe(d);
				break;
			case CLASS_PALADIN:
			case CLASS_ROGUE:
			case CLASS_WARRIOR:
				point->toMeleePlayers.probe(d);
				break;
		}
	}
}

void FleeManager::calculateDistanceToCreatures(FleePoint *point)
{
	RangePair &distance = point->toCreatures;

	list<ObjectGuid> units = *bot->GetPlayerbotAI()->GetAiObjectContext()->GetValue<list<ObjectGuid> >("possible targets");
	for (list<ObjectGuid>::iterator i = units.begin(); i != units.end(); ++i)
    {
		Unit* unit = bot->GetPlayerbotAI()->GetUnit(*i);
		if (!unit)
		    continue;

		float d = unit->GetDistance(point->x, point->y, point->z);
		distance.probe(d);
	}
}

void FleeManager::calculatePossibleDestinations(list<FleePoint*> &points)
{
	float botPosX = bot->GetPositionX();
	float botPosY = bot->GetPositionY();
	float botPosZ = bot->GetPositionZ();

    for (float angle = -M_PI + followAngle; angle < M_PI + followAngle; angle += M_PI / 8)
    {
        float x = botPosX + cos(angle) * maxAllowedDistance;
        float y = botPosY + sin(angle) * maxAllowedDistance;

        if (!bot->IsWithinLOS(x, y, botPosZ))
            continue;

        FleePoint *point = new FleePoint(x, y, botPosZ);
        calculateDistanceToPlayers(point);
        calculateDistanceToCreatures(point);
        points.push_back(point);
    }
}

void FleeManager::cleanup(list<FleePoint*> &points)
{
	for (list<FleePoint*>::iterator i = points.begin(); i != points.end(); i++)
    {
		FleePoint* point = *i;
		delete point;
	}
	points.clear();
}

bool FleePoint::isReasonable()
{
	return toAllPlayers.max <= 30.0f && toCreatures.min >= 15.0f;
}

bool FleePoint::isBetterThan(FleePoint* other)
{
    bool isFartherFromCreatures = (toCreatures.min - other->toCreatures.min) >= 1.0f;
    bool isNearerToRangedPlayers = (toRangedPlayers.max - other->toRangedPlayers.max) <= 1.0f;
    bool isFartherFromMeleePlayers = (toMeleePlayers.min - other->toMeleePlayers.min) >= 1.0f;

    return isFartherFromCreatures && (isNearerToRangedPlayers || isFartherFromMeleePlayers);
}

FleePoint* FleeManager::selectOptimalDestination(list<FleePoint*> &points)
{
	FleePoint* selected = NULL;
	for (list<FleePoint*>::iterator i = points.begin(); i != points.end(); i++)
    {
		FleePoint* point = *i;
		if (!selected || point->isBetterThan(selected))
			selected = point;
	}
	return selected;
}

bool FleeManager::CalculateDestination(float* rx, float* ry, float* rz)
{
	list<FleePoint*> points;
	calculatePossibleDestinations(points);

    FleePoint* point = selectOptimalDestination(points);
    if (!point)
    {
        cleanup(points);
        return false;
    }

	*rx = point->x;
	*ry = point->y;
	*rz = bot->GetPositionZ();

    cleanup(points);
	return true;
}
