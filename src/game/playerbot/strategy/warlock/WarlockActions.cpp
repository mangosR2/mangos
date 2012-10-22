#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "WarlockActions.h"

using namespace ai;

Value<Unit*>* CastBanishAction::GetTargetValue()
{
    return context->GetValue<Unit*>("cc target", getName());
}
