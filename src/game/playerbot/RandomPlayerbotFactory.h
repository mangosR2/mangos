#ifndef _RandomPlayerbotFactory_H
#define _RandomPlayerbotFactory_H

#include "Common.h"
#include "PlayerbotAIBase.h"

class WorldPacket;
class Player;
class Unit;
class Object;
class Item;

using namespace std;

class MANGOS_DLL_SPEC RandomPlayerbotFactory
{
    public:
        RandomPlayerbotFactory(uint32 accountId) : accountId(accountId) {}
		virtual ~RandomPlayerbotFactory() {}

	public:
        bool CreateRandomBot();

	private:
        string CreateRandomBotName();

    private:
        uint32 accountId;
};

#endif
