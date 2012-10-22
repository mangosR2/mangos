#pragma once
#include "../Value.h"
#include "../../PlayerbotAIConfig.h"

namespace ai
{
    class NearestGameObjects : public CalculatedValue<list<ObjectGuid> >
	{
	public:
        NearestGameObjects(PlayerbotAI* ai, float range = sPlayerbotAIConfig.sightDistance) :
            CalculatedValue<list<ObjectGuid> >(ai), range(range) {}

    protected:
        virtual list<ObjectGuid> Calculate();

    private:
        float range;
	};
}
