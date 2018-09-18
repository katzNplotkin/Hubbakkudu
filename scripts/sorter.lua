fpostData="postcount.dat"
flibData="scripts/MLinkLib/LibData.mll"


function spairs(t, order)
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end



if loadfile(fpostData) then dofile(fpostData);
else
	postData = {};
end
if loadfile(flibData) then dofile(flibData);
else
	LibData = {};
end
local msg=""
msg = msg.."\n"..string.rep("-=",25)
msg = msg.."\n"..string.rep("-", 50)
msg=msg.."\n"
local limit=10
local count=0
msg=msg.."Releases"
msg = msg.."\n"..string.rep("-", 50)
msg=msg.."\n"

rels={}
for k,v in pairs(LibData) do
    val=v["posts"]
    if val > 0 then
        rels[k]=val
    end
end

for k,v in spairs(rels, function(t,a,b) return t[b] < t[a] end) do
    count=count+1
    if count >limit then break end
    msg = msg.."\t"..k.."\t\t    "..v.."\n"
end
local limit=10
local count=0
msg = msg.."\n"..string.rep("-", 50)
msg=msg.."\n"
msg=msg.."Posts \n"
msg = msg..string.rep("-", 50)
msg=msg.."\n"
for k,v in spairs(postData, function(t,a,b) return t[b] < t[a] end) do
    count=count+1
    if count >limit then break end
    msg = msg.."\t"..k.."\t\t    "..v.."\n"
end
msg = msg..string.rep("-=",25)
msg = msg.."\r\n+release for release help\r\n"
msg = msg..string.rep("-=",25)
local hFile = io.open("posts.txt","w") hFile:write(msg) hFile:close()


