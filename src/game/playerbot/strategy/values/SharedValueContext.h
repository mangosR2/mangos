#pragma once;

#include "AttackersValue.h"
#include "AttackerCountValues.h"

namespace ai
{
    class SharedValueContext : public NamedObjectContext<UntypedValue>
    {
    public:
        SharedValueContext() : NamedObjectContext<UntypedValue>(true)
        {
        }

    private:
    };
};
