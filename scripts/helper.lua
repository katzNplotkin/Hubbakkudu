cFile = "magnets.dat"
fpostData="postcount.dat"
mMagnets = 200  -- maximum lines of chat to cache
sBot = "MagnetLister"
BadChars = {".","?","!","+","-",}   --disallow command prefixes
cMagnets = {}
code="magnets"

OnStartup = function()
    --if loadfile(cFile) then dofile(cFile) end;
    Core.RegBot(sBot,"Magnets","Magnets",true);
    --if loadfile(fpostData) then dofile(fpostData);
	--else
	--	postData = {};
	--end
    --doSaveTable(fpostData,postData,"postData");
    
end


doSaveTable = function(file,table, tablename)
	local hFile = io.open(file,"w+")
	if hFile then
	SaveSerialize(table, tablename, hFile);
	hFile:close()
	end
end

SaveSerialize = function(tTable, sTableName, hFile, sTab)
	sTab = sTab or "";
	hFile:write(sTab..sTableName.." = {\n");
	for key,value in pairs(tTable) do
		if (type(value) ~= "function") then
			local sKey = (type(key) == "string") and string.format("[%q]",key) or string.format("[%d]",key);
			if(type(value) == "table") then
				SaveSerialize(value,sKey,hFile,sTab.."\t");
			else
				local sValue = (type(value) == "string") and string.format("%q",value) or tostring(value);
				hFile:write(sTab.."\t"..sKey.." = "..sValue);
			end
			hFile:write(",\n");
		end
	end
	hFile:write(sTab.."}");
end

OnExit = function()
	if next(cMagnets) then local hFile = io.open(cFile,"w+") Serialize(cMagnets,"cMagnets",hFile); hFile:close() end
end

NewUserConnected = function(user)
    magnetlister(user)
end


UserConnected = function(user)
    magnetlister(user)
end


function tablemaker(user)
    local f = io.open("posts.txt", "r")
    local content = f:read "*a" -- *a or *all reads the whole file
    f:close()
    Core.SendToUser(user,"<Top Posters> "..content)
    local g = io.open("magnets.txt", "r")
    local contentg = g:read "*a" -- *a or *all reads the whole file
    g:close()
    Core.SendPmToUser(user,sBot,"\n"..contentg);
end


function magnetlister(user)
    local g = io.open("magnets.txt", "r")
    local contentg = g:read "*a" -- *a or *all reads the whole file
    g:close()
    Core.SendPmToUser(user,sBot,"\n"..contentg);
end

OpConnected = NewUserConnected
RegConnected = UserConnected

ChatArrival = function(user, data)
    local _,_,cmd = string.find(data,"%b<> %p(%S+)|")
    if cmd and cmd:lower() == code:lower() then
        tablemaker(user)
        Core.SendToNick(user.sNick,"<"..sBot.."> Magnets are listed in MagnetLister bot")
        return true
    end
	local _,_,magnet = data:find("^(%b<> [^%p]-magnet:.xt.urn:tree:tiger.+).")
    local when = os.date("[%H:%M] ")
    --for k,v in ipairs (BadChars) do if pre == v then return end end -- disallow command input to cached chat
    if magnet then
        if loadfile(fpostData) then dofile(fpostData);
        else
            postData = {};
        end
    	if not postData[user.sNick] then
			postData[user.sNick] = 0
		end
		postData[user.sNick]= postData[user.sNick]+ 1;
        doSaveTable(fpostData,postData,"postData");
        local hFile = io.open("magnets.txt","a") hFile:write("\n\t"..when..magnet) hFile:close()
        --table.insert(cMagnets,when..magnet) if #(cMagnets) > mMagnets then table.remove(cMagnets, 1) end OnExit()
        dofile("scripts/sorter.lua")
    end
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