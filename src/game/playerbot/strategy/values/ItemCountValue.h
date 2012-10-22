#pragma once
#include "../Value.h"
#include "../ItemVisitors.h"
#include "../actions/InventoryAction.h"

namespace ai
{
    class InventoryItemValueBase : public InventoryAction
    {
    public:
        InventoryItemValueBase(PlayerbotAI* ai) : InventoryAction(ai, "empty") {}
        virtual bool Execute(Event event) { return false; }

    protected:
        list<Item*> Find(string qualifier);
    };

    class ItemCountValue : public CalculatedValue<uint8>, public Qualified, InventoryItemValueBase
	{
	public:
        ItemCountValue(PlayerbotAI* ai) : CalculatedValue<uint8>(ai), InventoryItemValueBase(ai) {}

    public:
        virtual uint8 Calculate();
	};

    class InventoryItemValue : public CalculatedValue<list<Item*> >, public Qualified, InventoryItemValueBase
    {
    public:
        InventoryItemValue(PlayerbotAI* ai) : CalculatedValue<list<Item*> >(ai), InventoryItemValueBase(ai) {}

    public:
        virtual list<Item*> Calculate();
    };
}
