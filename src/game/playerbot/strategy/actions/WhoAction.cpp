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

    int spec = AiFactory::GetPlayerSpecTab(bot);
    out << "|h|cffffffff" << chat->formatClass(bot, spec);
    out << "|h|cff00ff00 (" << bot->getLevel() << "|h|cffffffff lvl), ";

    ItemCountByQuality visitor;
    IterateItems(&visitor, ITERATE_ITEMS_IN_EQUIP);

    bool needSlash = false;
    if (visitor.count[ITEM_QUALITY_EPIC])
    {
        out << "|h|cffff00ff" << visitor.count[ITEM_QUALITY_EPIC] << "|h|cffffffff";
        needSlash = true;
    }

    if (visitor.count[ITEM_QUALITY_RARE])
    {
        if (needSlash) out << "/";
        out << "|h|cff8080ff" << visitor.count[ITEM_QUALITY_RARE] << "|h|cffffffff";
        needSlash = true;
    }

    if (visitor.count[ITEM_QUALITY_UNCOMMON])
    {
        if (needSlash) out << "/";
        out << "|h|cff00ff00" << visitor.count[ITEM_QUALITY_UNCOMMON] << "|h|cffffffff";
        needSlash = true;
    }

    if (needSlash)
    {
        out << " gear (|h|cff00ff00" << bot->GetEquipGearScore(false, false) << "|h|cffffffff GS)";
    }


    // ignore random bot chat filter
    WorldPacket data(SMSG_MESSAGECHAT, 1024);
    bot->BuildPlayerChat(&data, CHAT_MSG_WHISPER, out.str(), LANG_UNIVERSAL);
    master->GetSession()->SendPacket(&data);
    return true;
}
