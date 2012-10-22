#pragma once
#include "StatsValues.h"

namespace ai
{
   
    class AttackerCountValue : public QualifiedStatsValue<uint8>
    {
    public:
        AttackerCountValue(PlayerbotAI* ai) : QualifiedStatsValue<uint8>(ai) {}

        virtual uint8 Calculate();
    };

    class MyAttackerCountValue : public QualifiedStatsValue<uint8>
    {
    public:
        MyAttackerCountValue(PlayerbotAI* ai) : QualifiedStatsValue<uint8>(ai) {}

        virtual uint8 Calculate();
    };

    class HasAggroValue : public QualifiedStatsValue<bool>
    {
    public:
        HasAggroValue(PlayerbotAI* ai) : QualifiedStatsValue<bool>(ai) {}

        virtual bool Calculate();
    };
    
    class BalancePercentValue : public QualifiedStatsValue<uint8>
    {
    public:
        BalancePercentValue(PlayerbotAI* ai) : QualifiedStatsValue<uint8>(ai) {}

        virtual uint8 Calculate();
    };

}
