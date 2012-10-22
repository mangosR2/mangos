#include "../pchdef.h"
#include "AhBotConfig.h"
#include "Policies/SingletonImp.h"

using namespace std;

INSTANTIATE_SINGLETON_1(AhBotConfig);

AhBotConfig::AhBotConfig()
{
}

bool AhBotConfig::Initialize()
{
    if (!config.SetSource("ahbot.conf"))
    {
        sLog.outString("AhBot is Disabled. Unable to open configuration file ahbot.conf");
        return false;
    }

    enabled = config.GetBoolDefault("AhBot.Enabled", true);
    account = config.GetIntDefault("AhBot.Account", 0);
    guid = (uint64)config.GetIntDefault("AhBot.GUID", 0);
    if (!account || !guid)
        enabled = false;

    if (!enabled)
        sLog.outString("AhBot is Disabled in ahbot.conf");

    updateInterval = config.GetIntDefault("AhBot.UpdateIntervalInSeconds", 300);
    historyDays = config.GetIntDefault("AhBot.History.Days", 30);
    alwaysAvailableMoney = config.GetIntDefault("AhBot.AlwaysAvailableMoney", 10000);
    priceMultiplier = config.GetFloatDefault("AhBot.PriceMultiplier", 1.0f);
    defaultMinPrice = config.GetIntDefault("AhBot.DefaultMinPrice", 20);
    maxItemLevel = config.GetIntDefault("AhBot.MaxItemLevel", 300);
    priceQualityMultiplier = config.GetFloatDefault("AhBot.PriceQualityMultiplier", 1.0f);
    underPriceProbability = config.GetFloatDefault("AhBot.UnderPriceProbability", 0.05f);
    buyProbability = config.GetFloatDefault("AhBot.BuyProbability", 0.25f);
    sellProbability = config.GetFloatDefault("AhBot.SellProbability", 0.15f);

    return enabled;
}
