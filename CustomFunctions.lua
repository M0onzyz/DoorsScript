-- Functions Locals
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local RootPart = Character:WaitForChild("HumanoidRootPart")
-- Functions
function unctest()
  loadstring(game:HttpGet("https://github.com/ltseverydayyou/uuuuuuu/blob/main/UNC%20test?raw=true"))()
end
function ws(speed)
  local playerHumanoid = game.Players.LocalPlayer.Character.Humanoid
  playerHumanoid.WalkSpeed = speed
end
function jp(power)
  local playerHumanoid = game.Players.LocalPlayer.Character.Humanoid
  playerHumanoid.JumpPower = power
end
local function getnearestplayer()
    local nearestPlayer = nil
    local shortestDistance = math.huge -- Set to infinity initially
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                nearestPlayer = player
            end
        end
    end

    return nearestPlayer
end

local function teleporttonearestlayer()
    local nearestPlayer = GetNearestPlayer()
    if nearestPlayer and nearestPlayer.Character and nearestPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = nearestPlayer.Character.HumanoidRootPart.CFrame
        print("Teleported to:", nearestPlayer.Name)
    else
        print("No Players Found")
    end
end
function gravity(sps)
  game:GetSErvice("Players").LocalPlayer.Character.HumanoidRootPart.Gravity = sps 
end
getgenv().unctest = unctest
getgenv().ws = ws
getgenv().jp = jp
getgenv().getnearestplayer = getnearestplayer
getgenv().teleporttonearestplayer = teleporttonearestplayer

-- UNC functions, can be added into the actual exe code.
getgenv().hookfunction = function(original, hook) 
    if type(original) ~= "function" then
        error("The first arg must be a function (original func).")
    end
    if type(hook) ~= "function" then
        error("The second arg must be a function (hook).")
    end
    local hooked = function(...)
        return hook(...)
    end
    local info = debug.getinfo(original)
    if info and info.name then
        getgenv()[info.name] = hooked
    else
        error("Failed to get function name")
    end
    return hooked
end

