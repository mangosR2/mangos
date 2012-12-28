#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "WhoAction.h"
#include "../../AiFactory.h"

using namespace ai;

class ItemCountByQuality : public IterateItemsVisitor
{
public:
    ItemCountByQuality() : IterateItemsVisitor()
    {
        for (uint32 i = 0; i < MAX_ITEM_QUALITY; ++i)
            count[i] = 0;
    }

    virtual bool Visit(Item* item)
    {
        count[item->GetProto()->Quality]++;
        return true;
    }

public:
    map<uint32, int> count;
};

bool WhoAction::Execute(Event event)
{
    ostringstream out;

    out << "|h|cffffffff" << chat->formatClass(bot->getClass(), AiFactory::GetPlayerSpecTab(bot));
    out << " |h|cff00ff00" << bot->getLevel() << "|h|cffffffff lvl ";

    ItemCountByQuality visitor;
    IterateItems(&visitor, ITERATE_ITEMS_IN_EQUIP);

    if (visitor.count[ITEM_QUALITY_EPIC])
        out << "|h|cffff00ff" << visitor.count[ITEM_QUALITY_EPIC] << "|h|cffffffff/";
    if (visitor.count[ITEM_QUALITY_RARE])
        out << "|h|cff8080ff" << visitor.count[ITEM_QUALITY_RARE] << "|h|cffffffff/";
    if (visitor.count[ITEM_QUALITY_UNCOMMON])
        out << "|h|cff00ff00" << visitor.count[ITEM_QUALITY_UNCOMMON] << "|h|cffffffff/";

    out << bot->GetEquipGearScore(false, false);

    // ignore random bot chat filter
    WorldPacket data(SMSG_MESSAGECHAT, 1024);
    bot->BuildPlayerChat(&data, CHAT_MSG_WHISPER, out.str(), LANG_UNIVERSAL);
    master->GetSession()->SendPacket(&data);
    return true;
}
