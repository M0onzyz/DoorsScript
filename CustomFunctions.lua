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

function gravity(sps)
  game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Gravity = sps 
end
getgenv().unctest = unctest
getgenv().ws = ws
getgenv().jp = jp
getgenv().injscreen = injscreen

-- UNC functions, can be added into the actual exe code.

