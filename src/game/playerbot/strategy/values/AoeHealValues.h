#pragma once
#include "../Value.h"

namespace ai
{
    class AoeHealValue : public CalculatedValue<uint8>, public Qualified
	{
	public:
    	AoeHealValue(PlayerbotAI* ai) : CalculatedValue<uint8>(ai) {}

    public:
    	virtual uint8 Calculate();
    };
}
