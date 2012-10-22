#pragma once
#include "../Value.h"
#include "TargetValue.h"

namespace ai
{
   
    class SpellIdValue : public CalculatedValue<uint32>, public Qualified
	{
	public:
        SpellIdValue(PlayerbotAI* ai) : CalculatedValue<uint32>(ai) {}
      
    public:
        virtual uint32 Calculate();

    };
}
