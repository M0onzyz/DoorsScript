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
function injscreen()
  local upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	local lowerCase = "abcdefghijklmnopqrstuvwxyz"
	local numbers = "0123456789"
	local symbols = "!@#$%&()*+-,./\:;<=>?^[]{}"
	local characterSet = upperCase .. lowerCase .. numbers .. symbols
	
	local keyLength = 32
	local LunarXName = ""
	
	for	i = 1, keyLength do
		local rand = math.random(#characterSet)
		LunarXName = LunarXName .. string.sub(characterSet, rand, rand)
	end
	
	local LunarXInjectionScreen = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local TextBackground = Instance.new("ImageLabel")
	local Logo = Instance.new("ImageLabel")
	local UICorner = Instance.new("UICorner")
	local TextFrame = Instance.new("Frame")
	local TFName = Instance.new("TextLabel")
	local Description = Instance.new("TextLabel")
	
	LunarXInjectionScreen.Name = LunarXName
	LunarXInjectionScreen.Parent = game.CoreGui
	LunarXInjectionScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	Main.Name = "Main"
	Main.Parent = LunarXInjectionScreen
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.ClipsDescendants = true
	Main.Position = UDim2.new(0.5, 0, 0.5, -20)
	Main.Size = UDim2.new(1, 0, 1, 40)
	Main.Visible = false
	
	TextBackground.Name = "TextBackground"
	TextBackground.Parent = Main
	TextBackground.AnchorPoint = Vector2.new(0.5, 0.5)
	TextBackground.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextBackground.BackgroundTransparency = 1.000
	TextBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextBackground.BorderSizePixel = 0
	TextBackground.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextBackground.Size = UDim2.new(1, 0, 1, 0)
	TextBackground.Image = "http://www.roblox.com/asset/?id=95969232922228"
	TextBackground.ImageColor3 = Color3.fromRGB(40, 40, 40)
	TextBackground.ScaleType = Enum.ScaleType.Tile
	TextBackground.TileSize = UDim2.new(0, 300, 0, 300)
	
	Logo.Name = "Logo"
	Logo.Parent = Main
	Logo.AnchorPoint = Vector2.new(0.5, 0.5)
	Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo.BackgroundTransparency = 1.000
	Logo.BorderSizePixel = 0
	Logo.ClipsDescendants = true
	Logo.Position = UDim2.new(0.5, 0, 0.5, 0)
	Logo.Size = UDim2.new(0, 115, 0, 115)
	Logo.Image = "http://www.roblox.com/asset/?id=6924028719"
	
	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Main
	
	TextFrame.Name = "TextFrame"
	TextFrame.Parent = Main
	TextFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	TextFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextFrame.BackgroundTransparency = 1.000
	TextFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextFrame.BorderSizePixel = 0
	TextFrame.Position = UDim2.new(0.5, 159, 0.5, 0)
	TextFrame.Size = UDim2.new(0, 103, 0, 58)
	
	TFName.Name = "TFName"
	TFName.Parent = TextFrame
	TFName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TFName.BackgroundTransparency = 1.000
	TFName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TFName.BorderSizePixel = 0
	TFName.ClipsDescendants = true
	TFName.Size = UDim2.new(1, 0, 0, 36)
	TFName.Font = Enum.Font.SourceSans
	TFName.Text = "LunarX"
	TFName.TextColor3 = Color3.fromRGB(255, 255, 255)
	TFName.TextSize = 40.000
	TFName.TextTransparency = 1.000
	TFName.TextXAlignment = Enum.TextXAlignment.Left
	
	Description.Name = "Description"
	Description.Parent = TextFrame
	Description.AnchorPoint = Vector2.new(0, 1)
	Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Description.BackgroundTransparency = 1.000
	Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Description.BorderSizePixel = 0
	Description.ClipsDescendants = true
	Description.Position = UDim2.new(0, 0, 1, 0)
	Description.Size = UDim2.new(1, 0, 0, 22)
	Description.Font = Enum.Font.SourceSans
	Description.Text = "Made By M0onzyz"
	Description.TextColor3 = Color3.fromRGB(255, 255, 255)
	Description.TextSize = 17.000
	Description.TextTransparency = 1.000
	Description.TextXAlignment = Enum.TextXAlignment.Left
end
	
	local function TIBAKZY_fake_script()
		local script = Instance.new('LocalScript', LunarXInjectionScreen)
	
		BFrame = script.Parent.Main
		TB = BFrame.TextBackground
		Logo = BFrame.Logo
		
		TFrame = BFrame.TextFrame
		Name = TFrame.TFName
		Desc = TFrame.Description
		
		-- Set Properties Values
		
		BFrame.Visible = true
		
		BFrame.Transparency = 1
		Logo.ImageTransparency = 1
		TB.ImageTransparency = 1
		
		Name.TextTransparency = 1
		Desc.TextTransparency = 1
		
		TFrame.Position = UDim2.new(0.5,150,0.5,0)
		Logo.Size = UDim2.new(0,115,0,115)
		
		-- Wait until the Game is Loaded
		repeat task.wait(1) until game:IsLoaded()
		
		
		-- Install the Blurring Effect
		BlurRadius = 0
		BlurEffect = Instance.new("BlurEffect", game.Lighting)
		
		-- Fade in Nihon Logo
		game:GetService("TweenService"):Create(Logo, TweenInfo.new(1), {ImageTransparency = 0}):Play()
		
		-- Fade in Blurring Effect
		for i=1, 50 do
			BlurRadius = BlurRadius+1 
			BlurEffect.Size = BlurRadius
			task.wait(0.01)
		end
		
		-- Fade in Background and Text Background
		game:GetService("TweenService"):Create(BFrame, TweenInfo.new(1), {Transparency = 0}):Play()
		game:GetService("TweenService"):Create(TB, TweenInfo.new(1), {ImageTransparency = 0}):Play()
		
		-- Wait 2 Seconds
		task.wait(2)
		
		-- Remove Blurring Effect
		BlurEffect:Destroy()
		
		-- Shrink Background and Logo
		BFrame:TweenSize(UDim2.new(0, 248,0, 153), "Out", "Quad", 1, true)
		Logo:TweenSize(UDim2.new(0, 80, 0, 80), "Out", "Quad", 1, true)
		
		-- Wait 1 Second
		task.wait(1)
		
		-- Shift Position of Logo and Text Frame so that they are next to each other
		Logo:TweenPosition(UDim2.new(0.5,-50,0.5,0), "Out", "Quad", 1, true)
		TFrame:TweenPosition(UDim2.new(0.5,50,0.5,0), "Out", "Quad", 1, true)
		
		-- Fade in Name and Description
		game:GetService("TweenService"):Create(Name, TweenInfo.new(1), {TextTransparency = 0}):Play()
		game:GetService("TweenService"):Create(Desc, TweenInfo.new(1), {TextTransparency = 0}):Play()
		
		-- Wait 2 Seconds
		task.wait(2)
		
		-- Return Logo and TextFrame to Original Position
		Logo:TweenPosition(UDim2.new(0.5,0,0.5,0), "Out", "Quad", 1, true)
		TFrame:TweenPosition(UDim2.new(0.5,150,0.5,0), "Out", "Quad", 1, true)
		
		-- Fade out Background and Text Background
		game:GetService("TweenService"):Create(Name, TweenInfo.new(1), {TextTransparency = 1}):Play()
		game:GetService("TweenService"):Create(Desc, TweenInfo.new(1), {TextTransparency = 1}):Play()
		
		-- Wait 2 Seconds
		task.wait(2)
		
		-- Shrink Background into a Square
		BFrame:TweenSize(UDim2.new(0, 153,0, 153), "Out", "Quad", 0.5, true)
		
		task.wait(0.5)
		
		-- Shrink Background and Logo into Nothing
		Logo:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.5, true)
		BFrame:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.5, true)
		
		-- Wait 1 Second
		task.wait(1)
		
		-- Remove GUI Entirely
		script.Parent:Destroy()
		
		
	end
	coroutine.wrap(TIBAKZY_fake_script)()
	wait(7)
	--Injection Screen End
end
function gravity(sps)
  game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Gravity = sps 
end
local function
getgenv().unctest = unctest
getgenv().ws = ws
getgenv().jp = jp
getgenv().injscreen = injscreen

-- UNC functions, can be added into the actual exe code.

