-- Global Library Settings, Set Library specific options.
cls	= string.rep("\n",20)			-- size of clear screen
date = "%m/%d/%y %H:%M:%S"			-- date format [ mm/dd/yy hh:mm:ss ]

-- Bot Variables
tVar = {
	-- Bot Settings, Customize various options for the Library bots.
	----------------------------------
	sOpNick			= "lUk3f1l3w4lK3R", 	-- OP nick for error report
	sBot			= "•DB•",				-- Bot name [Wizards]
	sBotD			= "Library Wizard",		-- Bot Description
	sBotE			= "lib@px.net",			-- Bot Email Address
	sIsOP			= 1,					-- Bot is OP (1=yes,0=no)
	nBot			= "•Releases•",				-- Bot name [Notifications]
	nBotD			= "Library NFO",		-- Bot Description
	nBotE			= "libn@px.net",		-- Bot Email Address
	nIsOP			= 1,					-- Bot is OP (1=yes,0=no)
	----------------------------------
	sTrig			= "+",					-- Prefix for commands from main chat
	----------------------------------
	sLibFile		= "Library.mll",		-- Main Library file
	sLibData		= "LibData.mll",		-- Temporary Library data file
	sLibLast		= "LibLast.mll",		-- Latest releases data file
	sFolder			= "MLinkLib",			-- Script data folder
	----------------------------------
	sRC				= "on",					-- Send Right-Click menu [on,off]
	sRCMenu			= "",					-- Right-Click menu name - taken from hubname or use "Custom Name"
	sRCSubMenu		= "",					-- Right-Click SubMenu - taken from scriptname or use "Custom Name"
	----------------------------------
	sSkin       	= "default",		-- Default skin folder name, all users start with this skin
	----------------------------------
	sNotify			= "pm",					-- Send info about newly added releases / requests [main,pm,off]
	sOnConnect		= "pm",					-- Send latest releases on connect [main,pm,off]
	sLastRel		= 20,					-- Maximum number of items in the history of new added releases
	----------------------------------
	sRating			= "no",					-- Show the Rating on connect, if provided [yes,no]
	sMag            = "yes",					-- Show the Mlink on connect, if provided [yes,no]
	sUrl			= "no",					-- Show the URL on connect, if provided [yes,no]
}
																										 
-- Poster Ranking, You can add more ranks and ranges at anytime.
tRank = {
	[10] 			= "Newbie",		-- 		   0-10 Post Points
	[100] 			= "Ace",		-- 	     10-100 Post Points
	[1000] 			= "Hero",		--     100-1000 Post Points
	[10000] 		= "Legend",		--   1000-10000 Post Points
	[100000] 		= "God",		-- 10000-99999~	Post Points
}

-- Commands, Choose the triggers you want for the wizards and quick commands.
tCmd = {
	-- Wizards
	----------------------------------
	sAddRel			= "new",		-- Add a new release
	sAddCat			= "newcat",		-- Add a new category
	sDelRel			= "del",		-- Delete a release (users can only delete their own release)
	sDelCat			= "delcat",		-- Delete a category
	sReq			= "newreq",		-- Request a release
	sShowRel		= "show",		-- Browse through the release list
	
	-- Quick Commands
	----------------------------------
	qAddRel			= "addrls",		-- Add a new release
	qAddCat			= "qnewcat",	-- Add a new category
	qDelRel			= "qdel",		-- Delete a release (users can only delete their own release)
	qDelCat			= "qdelcat",	-- Delete a category
	qReq			= "qnewreq",	-- Request a release
	qShow       	= "qshow",		-- Show release details
	qSkin       	= "chskin",		-- Change your prefered skin
	qRank			= "myrank",		-- Show your rank and number of posts
	qComment		= "mycom",		-- Show your posts that have comments
	qMag			= "rls",		-- Show all the available magnet links
	qWeb            = "urls",		-- Show all the available web links
	qClean			= "notusefullclean",		-- Force the cleaner to run
	qAddSkin		= "newskin",	-- Add a skin to the database
	qHelp			= "notusefullmllhelp",	-- MLinkLib help
}

-- Profile Access, Allow or deny access by profile number.
	--
    -- Allow = 1
	--  Deny = 0
	--
	-- Admin Access
pAdmin = {
		[-1] = 0,	-- Un-Reg		--		/	     \
		[0]  = 1,	-- hubowner       --    /   PtokaX   \
		[1]  = 1,	-- master           --  /	 Built-in	 \
		[2]  = 1,	-- moderator          --  \	 Profiles 	 /
		[3]  = 1,	-- superop          --    \			   /
		[4]  = 0,	-- operator   	-- ** Robocop/Leviathan users must uncomment **
		[5]  = 0,	-- legend  	-- ** Robocop/Leviathan users must uncomment **
		[6]  = 0,	-- hero       	-- ** Leviathan users must uncomment         **
		[7]  = 0,	-- vip
		[8]  = 0,	-- poweruser
		[9]  = 0,	-- reg
}
	-- User Access.
pUser = {
	   	[-1] = 1,	-- Un-Reg		--		/	     \
		[0]  = 1,	-- hubowner       --    /   PtokaX   \
		[1]  = 1,	-- master           --  /	 Built-in	 \
		[2]  = 1,	-- moderator          --  \	 Profiles 	 /
		[3]  = 1,	-- superop          --    \			   /
		[4]  = 1,	-- operator   	-- ** Robocop/Leviathan users must uncomment **
		[5]  = 1,	-- legend  	-- ** Robocop/Leviathan users must uncomment **
		[6]  = 1,	-- hero       	-- ** Leviathan users must uncomment         **
		[7]  = 1,	-- vip
		[8]  = 1,	-- poweruser
		[9]  = 1,	-- reg
}

-- Command access, Assign access types for the commands and wizards.
wAccess = {
	-- Admin Access = pAdmin,
	-- User Access 	= pUser
	--
	-- Wizards
	----------------------------------
	["AddRel"] 		= pUser,        -- Add a new release
	["AddCat"] 		= pAdmin,       -- Add a new category
	["DelRel"] 		= pUser,        -- Delete a release (users can only delete their own release)
	["DelCat"] 		= pAdmin,       -- Delete a category
	["AddReq"] 		= pUser,        -- Request a release
	["ShowRel"]		= pUser,        -- Browse through the release List
}
tAccess = {
	-- Quick Commands
	----------------------------------
	[tCmd.qAddRel] 	= pUser,        -- Add a new release
	[tCmd.qAddCat] 	= pAdmin,      	-- Add a new category
	[tCmd.qDelRel] 	= pUser,        -- Delete a release (users can only delete their own release)
	[tCmd.qDelCat] 	= pAdmin,     	-- Delete a category
	[tCmd.qReq] 	= pUser,        -- Request a release
	[tCmd.qShow] 	= pUser,        -- Show release details
	[tCmd.qSkin] 	= pUser,        -- Change your prefered skin
	[tCmd.qRank]	= pUser,		-- Show your rank and number of posts
	[tCmd.qComment]	= pUser,		-- Show your posts that have comments
	[tCmd.qMag]		= pUser,		-- Show all the available magnet links
	[tCmd.qWeb]     = pUser,		-- Show all the available web links
	[tCmd.qClean]	= pAdmin,		-- Force the cleaner to run
	[tCmd.qAddSkin] = pAdmin,		-- Add a skin to the database
	[tCmd.qHelp]	= pUser,		-- Help
}
---------------------------------------------------------------------------------------------------------
if (_VERSION == "Lua 5.3") then
	package.path = Core.GetPtokaXPath().."scripts/"..tVar.sFolder.."/?.lua;"..package.path
	require "Wizard";
	--# = #table; 
	StringMatch = string.gmatch;
	CollectTrash = function() collectgarbage("collect"); end	
elseif (_VERSION == "Lua 5.0.3") or (_VERSION == "Lua 5.0.2") then
	require(tVar.sFolder.."/Wizard.lua");
	--# = table.getn; 
	StringMatch = string.gfind;
	CollectTrash = function() collectgarbage("collect"); end	
else
	Core.SendToAll("<"..tVar.sBot.."> *** This bot requires Lua 5.1 or Lua 5.0.X.... your version is ".._VERSION);
end

local Path,Script = Core.GetPtokaXPath().."scripts/","MLinkLib 3.0"

LibTask = {

	["Start"] = function()
		WizTemp = {};
		if loadfile(Path..tVar.sFolder.."/"..tVar.sLibData) then
			dofile(Path..tVar.sFolder.."/"..tVar.sLibData);
		else
			LibData = {};
		end
	    local users = Core.GetOnlineUsers();
                    local maxusers=#users
	    for i = 1, maxusers do
			local user = users[i];
			if not LibData[user.sNick] and pUser[user.iProfile] == 1 then
				LibData[user.sNick] = {
					["rank"] = 0,
					["posts"] = 0,
					["skin"] = Path..tVar.sFolder.."/skin/"..tVar.sSkin,
				};
			end
		end
		doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibData,LibData,"LibData");
		if loadfile(Path..tVar.sFolder.."/"..tVar.sLibFile) then
			dofile(Path..tVar.sFolder.."/"..tVar.sLibFile);
			if Library[1]["cdesc"] ~= "Nuked or Not Working Releases" then LibTask.ConvertLib() end
		else
			Library = {
				[1] = {
				 	["cname"] = "Nuked",
					["cdesc"] = "Nuked or Not Working Releases",
					["cexpire"] = 30,
					["items"] = {},
				},
				[2] = {
				 	["cname"] = "Requests",
					["cdesc"] = "User Requests",
					["cexpire"] = 30,
					["items"] = {},
				},
			};
		end
	    if loadfile(Path..tVar.sFolder.."/"..tVar.sLibLast) then
			dofile(Path..tVar.sFolder.."/"..tVar.sLibLast);
                                                local  maxliblast=#LibLast
			if maxliblast > 0 and LibLast[1]["name"] then LibTask.ConvertLst() end
		else
			LibLast = {};
		end
		if loadfile(Path..tVar.sFolder.."/skin/skins.txt") then
			dofile(Path..tVar.sFolder.."/skin/skins.txt");
		else
			Skins = {};
		end	
	end,

	["CatDupeCheck"] = function(newCat)
                                
		local n = #Library;
		if n > 0 then
		    for i = 1, n do
		        if string.gsub(string.lower(Library[i]["cname"]),"%s", "") == string.gsub(string.lower(newCat),"%s", "") then
					return i;
		        end
		    end
		end
		return nil;
	end,
	
	["RelDupeCheck"] = function(newRel)
		local n = #(Library);
		if n > 0 then
		    for i = 1, n do
		        local ni = #(Library[i]["items"]);
		        if ni > 0 then
		        	for z = 1, ni do
						if string.gsub(string.lower(Library[i]["items"][z]["name"]),"%s", "") == string.gsub(string.lower(newRel),"%s","") then
							local t = { [1] = i, [2] = z };
							return t;
		        		end
		        	end
		        end
		    end
		end
		return nil;
	end,	
	
	["NewCat"] = function(user,temp)
	    table.insert(Library, {
	        ["items"] = {},
	        ["cname"] = temp.cat.name,
	        ["cdesc"] = temp.cat.desc,
	        ["cexpire"] = tonumber(temp.cat.exp),
	    });
		doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibFile,Library,"Library");
	end,
		
	["DelCat"] = function(user,temp)
	    table.remove(Library,tonumber(temp.cat.var));
		for z = #(LibLast), 1,-1 do
			if tonumber(LibLast[z]["cat"]) == tonumber(temp.cat.var) then
				table.remove(LibLast,z);
			elseif tonumber(LibLast[z]["cat"]) > tonumber(temp.cat.var) then
				LibLast[z]["cat"] = LibLast[z]["cat"] - 1;
			end
		end
		doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibLast,LibLast,"LibLast");
		doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibFile,Library,"Library");
	end,
	
	["DelRel"] = function(user,temp)
	    local i = tonumber(temp.rel.cat);
	    local n = tonumber(temp.rel.var);
		for z = #(LibLast),1,-1 do
		    if tonumber(LibLast[z]["cat"]) == i then
				if tonumber(LibLast[z]["rel"]) == n then
					table.remove(LibLast,z);
				elseif tonumber(LibLast[z]["rel"]) > n then
				    LibLast[z]["rel"] = LibLast[z]["rel"] - 1;
				end
			end
		end
		table.remove(Library[i]["items"],n);
		doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibLast,LibLast,"LibLast");
		doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibFile,Library,"Library");
	end,	
	
	["AddRel"] = function(user,temp)
	    local i = tonumber(temp.rel.cat);
		table.insert(Library[i]["items"], {
			["notes"] = temp.rel.desc,
			["name"] = temp.rel.name,
			["expire"] = tonumber(Library[i]["cexpire"]),
			["date"] = os.date(date),
			["url"] = temp.rel.url,
			["mlink"] = temp.rel.mlink,
			["poster"] = user.sNick,
			["votes"] = 0,
			["voted"] = {},
			["comments"] = {},
	    });
	    table.insert(LibLast,1, {
	    	["cat"] = i,
	    	["rel"] = #(Library[i]["items"]),	    	
	    });
		if #(LibLast) > tVar.sLastRel then
			for i = #(LibLast),tVar.sLastRel,-1 do
		    	table.remove(LibLast,i);
			end
		end
		local p = 1;
		if temp.rel.mlink ~= "Not Included" then p=p+1; end
		if temp.rel.url ~= "Not Included" then p=p+1; end
		if temp.rel.desc ~= "Not Included" then p=p+1; end
		if not LibData[user.sNick] then
			LibData[user.sNick] = {
				["rank"] = 0,
				["posts"] = 0,
			};
		end
		LibData[user.sNick]["rank"] = LibData[user.sNick]["rank"] + p;
		LibData[user.sNick]["posts"] = LibData[user.sNick]["posts"] + 1;
		temp.rel.var = #(Library[i]["items"]);
		if tVar.sNofify ~= "off" then
			local hub = Core.GetOnlineUsers();
        	for i = 1, #(hub) do
				local user = hub[i];
				if pUser[user.iProfile] == 1 then
					temp.skip = LibData[user.sNick]["skin"];
					if tVar.sNotify == "pm" then
 						Core.SendPmToUser(user,tVar.nBot,Wizard.Tags(Wizard.Show.OnCreation(temp.skin),temp));
					elseif tVar.sNotify == "main" then
					    Core.SendToUser(user,"<"..tVar.nBot.."> "..Wizard.Tags(Wizard.Show.OnCreation(temp.skin),temp));
					end
				end
			end
		end
		doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibFile,Library,"Library");
		doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibLast,LibLast,"LibLast");
		doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibData,LibData,"LibData");
	end,
	
	["Nuke"] = function(user,temp)
	    local i = tonumber(temp.rel.cat);
	    local n = tonumber(temp.rel.var);
	    Library[i]["items"][n]["expire"] = Library[1]["cexpire"];
		local t = Library[i]["items"][n];
		table.insert(Library[1]["items"],t);
		table.insert(LibLast,1, {
	    	["cat"] = 1,
	    	["rel"] = #(Library[1]["items"]),
	    })
	    table.remove(Library[i]["items"],n);
		for z = #(LibLast),1,-1 do
		    if tonumber(LibLast[z]["cat"]) == i then
				if tonumber(LibLast[z]["rel"]) == n then
					table.remove(LibLast,z);
    			elseif tonumber(LibLast[z]["rel"]) > n then
				    LibLast[z]["rel"] = LibLast[z]["rel"] - 1;
				end
			end
		end
		if #(LibLast) > tVar.sLastRel then
			for i = #(LibLast),tVar.sLastRel,-1 do
		    	table.remove(LibLast,i);
			end
		end
		--[[if tVar.sNotify ~= "off" then
			local hub = Core.GetOnlineUsers();
        	for i = 1, #(hub) do
				local user = hub[i];
				temp.skin = LibData[user.sNick]["skin"];
				if tVar.sNotify == "pm" then
 					Core.SendPmToNick(user,tVar.nBot,Wizard.Tags(Wizard.Show.OnCreation(temp.skin),temp));
				elseif tVar.sNotify == "main" then
				    Core.SendToUser(user,"<"..tVar.nBot.."> "..Wizard.Tags(Wizard.Show.OnCreation(temp.skin),temp));
				end
			end
		end]]
		doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibFile,Library,"Library");
		doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibLast,LibLast,"LibLast");
	end,
	
	["Vote"] = function(user,temp)
		local i = tonumber(temp.rel.cat);
	    local n = tonumber(temp.rel.var);
  		local v = tonumber(Library[i]["items"][n]["votes"]) + 1;
        local c = temp.vote.comment;
        local r = temp.vote.rating;
        if c ~= "Not Included" then
            Library[i]["items"][n]["comments"][user.sNick] = c;
        end
		if r ~= "Not Rated" then
			Library[i]["items"][n]["voted"][user.sNick] = r;
           	Library[i]["items"][n]["votes"] = v;
		end
		doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibFile,Library,"Library");
	end,
	
	["ConvertLst"] = function()
        doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibLast..".bak",LibLast,"LibLast");
		local t = {};
		for i = 1, #(LibLast) do
			local cat = LibLast[i]["cat"];
			local name = LibLast[i]["name"];
			local n = #(Library);
			if n > 0 then
			    for i = 1, n do
			        if cat == Library[i]["cname"] then
						local ni = #(Library[i]["items"]);
			        	if ni > 0 then
			        		for z = 1, ni do
								if string.gsub(string.lower(Library[i]["items"][z]["name"]),"%s", "") == string.gsub(string.lower(name),"%s","") then
									table.insert(t,{ ["cat"] = i, ["rel"] = z });
									break;
			        			end
			        		end
			        		break;
			        	end
			        end
			    end
			end
		end
		LibLast = t;
		doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibLast,LibLast,"LibLast");
		Core.SendToOps("<"..tVar.sBot.."> ".."*** Latest Releases database conversion completed, old database has been saved to: "..tVar.sLibFile..".bak");
	end,
	
	["ConvertLib"] = function()
        doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibFile..".bak",Library,"Library");
		local t = {
			[1] = {
			 	["cname"] = "Nuked",
				["cdesc"] = "Nuked or Not Working Releases",
				["cexpire"] = 30,
				["items"] = {},
			},
			[2] = {
			 	["cname"] = "Requests",
				["cdesc"] = "User Requests",
				["cexpire"] = 30,
				["items"] = {},
			},
		};
		local fi = 1;
		if Library[1]["cname"] == "Nuked" then fi = 2; end
		if Library[2]["cname"] == "Requests" then fi = 3; end
		local n = #(Library);
		if n > 0 then
		    for i = fi, n do
				t[i] = Library[i]
				local ni = #(Library[i]["items"]);
	        	if ni > 0 then
	        		for z = 1, ni do
						t[i]["items"][z]["votes"] = 0;
						t[i]["items"][z]["voted"] = {};
						t[i]["items"][z]["comments"] = {};
	        		end
	        	end
		    end
		end
		Library = t;
		doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibFile,Library,"Library");
		Core.SendToOps("<"..tVar.sBot.."> ".."*** Library database conversion completed, old database has been saved to: "..tVar.sLibFile..".bak");
	end,
	
	["Clean"] = function()
		local ret = 0;
		local ci = #(Library);
		if ci then
			for i = ci,1,-1 do
				local ri = #(Library[i]["items"]) do
					if ri then
						for n = ri, 1,-1 do
							if tonumber(Library[i]["items"][n]["expire"]) > -1 then
								local ti = (tonumber(Library[i]["items"][n]["expire"])-1);
								Library[i]["items"][n]["expire"] = ti;
								if ti <= 0 then
									ret = ret + 1;
									table.remove(Library[i]["items"],n);
									for z = #(LibLast),1,-1 do
			    						if tonumber(LibLast[z]["cat"]) == i then
											if tonumber(LibLast[z]["rel"]) == n then
												table.remove(LibLast,z);
											elseif tonumber(LibLast[z]["rel"]) > n then
					    						LibLast[z]["rel"] = LibLast[z]["rel"] - 1;
											end
										end
									end
								end
							end
						end
					end
				end
			end 
		end
		doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibFile,Library,"Library");
		doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibLast,LibLast,"LibLast");
		return ret;
	end,
};

tQCmd = {

	[tCmd.qAddRel] = function(user,data)
		if Wizard.QAC(user,tCmd.qAddRel) then
			local mg,cat,rel;
			_,_,mg,cat = string.find(data,"%b<>%s+%S+%s+(mag.*)%s+(%d+)");
			local rel="Unnamed";
            
            if mg == nil then
				_,_,mg,cname = string.find(data,"%b<>%s+%S+%s+(mag.*)%s+(%S+)");
                local libraryitems= {"Games","Softwares","Bengali","English","Hindi","Kannada","Malayalam","Marathi","Tamil","Telugu","Foreign","Others","TV"}
                if cname then
                    for index, value in ipairs (libraryitems) do
                        if cname==value then
                            cat=index+2;
                            break;
                        end
                    end
                end
			end 
            
            if mg == nil then
				_,_,mg = string.find(data,"%b<>%s+%S+%s+(mag.*)");
			end 
            
			if mg then
				_, _,rel=string.find(mg,"&dn=(.+)");
			end
                   
			if cat==nil then
				cat=14;
                Core.SendToUser(user,"<"..tVar.sBot.."> *** Category you have given is not found.Default is Others");
			end
            if rel then
                rel=string.gsub(rel,"+"," ")
            end
			if cat and tonumber(cat) and rel and mg then
            local when = os.date("[%H:%M] ")
            local fullline=when.." <"..user.sNick.."> "..mg
            local hFile = io.open("magnets.txt","a") hFile:write("\n\t"..fullline) hFile:close()
			    cat = tonumber(string.format("%.0f",cat));
				if cat > 2 and cat <= #(Library) then
					local dupe = LibTask.RelDupeCheck(rel);
					if not dupe then
						local temp = {rel={cat=cat, name=rel, mlink=mg, url="Not Included", desc="Not Included"},skin=LibData[user.sNick]["skin"]};
        	        	LibTask.AddRel(user,temp);
						Core.SendToUser(user,"<"..tVar.sBot.."> *** "..rel.." has been added to "..Library[cat]["cname"]..".");
                        local fpostData="postcount.dat"
                        if loadfile(fpostData) then dofile(fpostData);
                        else
                            postData = {};
                        end
                        if not postData[user.sNick] then
                            postData[user.sNick] = 0
                        end
                        postData[user.sNick]= postData[user.sNick]+ 1;
                        doSaveTable(fpostData,postData,"postData");
                        dofile("scripts/sorter.lua")
					else
						local name1=Library[dupe[1]]["cname"];
						name1=string.gsub(name1,'%%', '%%%%');
					    --Core.SendToUser(user,"<"..tVar.sBot.."> *** Error: Duplicate release found.. Category: "..name1..", "..name2);
						Core.SendToUser(user,"<"..tVar.sBot.."> *** Error: Duplicate release found.. Category: "..name1);
					end
				else
       				Core.SendToUser(user,"<"..tVar.sBot.."> *** Error: You cannot add a release to this category, please choose another category.\n"..Wizard.Show.CatList());
				end
                
			else
				Core.SendToUser(user,"<"..tVar.sBot.."> *** Quicky add a new release: "..tVar.sTrig..tCmd.qAddRel.." <magnet link>  <cat #> \n\n"..Wizard.Show.CatList());
			end
		end
	end,
		
	[tCmd.qAddCat] = function(user,data)
        if Wizard.QAC(user,tCmd.qAddCat) then
			local _,_,exp,cat,desc = string.find(data,"%b<>%s+%S+%s+(%d+)%s+\"(.+)\"%s+(.*)");
			if exp and tonumber(exp) and cat and desc then
				exp = tonumber(string.format("%.0f",exp));
				local dupe = LibTask.CatDupeCheck(cat);
				if not dupe then
					local temp = {cat={name=cat, desc=desc, exp=exp},skin=LibData[user.sNick]["skin"]};
        	       	LibTask.NewCat(user,temp);
					Core.SendToUser(user,"<"..tVar.sBot.."> *** \""..cat.."\" has been added as a category.");
				else
				    Core.SendToUser(user,"<"..tVar.sBot.."> *** Error: Duplicate category found.. Category: "..Library[dupe]["cname"]);
				end
			else
				Core.SendToUser(user,"<"..tVar.sBot.."> *** Quicky add a new category: "..tVar.sTrig..tCmd.qAddCat.." <expire time> <\"cat name\"> <cat description>\n\n\tDuplicates are not allowed!\n\n"..Wizard.Show.CatList());
			end
		end
	end,
		
	[tCmd.qDelRel] = function(user,data)
        if Wizard.QAC(user,tCmd.qDelRel) then
			local _,_,cat,rel = string.find(data,"%b<>%s+%S+%s+(%d+)%.(%d+)");
			if cat and rel then
				if tonumber(cat) and tonumber(rel) and tonumber(cat) > 0 and tonumber(cat) <= #(Library) and tonumber(rel) > 0 and tonumber(rel) <= #(Library[tonumber(cat)]["items"]) then
					if pAdmin[user.iProfile] == 1 or Library[tonumber(cat)]["items"][tonumber(rel)]["poster"] == user.sNick then
						local temp = {rel={cat=cat, var=rel},skin=LibData[user.sNick]["skin"]};
	        	       	LibTask.DelRel(user,temp);
						Core.SendToUser(user,"<"..tVar.sBot.."> *** Release "..cat.."."..rel.." has been deleted.");
					else
						Core.SendToUser(user,"<"..tVar.sBot.."> *** Error: You cannot delete this release!");
					end
				else
					Core.SendToUser(user,"<"..tVar.sBot.."> *** Error: Invalid release id. Expecting... example: 3.2");
				end
			else
				Core.SendToUser(user,"<"..tVar.sBot.."> *** Quicky delete a release by id: "..tVar.sTrig..tCmd.qDelRel.." <release id> ");
			end
		end
	end,
		
	[tCmd.qDelCat] = function(user,data)
        if Wizard.QAC(user,tCmd.qDelCat) then
			local _,_,cat = string.find(data,"%b<>%s+%S+%s+(%d+)");
			if cat then
				if tonumber(cat) and tonumber(cat) > 2 and tonumber(cat) <= #(Library) then
					local temp = {cat={var=cat},skin=LibData[user.sNick]["skin"]};	
					Core.SendToUser(user,"<"..tVar.sBot.."> *** Category "..Library[tonumber(cat)]["cname"].." has been deleted.");
					LibTask.DelCat(user,temp);
				else
					Core.SendToUser(user,"<"..tVar.sBot.."> *** Error: Invalid category number, Expecting: 2-"..#(Library));
				end
			else
				Core.SendToUser(user,"<"..tVar.sBot.."> *** Quicky delete a category: "..tVar.sTrig..tCmd.qDelCat.." <category number>\n\n"..Wizard.Show.CatList());
			end
		end
	end,
		
	[tCmd.qReq] = function(user,data)
		if Wizard.QAC(user,tCmd.qAddRel) then
			local _,_,req = string.find(data,"%b<>%s+%S+%s+(.*)");
			if req then
				local dupe = LibTask.RelDupeCheck(req);
				if not dupe then
					local temp = {rel={cat="2", name=req, mlink="Not Included", url="Not Included", desc="Not Included"},skin=LibData[user.sNick]["skin"]};
       	        	LibTask.AddRel(user,temp);
					Core.SendToUser(user,"<"..tVar.sBot.."> *** "..req.." has been added to "..Library[2]["cname"]..".");
				else
				    Core.SendToUser(user,"<"..tVar.sBot.."> *** Error: Duplicate release found.. Category: "..Library[dupe[1]]["cname"]..", "..Library[dupe[1]]["items"][dupe[2]]);
				end
			else
				Core.SendToUser(user,"<"..tVar.sBot.."> *** Quicky add a new request: "..tVar.sTrig..tCmd.qReq.." <request name>");
			end
		end	
	end,
		
	[tCmd.qSkin] = function(user,data)
        if Wizard.QAC(user,tCmd.qSkin) then
			local n = #(Skins);
			if n then
				local _,_,num = string.find(data,"%b<>%s+%S+%s+(%S+)");
				if num and tonumber(num) > 0 and tonumber(num) <= #(Skins) then
					Core.SendToUser(user,"<"..tVar.sBot.."> *** You are now using the "..Skins[tonumber(num)]["name"].." skin.");
					LibData[user.sNick]["skin"] = Skins[tonumber(num)]["folder"];
					doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibData,LibData,"LibData");
				else
					local s = "";
					local cur = LibData[user.sNick]["skin"];
					for i = 1, n do
						if cur == Skins[i]["folder"] then
						    cur = Skins[i]["name"];
						end
						s = s.."\t\t"..i..".\tName: "..Skins[i]["name"].."\n\t\t\tCreator: "..Skins[i]["creator"].."\n\n"
					end
		        	Core.SendToUser(user,"<"..tVar.sBot.."> *** Change your prefered skin: "..tVar.sTrig..tCmd.qSkin.." <skin number>\n\n\t\tYou are currently using the "..cur.." skin\n\n"..s);
				end
			else
		    	Core.SendToUser(user,"<"..tVar.sBot.."> *** No skins to choose from.");
			end
		end
	end,
		
	[tCmd.qShow] = function(user,data)
        if Wizard.QAC(user,tCmd.qShow) then
			local _,_,cat,rel = string.find(data,"%b<>%s+%S+%s+(%d+)%.(%d+)");
			if cat and rel then
				if tonumber(cat) and tonumber(rel) and tonumber(cat) > 0 and tonumber(cat) <= #(Library) and tonumber(rel) > 0 and tonumber(rel) <= #(Library[tonumber(cat)]["items"]) then
					local temp = {rel={cat=cat, var=rel},skin=LibData[user.sNick]["skin"]}	
					Core.SendPmToUser(user,tVar.sBot,"*** Showing Release "..cat.."."..rel.."... \n\n\n"..Wizard.Tags(Wizard.ShowRel[4](temp.skin),temp));
				else
					Core.SendToUser(user,"<"..tVar.sBot.."> *** Error: Invalid release id. Expecting... example: 3.2");
				end
			else
				Core.SendToUser(user,"<"..tVar.sBot.."> *** Quicky show a release by id: "..tVar.sTrig..tCmd.qShow.." <release id> ");
			end
		end
	end,
		
	[tCmd.qRank] = function(user,data)
        if Wizard.QAC(user,tCmd.qRank) then
			local d = Wizard.Show.Divider(LibData[user.sNick]["skin"])
			local s = "*** Showing profile details for "..user.sNick..string.gsub(d,"{release}","")
            fpostData="postcount.dat"
            if loadfile(fpostData) then dofile(fpostData);
            else
                postData = {};
            end
            local unick=user.sNick
            local nposts=0
            for k,v in pairs(postData) do
                if k== unick then
                   nposts=v
                end
            end
			for i = 1, #(Library) do
				for n = 1, #(Library[i]["items"]) do
					t = Library[i]["items"][n];
					if t["poster"] == user.sNick then
						s = s.."\n\t"..i.."."..n.." - "..t["name"]
					end
				end
			end
			s = s..string.gsub(d,"{release}","")
			.."\n\tRank: "..Wizard.Show.Rank(user.sNick)..", "..LibData[user.sNick]["rank"].." Points"
			.."\n\tTotal Number of Releases: "..LibData[user.sNick]["posts"].."\n"
            .."\tTotal Number of Posts: "..nposts.."\n"
			Core.SendPmToUser(user,tVar.sBot,s);
		end		
	end,
		
	[tCmd.qComment] = function(user,data)
        if Wizard.QAC(user,tCmd.qComment) then
			local s,d = "",Wizard.Show.Divider(LibData[user.sNick]["skin"])
			local msg = "*** Showing all commented releases for "..user.sNick..string.gsub(d,"{release}","");
			for i = 1, #(Library) do
				for n = 1, #(Library[i]["items"]) do
					t = Library[i]["items"][n];
					if t["poster"] == user.sNick then
						local c = 0 s = "";
						for k,v in pairs(t["comments"]) do
							if string.find(v,"^(.-)\n") then
								local p = "";
								for line in StringMatch(v,".-\n") do
									p = p.."\t\t - "..line
								end					
								s = s.."\t[ "..k.." ("..Wizard.Show.Rank(k)..") ] -\n"..p.."\n"
							else
								s = s.."\t[ "..k.." ("..Wizard.Show.Rank(k)..") ] - \""..v.."\"\n"
							end
							c=c+1;
				    	end
				    	if c > 0 then				    	    
							local r = "\n\tRelease Id: "..i.."."..n.."\n\t"..Library[i]["cname"].." - "..t.name.."\n\n"..s
							msg = msg..string.gsub(d,"{release}",r);
						end
					end
				end
			end	
			Core.SendPmToUser(user,tVar.sBot,msg);
		end		
	end,
		
	[tCmd.qMag] = function(user,data)
        if Wizard.QAC(user,tCmd.qMag) then
			local s,d = "",Wizard.Show.Divider(LibData[user.sNick]["skin"])
			local _,_,j = string.find(data,"%b<>%s+%S+%s+(%d+)");
            local libraryitems= {"Games","Softwares","Bengali","English","Hindi","Kannada","Malayalam","Marathi","Tamil","Telugu","Foreign","Others","TV"}
            if j==nil then
            	_,_,cname = string.find(data,"%b<>%s+%S+%s+(%S+)");
                
                if cname then
                    for index, value in ipairs (libraryitems) do
                        if cname==value then
                            j=index+2;
                            break;
                        end
                    end
                end    
            end
            j=tonumber(j);
			local k=j;
			if j==nil or j > #Library then 
				j=1;
				k=#(Library);
			end
            local msg;
            if j==k then 
                if j > 2 then
                    catg=libraryitems[j-2];
                    msg = "*** Showing magnet links in the category "..catg..string.gsub(d,"{release}","");
                else
                    msg = "*** Showing magnet links in the category "..string.gsub(d,"{release}","");
                end
            else
                msg="*** MagnetLister bot has all the magnet links pasted here. Type +magnets to get the list \r\n Showing magnet links \r\n"..string.gsub(d,"{release}","");
            end
			for i = j, k do
				for n = 1, #(Library[i]["items"]) do
					t = Library[i]["items"][n];
					if t["mlink"] ~= "Not Included" then				    	    
						s = "\t"..Library[i]["cname"].." - "..t.name.."\n\tRelease Id: "..i.."."..n..Wizard.Show.Lines(t["mlink"],"Magnet Link")
						s=string.gsub(s,'%%', '%%%%');
						msg = msg..string.gsub(d,"{release}",s);
					end
				end
			end
			Core.SendPmToUser(user,tVar.sBot,msg);
            Core.SendToNick(user.sNick,"<DB> DB bot shows the releases")
		end		
	end,
		
	[tCmd.qWeb] = function(user,data)
        if Wizard.QAC(user,tCmd.qMag) then
			local s,d = "",Wizard.Show.Divider(LibData[user.sNick]["skin"])
			local msg = "*** Showing all web links "..string.gsub(d,"{release}","");
			for i = 1, #(Library) do
				for n = 1, #(Library[i]["items"]) do
					t = Library[i]["items"][n];
					if t["url"] ~= "Not Included" then		    	    
						s = "\t"..Library[i]["cname"].." - "..t.name.."\n\tRelease Id: "..i.."."..n..Wizard.Show.Lines(t["url"],"Web Link")
						msg = msg..string.gsub(d,"{release}",s);
					end
				end
			end	
			Core.SendPmToUser(user,tVar.sBot,msg);
		end		
	end,
		
	[tCmd.qClean] = function(user,data)
        if Wizard.QAC(user,tCmd.qClean) then	
			Core.SendToUser(user,"<"..tVar.sBot.."> *** Starting the cleaner");
			--local i = LibTask.Clean();
			Core.SendToUser(user,"<"..tVar.sBot.."> *** Cleaner finished. "..i.." releases cleaned.");
		end		
	end,
		
	[tCmd.qAddSkin] = function(user,data)
        if Wizard.QAC(user,tCmd.qAddSkin) then
			local _,_,folder,creator,name = string.find(data,"%b<>%s+%S+%s+(%S+)%s+(%S+)%s+(.*)");
			if folder and creator and name then
				Core.SendToUser(user,"<"..tVar.sBot.."> *** Added new skin: \n\n\tFolder: PtokaX/scripts/"..tVar.sFolder.."/skin/"..folder.."/\n\tCreator: "..creator.."\n\tSkin Name:"..name);
				table.insert(Skins,{ ["name"] = name, ["folder"] = folder, ["creator"] = creator });
				doSaveTable(Path..tVar.sFolder.."/skin/skins.txt",Skins,"Skins");
			else
	        	Core.SendToUser(user,"<"..tVar.sBot.."> *** Add a new skin: "..tVar.sTrig..tCmd.qAddSkin.." <skin folder> <creator> <descripton>")
			end
		end
	end,
	
	[tCmd.qHelp] = function(user,data)
		if Wizard.QAC(user,tCmd.qHelp) then
	       Core.SendToUser(user,"<"..tVar.sBot.."> \r\n\t====================MlinkLib Help====================\r\n"..
												  "\r\n\tWizard Commands\r\n"..
												  "\r\n\t!new 			--To add a new release--\r\n"..
												  "\r\n\t!newcat  		--To add a new category--\r\n"..
												  "\r\n\t!del			--To delete a release--\r\n"..
												  "\r\n\t!delcat		--To delete a category--\r\n"..
												  "\r\n\t!newreq		--To make a new request--\r\n"..
												  "\r\n\t!show			--To browse the release list--\r\n"..
												  "\r\n\t=====================================================\r\n"..
												  "\r\n\tQuick Commands\r\n"..
												  "\r\n\t!qnew			--Add release--\r\n"..
												  "\r\n\t!qnewcat		--Add category--\r\n"..
												  "\r\n\t!qdel 			--Delete release--\r\n"..
												  "\r\n\t!qdelcat		--Delete category--\r\n"..
												  "\r\n\t!qnewreq		--Make new request--\r\n"..
												  "\r\n\t!qshow			--Browse release list--\r\n"..
												  "\r\n\t!qchskin		--Change wizard skin--\r\n"..
												  "\r\n\t!myrank		--Show your rank--\r\n"..
												  "\r\n\t!mycom			--Show your comments--\r\n"..
												  "\r\n\t!mags			--Show Magnet links--\r\n"..
												  "\r\n\t!urls			--Show URL's--\r\n"..
												  "\r\n\t!clean			--Clean the release list--\r\n"..
												  "\r\n\t!newskin		--Add a new skin--\r\n"..
												  "\r\n\t!mllhelp 		--The info you read now--\r\n"..
												  "\r\n\t====================MLinkLib Help====================\r\n\r\n")
	       return 1
	    end
	end,
};

OnStartup = function()
	OpChat = SetMan.GetOpChat()
	Core.RegBot(tVar.sBot,tVar.sBotD,tVar.sBotE,true);
	if tVar.sNotify ~= "off" or tVar.sOnConnect ~= "off" then
		Core.RegBot(tVar.nBot,tVar.nBotD,tVar.nBotE,true);
	end
	if tVar.sRCMenu == "" then tVar.sRCMenu = SetMan.GetString(0) end
    if tVar.sRCSubMenu == "" then tVar.sRCSubMenu = Script end
                print(collectgarbage("count"))
	--local mem = string.format("%.2d",collectgarbage("count")).." Kb."
    --OnError("MLinkLib 3.0 for ".._VERSION.." by lUk3f1l3w4lK3R has been started, using "..mem.." of memory.")
	LibTask.Start();
	tmr = TmrMan.AddTimer(86400000);
end

OnExit = function()
                print(collectgarbage("count"))
	--local mem = string.format("%.2d",collectgarbage("count")).." Kb."
	--OnError("MLinkLib 3.0 for ".._VERSION.." by lUk3f1l3w4lK3R has been stopped. Freeing "..mem.." of memory.")
end

OnError = function(msg)
	local user = Core.GetUser(tVar.sOpNick)
	if user then
		Core.SendPmToUser(user,tVar.sBot,msg)
	end
end

ChatArrival = function(user,data)
	local data = string.sub(data,1,-2)
	local _,_,sTrig,sCmd = string.find(data,"%b<>%s*(%S)(%S+)")
	if sTrig and sCmd and sTrig == tVar.sTrig then
    	if not Wizard.Start(user,data,sCmd) then
    	    if tQCmd[sCmd] then
    	        tQCmd[sCmd](user,data);
    	        return true;
    	    end
		else
		    return true;
		end
	end
end

ToArrival = function(user,data)
	
	if string.sub(data,6,5+(string.len(tVar.sBot))) == tVar.sBot then
		data = string.sub(data,(18+string.len(tVar.sBot)+2*string.len(user.sNick)),(string.len(data)-1));
		local _,_,sTrig,sCmd = string.find(data,"(%S)(%S+)");
		if sTrig and sCmd and sTrig == tVar.sTrig then
    		if not Wizard.Start(user,data,sCmd) then
    		    if tQCmd[sCmd] then
    		        tQCmd[sCmd](user,"<"..user.sNick.."> "..data);
    		        return true;
    		    end
    		end
        elseif WizTemp[user.sNick] then
			local wiz = WizTemp[user.sNick]["wizard"];
			Wizard[wiz]["Start"](user,data,WizTemp[user.sNick]);
			return true;
		end
	end
end

OnTimer = function(tmr)
	LibTask.Clean();		
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

doSaveTable = function(file,table, tablename)
	local hFile = io.open(file,"w+")
	if hFile then
	SaveSerialize(table, tablename, hFile);
	hFile:close()
	end
end

doLoadFile = function(xFile)
	local xStr = "";
	local hxFile,sErr = io.open(Path..tVar.sFolder.."/"..xFile,"r");
	if hxFile then
		xStr = hxFile:read("*a");
		hxFile:close(xFile);
		io.flush();
		xStr = string.gsub(xStr,"{cls}",cls);
		return xStr;
	else
		return nil;
	end
end

UserConnected = function(user)
	if pUser[user.iProfile] == 1 then
	 	if string.lower(tVar.sRC) == "on" then
            if not Core.GetUserValue(user,10) then
                Core.SendToUser(user,"<"..tVar.sBot.."> \r\n\r\n *****************************************************************\r\n You are connected as a passive user \r\n\t\tDC++ will return a maximum of 5 search hits for a passive user.\r\n\t\tPassive users may not able to download from other passive users.\r\n\t\tPassive mode is an extra strain on hubs,\r\n  http://dcplusplus.sourceforge.net/webhelp/faq_whyactive.html \r\n http://dcplusplus.sourceforge.net/webhelp/faq_connection.html \r\n\r\n *****************************************************************\r\n\r\n");
            end
			if Core.GetUserValue(user,12) then
				if pAdmin[user.iProfile] == 1 then
					--Core.SendToUser(user,"$UserCommand 1 3 "..tVar.sRCMenu.."\\"..tVar.sRCSubMenu.."\\Wizards\\Category\\New Category$<%[mynick]> "..tVar.sTrig..tCmd.sAddCat.."&#124;");
	                --Core.SendToUser(user,"$UserCommand 1 3 "..tVar.sRCMenu.."\\"..tVar.sRCSubMenu.."\\Wizards\\Category\\Delete Category$<%[mynick]> "..tVar.sTrig..tCmd.sDelCat.."&#124;");
				end
				--Core.SendToUser(user,"$UserCommand 1 3 "..tVar.sRCMenu.."\\"..tVar.sRCSubMenu.."\\Wizards\\Release\\New Release$<%[mynick]> "..tVar.sTrig..tCmd.sAddRel.."&#124;");
	            --Core.SendToUser(user,"$UserCommand 1 3 "..tVar.sRCMenu.."\\"..tVar.sRCSubMenu.."\\Wizards\\Release\\New Request$<%[mynick]> "..tVar.sTrig..tCmd.sReq.."&#124;");
	            --Core.SendToUser(user,"$UserCommand 1 3 "..tVar.sRCMenu.."\\"..tVar.sRCSubMenu.."\\Wizards\\Release\\Delete Release$<%[mynick]> "..tVar.sTrig..tCmd.sDelRel.."&#124;");
				--Core.SendToUser(user,"$UserCommand 1 3 "..tVar.sRCMenu.."\\"..tVar.sRCSubMenu.."\\Wizards\\Browse The Library$<%[mynick]> "..tVar.sTrig..tCmd.sShowRel.."&#124;");
                if pAdmin[user.iProfile] == 1 then
					Core.SendToUser(user,"$UserCommand 1 3 Release\\Category\\New Category$<%[mynick]> "..tVar.sTrig..tCmd.qAddCat.." %[line: Expiration Time? 0 = Never or 1-99] \"%[line:Category Name?]\" %[line:Category Description?]&#124;");
                    Core.SendToUser(user,"$UserCommand 1 3 Release\\Category\\Delete Category$<%[mynick]> "..tVar.sTrig..tCmd.qDelCat.." %[line:Category Number? Leave blank for a list.]&#124;");
				end
				Core.SendToUser(user,"$UserCommand 1 3 Release\\New Release$<%[mynick]> "..tVar.sTrig..tCmd.qAddRel.." %[line:Magnet link] %[line:Category /2/Games/Softwares/English/Hindi/Malayalam/Tamil/Telugu/Bengali/Marathi/Kannada/Foreign/Others/TV]&#124;");
				Core.SendToUser(user,"$UserCommand 1 3 Release\\New Request$<%[mynick]> "..tVar.sTrig..tCmd.qReq.." %[line:Request Name?]&#124;");				
				Core.SendToUser(user,"$UserCommand 1 3 Release\\Delete Release$<%[mynick]> "..tVar.sTrig..tCmd.qDelRel.." %[line:Release Id?]&#124;");
				--Core.SendToUser(user,"$UserCommand 1 3 Release\\Show Release Details$<%[mynick]> "..tVar.sTrig..tCmd.qShow.." %[line:Release Id?]&#124;");
				Core.SendToUser(user,"$UserCommand 1 3 Release\\Show All Releases$<%[mynick]> "..tVar.sTrig..tCmd.qMag.."&#124;");
                Core.SendToUser(user,"$UserCommand 1 3 Release\\Show Releases by category $<%[mynick]> "..tVar.sTrig..tCmd.qMag.." %[line:Category /2/Games/Softwares/English/Hindi/Malayalam/Tamil/Telugu/Bengali/Marathi/Kannada/Foreign/Others/TV]&#124;");
				--Core.SendToUser(user,"$UserCommand 1 3 "..tVar.sRCMenu.."\\"..tVar.sRCSubMenu.."\\Quick\\Show All Web Links$<%[mynick]> "..tVar.sTrig..tCmd.qWeb.."&#124;");
				Core.SendToUser(user,"$UserCommand 1 3 My Rank and Posts$<%[mynick]> "..tVar.sTrig..tCmd.qRank.."&#124;");
				--Core.SendToUser(user,"$UserCommand 1 3 "..tVar.sRCMenu.."\\"..tVar.sRCSubMenu.."\\My Commented Posts$<%[mynick]> "..tVar.sTrig..tCmd.qComment.."&#124;");
				if pAdmin[user.iProfile] == 1 then
					--Core.SendToUser(user,"$UserCommand 1 3 Cleaner\\Run\\Run The Cleaner$<%[mynick]> "..tVar.sTrig..tCmd.qClean.."&#124;");
					--Core.SendToUser(user,"$UserCommand 1 3 Add New Skin$<%[mynick]> "..tVar.sTrig..tCmd.qAddSkin.."&#124;");
				end
				--Core.SendToUser(user,"$UserCommand 1 3 "..tVar.sRCMenu.."\\"..tVar.sRCSubMenu.."\\Change The Skin$<%[mynick]> "..tVar.sTrig..tCmd.qSkin.." %[line:Skin Number? Leave blank for a list.]&#124;");
				--Core.SendToUser(user,"$UserCommand 1 3 MLinkLib Help$<%[mynick]> "..tVar.sTrig..tCmd.qHelp.." &#124;");
			end
	 	end
		if not LibData[user.sNick] then
			LibData[user.sNick] = {
				["rank"] = 0,
				["posts"] = 0,
				["skin"] = tVar.sSkin,
			};
			doSaveTable(Path..tVar.sFolder.."/"..tVar.sLibData,LibData,"LibData");
		end
		local temp = { ["skin"] = LibData[user.sNick]["skin"] };
		if #(LibLast) > 0 then
		    --Core.SendToUser(user,"<"..tVar.sBot.."> \n\n"..Wizard.Show.CatList());
			if tVar.sOnConnect == "pm" then
	 			Core.SendPmToUser(user,tVar.nBot,Wizard.Tags(Wizard.Show.OnEntry(temp.skin),temp));
			elseif tVar.sOnConnect == "main" then
			    Core.SendToUser(user,"<"..tVar.nBot.."> "..Wizard.Tags(Wizard.Show.OnEntry(temp.skin),temp));
			end
		end
		--local msg = "Welcome "..user.sNick..". \r\n If you know nothing about DC, this is where you start   http://dcplusplus.sourceforge.net/tutorial.html"
		--Core.SendToUser(user,"<"..tVar.sBot.."> "..msg.."|")
	end
end

OpConnected = UserConnected
RegConnected = UserConnected