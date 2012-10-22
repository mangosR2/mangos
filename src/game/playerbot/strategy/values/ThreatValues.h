#pragma once
#include "../Value.h"

namespace ai
{
    class ThreatValue : public CalculatedValue<uint8>
	{
	public:
        ThreatValue(PlayerbotAI* ai) : CalculatedValue<uint8>(ai) {}

    public:
    	virtual uint8 Calculate();
    };
}
