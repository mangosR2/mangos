#include "../pchdef.h"
#include "AhBotConfig.h"
#include "SystemConfig.h"

using namespace std;

INSTANTIATE_SINGLETON_1(AhBotConfig);

AhBotConfig::AhBotConfig()
{
}

bool AhBotConfig::Initialize()
{
    if (!config.SetSource(_AUCTIONHOUSEBOT_CONFIG))
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
    itemBuyInterval = config.GetIntDefault("AhBot.ItemBuyInterval", 3600 * 4);
    alwaysAvailableMoney = config.GetIntDefault("AhBot.AlwaysAvailableMoney", 10000);
    priceMultiplier = config.GetFloatDefault("AhBot.PriceMultiplier", 1.0f);
    defaultMinPrice = config.GetIntDefault("AhBot.DefaultMinPrice", 20);
    maxItemLevel = config.GetIntDefault("AhBot.MaxItemLevel", 199);
    maxRequiredLevel = config.GetIntDefault("AhBot.MaxRequiredLevel", 80);
    priceQualityMultiplier = config.GetFloatDefault("AhBot.PriceQualityMultiplier", 1.0f);
    underPriceProbability = config.GetFloatDefault("AhBot.UnderPriceProbability", 0.05f);
    buyProbability = config.GetFloatDefault("AhBot.BuyProbability", 0.25f);
    sellProbability = config.GetFloatDefault("AhBot.SellProbability", 1.0f);

    return enabled;
}
