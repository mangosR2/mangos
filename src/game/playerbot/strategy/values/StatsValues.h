#pragma once
#include "../Value.h"

class Unit;

namespace ai
{
    template<class T>
    class QualifiedStatsValue : public CalculatedValue<T>, public Qualified
	{
	public:
        QualifiedStatsValue(PlayerbotAI* ai) : CalculatedValue<T>(ai) {}

    protected:
        Unit* GetTarget()
        {
            AiObjectContext* ctx = AiObject::context;
            return ctx->GetValue<Unit*>(qualifier)->Get();
        }
    };

    class HealthValue : public QualifiedStatsValue<uint8>
    {
    public:
        HealthValue(PlayerbotAI* ai) : QualifiedStatsValue<uint8>(ai) {}

        virtual uint8 Calculate();
    };

    class IsDeadValue : public QualifiedStatsValue<bool>
    {
    public:
        IsDeadValue(PlayerbotAI* ai) : QualifiedStatsValue<bool>(ai) {}

        virtual bool Calculate();
    };

    class RageValue : public QualifiedStatsValue<uint8>
    {
    public:
        RageValue(PlayerbotAI* ai) : QualifiedStatsValue<uint8>(ai) {}

        virtual uint8 Calculate();
    };

    class EnergyValue : public QualifiedStatsValue<uint8>
    {
    public:
        EnergyValue(PlayerbotAI* ai) : QualifiedStatsValue<uint8>(ai) {}

        virtual uint8 Calculate();
    };

    class ManaValue : public QualifiedStatsValue<uint8>
    {
    public:
        ManaValue(PlayerbotAI* ai) : QualifiedStatsValue<uint8>(ai) {}

        virtual uint8 Calculate();
    };

    class HasManaValue : public QualifiedStatsValue<bool>
    {
    public:
        HasManaValue(PlayerbotAI* ai) : QualifiedStatsValue<bool>(ai) {}

        virtual bool Calculate();
    };

    class ComboPointsValue : public QualifiedStatsValue<uint8>
    {
    public:
        ComboPointsValue(PlayerbotAI* ai) : QualifiedStatsValue<uint8>(ai) {}

        virtual uint8 Calculate();
    };

    class IsMountedValue : public QualifiedStatsValue<bool>
    {
    public:
        IsMountedValue(PlayerbotAI* ai) : QualifiedStatsValue<bool>(ai) {}

        virtual bool Calculate();
    };

}
