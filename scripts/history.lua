cFile = "cHistory.dat"
code = "history"
mHistory = 100  -- maximum lines of chat to cache
sBot = "HubChatHistory"
BadChars = {".","?","!","+","-",}   --disallow command prefixes
cHistory = {}

OnStartup = function()
    if loadfile(cFile) then dofile(cFile) end;
    Core.RegBot(sBot,"History","History",true);
end

OnExit = function()
	if next(cHistory) then local hFile = io.open(cFile,"w+") Serialize(cHistory,"cHistory",hFile); hFile:close() end
end

NewUserConnected = function(user)
    Core.SendToUser(user,"$UserCommand 1 3 Show History$<%[mynick]> +history&#124;");
	tablemaker(user)
end

UserConnected = function(user)
    Core.SendToUser(user,"$UserCommand 1 3 Show History$<%[mynick]> +history&#124;");
	tablemaker(user)
end


function tablemaker(user)
	local str = "\r\n\t<----------------------------------------------------------------------[ Last ( "..#(cHistory).." ) chat messages ]----------->"
    for i = 1, #(cHistory) do str = str.."\r\n\t"..cHistory[i] end
	str = str.."\r\n\t<--------------------------------------------------------[ Please dont reply here . Write your comments in the main page]--------------->"
	Core.SendPmToUser(user,sBot,str);
    --user:SendPM(sBot,str)
end

OpConnected = NewUserConnected
RegConnected = UserConnected

ChatArrival = function(user, data)
    local _,_,cmd = string.find(data,"%b<> %p(%S+)|")
    if cmd and cmd:lower() == code:lower() then
        tablemaker(user)
        Core.SendToNick(user.sNick,"<"..sBot.."> History listed in HubChatHistory bot.+magnets lists magnet links ")
        return true
    end
	local s,e,pre = string.find(data, "^%b<> (.)") local when = os.date("[%H:%M] ") local chat = string.sub(data, 1, -2)
    for k,v in ipairs (BadChars) do if pre == v then return end end -- disallow command input to cached chat
	--for k,v in BadChars do if pre == v then return end end -- disallow command input to cached chat
	table.insert(cHistory,when..chat) if #(cHistory) > mHistory then table.remove(cHistory, 1) end OnExit()
    
end

Serialize = function(tTable,sTableName,hFile,sTab)
	sTab = sTab or "";
	hFile:write(sTab..sTableName.." = {\n");
	for key,value in ipairs (tTable) do
		if (type(value) ~= "function") then
			local sKey = (type(key) == "string") and string.format("[%q]",key) or string.format("[%d]",key);
			if(type(value) == "table") then
				Serialize(value,sKey,hFile,sTab.."\t");
			else
				local sValue = (type(value) == "string") and string.format("%q",value) or tostring(value);
				hFile:write(sTab.."\t"..sKey.." = "..sValue);
			end
			hFile:write(",\n");
		end
	end
	hFile:write(sTab.."}");
end
