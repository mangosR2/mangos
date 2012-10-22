#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "TradeStatusAction.h"

#include "../ItemVisitors.h"
#include "../../PlayerbotAIConfig.h"

using namespace ai;



bool TradeStatusAction::Execute(Event event)
{
    Player* trader = bot->GetTrader();
    if (!trader)
        return false;

    if (trader != master)
    {
        WorldPacket data(SMSG_MESSAGECHAT, 1024);
        bot->BuildPlayerChat(&data, CHAT_MSG_WHISPER, "I'm kind of busy now", LANG_UNIVERSAL);
        trader->GetSession()->SendPacket(&data);
        return false;
    }

    if (!bot->GetGroup() && !master->GetRandomPlayerbotMgr()->IsRandomBot(bot))
    {
        ai->TellMaster("I'm kind of busy now");
        return false;
    }

    WorldPacket p(event.getPacket());
    p.rpos(0);
    uint32 status;
    p >> status;

    if (status == TRADE_STATUS_TRADE_ACCEPT)
    {
        WorldPacket p;
        uint32 status = 0;
        p << status;
        bot->GetSession()->HandleAcceptTradeOpcode(p);
        return true;
    }
    else if (status == TRADE_STATUS_BEGIN_TRADE)
    {
        if (!bot->isInFront(trader, sPlayerbotAIConfig.spellDistance, M_PI / 2))
            bot->SetFacingToObject(trader);
        BeginTrade();
        return true;
    }

    return false;
}


void TradeStatusAction::BeginTrade()
{
    WorldPacket p;
    bot->GetSession()->HandleBeginTradeOpcode(p);

    ListItemsVisitor visitor;
    IterateItems(&visitor);

    ai->TellMaster("=== Trade ===");
    TellItems(visitor.items);
}

