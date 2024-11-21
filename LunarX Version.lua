if not getgenv().LunarXloaded then
    getgenv().LunarXloaded = true
	-- Load Esp Script, Custom Functions, And RTX
	loadstring(game:HttpGet("https://raw.githubusercontent.com/M0onzyz/SeraphimCT/refs/heads/main/CustomFunctions.lua"))()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/M0onzyz/SeraphimCT/refs/heads/main/SimpleESP.lua"))()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/M0onzyz/SeraphimCT/refs/heads/main/RTXwithtoggle"))()
	--// Services
	local RunService: RunService = game:GetService("RunService")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local IsStudio = RunService:IsStudio()
	
	--// Fetch library
	local ImGui
	if IsStudio then
	    ImGui = require(ReplicatedStorage:WaitForChild("ImGui"))
	else
	    local SourceURL = 'https://raw.githubusercontent.com/M0onzyz/SeraphimAPI/refs/heads/main/ImGuiModified.lua'
	    ImGui = loadstring(game:HttpGet(SourceURL))()
	end
	--// Window
	local Window = ImGui:CreateWindow({
	    Title = "Lunar X ",
	    Size = UDim2.new(0, 500, 0, 300),
	    Position = UDim2.new(0.5, -225, 0, 70) -- Center the window
	})
	Window:Center()
	
	local ExecutorTab = Window:CreateTab({
	    Name = "Execution"
	})
	local PlayerTab = Window:CreateTab({
	    Name = "Player"
	})
	local ExtrasTab = Window:CreateTab({
	    Name = "Extra"
	})
	local CreditsTab = Window:CreateTab({
	    Name = "Credits"
	})
	local UserInputService = game:GetService("UserInputService")
	local CoreGui = game:GetService("CoreGui")
	
	-- Reference to your window (replace 'Window' with your actual UI reference)
	local Window = CoreGui:FindFirstChild("ScreenGui") and CoreGui.ScreenGui.Window_
	
	-- Function to toggle visibility
	local function ToggleVisibility()
	    if Window then
	        Window.Visible = not Window.Visible -- Toggle the visibility
	    else
	        warn("LunarX Window Not Found")
	    end
	end
	
	-- Listen for Insert key press
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
	    if not gameProcessed and input.KeyCode == Enum.KeyCode.Insert then
	        ToggleVisibility()
	    end
	end)
	
	--// Textbox
	local inputText = ""  -- Initialize variable to store text input
	
	-- Create the multiline input and store the reference to the text field
	local TextBox = ExecutorTab:InputTextMultiline({
	    PlaceHolder = "Type here",
	})
	
	local TextInput = game:GetService("CoreGui").ScreenGui.Window_.Content.Body.Execution.TextInput_
	local Input = TextInput:WaitForChild("Input", 5) -- Wait for the "Input" object
	local function ClearText()
	if Input then
	Input.Text = ""
	else
	    warn("TextBox not found!")
	end
	end
	local function ExecuteText()
	    if Input and Input:IsA("TextBox") then -- Ensure Input exists and is a TextBox
	        local scriptText = Input.Text
	        if scriptText and scriptText ~= "" then -- Check if the text is not nil or empty
	            local success, err = pcall(function()
	                loadstring(scriptText)()
	            end)
	            if not success then
	                warn("Script Error:", err)
	            end
	        else
	            print("No script provided to execute!")
	        end
	    else
	        warn("Invalid")
	    end
	end
	--// Buttons
	ExecutorTab:Button({
	    Text = "Execute",
	    Callback = function()
	    ExecuteText()
	    end,
	})
	
	ExecutorTab:Button({
	    Text = "Clear  ",
	    Callback = function()
	ClearText()
	    end,
	})
	
	local player = game:GetService("Players").LocalPlayer
	local wspeed = 16
	local jpower = 50
	
	PlayerTab:Slider({
	    Label = "Walkspeed",
	    CornerRadius = UDim.new(1, 0),
	    Value = 16,
	    wspeed = Value,
	    MinValue = 1,
	    MaxValue = 125,
	    Callback = function(value)
	    end
	})
	
	-- Button to set Walkspeed using the updated value of wspeed
	PlayerTab:Button({
	    Text = "Set Walkspeed",
	    Callback = function()
	     wspeed = game:GetService("CoreGui").ScreenGui.Window_.Content.Body.Player.Walkspeed.ValueText.ContentText
	     game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = wspeed
	    end
	})
	PlayerTab:Slider({
	    Label = "JumpPower",
	    CornerRadius = UDim.new(1, 0),
	    Value = 50,
	    wspeed = Value,
	    MinValue = 10,
	    MaxValue = 300,
	    Callback = function(value)
	    end
	})
	
	PlayerTab:Button({
	    Text = "Set JumpPower",
	    Callback = function()
	     jpower = game:GetService("CoreGui").ScreenGui.Window_.Content.Body.Player.JumpPower.ValueText.ContentText
	     game.Players.LocalPlayer.Character.Humanoid.JumpPower = jpower
	    end
	})
	ExtrasTab:Checkbox({
	    Label = "Simple Aimbot",
	    Value = false,
	    Callback = function(self, Value)
	        if Value == true then
	            loadstring(game:HttpGet("https://raw.githubusercontent.com/M0onzyz/SeraphimCT/refs/heads/main/AimbotSimple.Lua"))()
	        else
	            getgenv().AimbotEnabled = false
	        end
	    end,
	})
	ExtrasTab:Checkbox({
	    Label = "Simple ESP",
	    Value = false,
	    Callback = function(self, Value)
	        if Value == true then
	            _G.ESPToggle = true
	        else
	            _G.ESPToggle = false
	        end
	    end,
	})
	ExtrasTab:Button({
	    Text = "RTX (Toggle Semi Functional)",
	    Callback = function()
	    	LightingEffects:Toggle()
	    end
	})
	CreditsTab:Label({
	Text = "Made By M0onzyz (Discord)"
	})
else
end
