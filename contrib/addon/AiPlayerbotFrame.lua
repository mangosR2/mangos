-- Author      : ike3

botlist = {}

function AiPlayerbotFrame_OnLoad(self)
	print("Loading AiPlayerbot...")
    self:RegisterEvent("CHAT_MSG_WHISPER")
    self:RegisterEvent("PARTY_MEMBERS_CHANGED")
    QueryBots()
end

function AiPlayerbotFrame_OnEvent(self, event, ...)
    if (event == "CHAT_MSG_WHISPER") then
        HandleWhisper(...)
    elseif (event == "PARTY_MEMBERS_CHANGED") then
        QueryBots()
    end
end

function AiPlayerbotFrame_OnUpdate()
end

function AiPlayerbotFrame_OnClick()
    SendToBots("co ?", function(bot, message)
        bot.co = message
        Update(bot)
        SendToBot(bot, "nc ?", function(bot, message)
            bot.nc = message
            Update(bot)
        end)
    end)
end

function Update(bot)
    print(bot.name .. " co " .. bot.co .. ", nc " .. bot.nc)
end

function QueryBots()
    botlist = {}
    IterateParty(function(name)
        SendChatMessage("botquery", WHISPER, nil, name)
    end)
end

function HandleWhisper(message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter, guid)
    if (message == nil) then
        return
    end

    if (string.find(message, "botquery")) then
        AddBot(sender)
    end

    if (botlist[sender]) then
        HandleBotWhisper(sender, message)
    end
end

function HandleBotWhisper(sender, message)
    local bot = botlist[sender]
    if (bot and bot.command and bot.callback) then
        bot.callback(bot, message)
    elseif (bot) then
    end
end

function AddBot(botName)
    print(botName .. " is a bot")
    botlist[botName] = {name = botName}
end

function IterateParty(action)
	local a,b = GetNumRaidMembers(), "raid" 
    if a == 0 then 
        a = GetNumPartyMembers() 
        b="party" 
    end 

	for i = 1, a do 
        local name=GetUnitName(b..i, false)
        action(name)
	end
end

function SendToBots(command, callback)
    IterateParty(function(name) 
        local bot = botlist[name]
        if (bot) then
            bot.command = command
            bot.callback = callback
            bot.co = "?"
            bot.nc = "?"
            SendChatMessage(command, WHISPER, nil, name)
        end
    end)
end

function SendToBot(bot, command, callback)
    bot.command = command
    bot.callback = callback
    SendChatMessage(command, WHISPER, nil, bot.name)
end