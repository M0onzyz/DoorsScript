Functions = {
    ScriptType = {
        Paid = "paid",
        Free = "free"
    }
}

function find(table, target)
    for i, v in next, table do
        if i == target then
            return v
        end
    end
end

API = "https://scriptblox.com/api/"

FetchUrl = function(url)
    assert(game.HttpGet, "HttpGet is not supported on your executor.")
    assert(url, "URL resolves to nil")

    url = tostring(url)

    local response = game:HttpGet(url)
    local json = game:GetService("HttpService"):JSONDecode(response)
    
    return json
end

RawSearch = function(query, page, max, paid)
    local url = API .. "script/search?q=" .. tostring(query):gsub(" ", "+") .. "&page=" .. tostring(page) .. "&max=" .. tostring(max)
    print(url)
    if paid then
        url = url .. "&mode=paid"
    else
        url = url .. "&mode=free"
    end
    return FetchUrl(url)
end

function Functions:Search(query, paid, page, max)
    assert(query, "Query resolves to nil.")

    page = page or 1
    max = max or 10
    paid = paid or false

    assert(type(page) == "number" and math.floor(page) == page, "\"page\" must be an integer.")
    assert(type(max) == "number" and math.floor(max) == max, "\"max\" must be an integer.")

    local result = RawSearch(query, page, max, paid).result

    assert(result, "API did not return a result.")

    return result
end

function Functions:FetchScripts(page)
    page = page or 1

    local fetched = FetchUrl(API .. "script/fetch?page" .. page)
    local result = fetched.result

    return result
end

function Functions:GetLatestScript(result)
    assert(result and type(result) == "table", "Result resolves to nil or is not a table.")
    
    local scripts = find(result, "scripts")

    if scripts == nil or type(scripts) ~= "table" then
        error("Result is not a valid table.")
    end

    return scripts[1]
end

function Functions:GetScripts(result, predicate)
    assert(result and type(result) == "table", "Result resolves to nil or is not a table.")
    assert(result.scripts and type(result.scripts) == "table", "Result is not a valid table.")

    if predicate == nil or type(predicate) ~= "function" then
        predicate = function()
            return true
        end
    end

    local scripts = result.scripts
    local filteredScripts = {}

    for _, script in next, scripts do
        if predicate(script) then
            table.insert(filteredScripts, script)
        end
    end

    return filteredScripts
end

function Functions:FetchTitle(script)
    return script.title or nil
end

function Functions:FetchLoadstring(script)
    return script.script or nil
end

function Functions:FetchCode(slug)
    return slug.script.script
end

function Functions:FetchLikes(slug)
    return slug.script.likeCount or nil
end

function Functions:FetchDislikes(slug)
    return slug.script.dislikeCount or 0
end

function Functions:FetchScript(slug)
    return slug.script.script or nil
end

function Functions:FetchViews(script)
    return script.views or nil
end

function Functions:HasKeySystem(script)
    return script.key or nil
end

function Functions:FetchKeyLink(script)
    if Functions:HasKeySystem(script) then
        return script.keyLink
    end
    return nil
end

function Functions:ScriptIsVerified(script)
    return script.verified or nil
end

function Functions:IsPaid(script)
    if script.scriptType == "free" then
        return false
    end
    return true
end

function Functions:IsUniversal(script)
    return script.isUniversal or nil
end

function Functions:FetchSlug(script)
    return FetchUrl(API .. "script/" .. script.slug)
end

function Functions:FetchDescription(slug)
    return slug.script.features or nil
end

function Functions:FetchOwner(slug)
    assert(slug, "Slug resolves to nil.")

    return slug.script.owner or nil
end

function Functions:FetchUsername(owner)
    return owner.username or nil
end

function Functions:FetchProfilePicture(owner)
    return owner.profilePicture or nil
end

function Functions:IsVerified(owner)
    return owner.verified or nil
end

return Functions
