local teamCheck = false
local fov = 150
local smoothing = 1

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

getgenv().AimbotEnabled = true -- Start enabled

local FOVring
local loop

local function createFOVCircle()
    if FOVring then FOVring:Remove() end -- Remove the old circle if it exists
    FOVring = Drawing.new("Circle")
    FOVring.Visible = false
    FOVring.Thickness = 1.5
    FOVring.Radius = fov
    FOVring.Transparency = 1
    FOVring.Color = Color3.fromRGB(255, 128, 128)
    FOVring.Position = Camera.ViewportSize / 2
end

local function getClosest(cframe)
    local ray = Ray.new(cframe.Position, cframe.LookVector).Unit
    local target = nil
    local mag = math.huge

    for _, v in pairs(Players:GetPlayers()) do
        if v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v ~= LocalPlayer and (v.Team ~= LocalPlayer.Team or not teamCheck) then
            local magBuf = (v.Character.Head.Position - ray:ClosestPoint(v.Character.Head.Position)).Magnitude
            if magBuf < mag then
                mag = magBuf
                target = v
            end
        end
    end

    return target
end

local function startAimbot()
    createFOVCircle() -- Recreate the FOV circle
    FOVring.Visible = true
    loop = RunService.RenderStepped:Connect(function()
        local pressed = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
        if pressed then
            local curTar = getClosest(Camera.CFrame)
            if curTar and curTar.Character and curTar.Character:FindFirstChild("Head") then
                local ssHeadPoint = Camera:WorldToScreenPoint(curTar.Character.Head.Position)
                ssHeadPoint = Vector2.new(ssHeadPoint.X, ssHeadPoint.Y)
                if (ssHeadPoint - FOVring.Position).Magnitude < fov then
                    Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, curTar.Character.Head.Position), smoothing)
                end
            end
        end
    end)
end

local function stopAimbot()
    if loop then loop:Disconnect() end -- Disconnect the loop
    if FOVring then FOVring.Visible = false end -- Hide the FOV circle
end

-- Monitor AimbotEnabled
task.spawn(function()
    while true do
        task.wait(0.1) -- Check every 0.1 seconds
        if getgenv().AimbotEnabled and not loop then
            startAimbot()
        elseif not getgenv().AimbotEnabled and loop then
            stopAimbot()
        end
    end
end)
