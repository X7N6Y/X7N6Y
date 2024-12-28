local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local gameId = 16732694052

if game.PlaceId == gameId then

	local Window = Fluent:CreateWindow({
		Title = "Fisch",
		SubTitle = "By Azure",
		TabWidth = 160,
		Size = UDim2.fromOffset(580, 460),
		Acrylic = true,
		Theme = "Dark",
		MinimizeKey = Enum.KeyCode.LeftControl
	})

	local Tabs = {
		Home = Window:AddTab({Title = "Home", Icon = "home"}),
		Main = Window:AddTab({ Title = "Main", Icon = "menu" }),
		Misc = Window:AddTab({ Title = "Misc", Icon = "settings" }),
	}

	local Options = Fluent.Options

    local Player = game:GetService("Players")
    local LocalPlayer = Player.LocalPlayer
    local Char = LocalPlayer.Character
    local Humanoid = Char.Humanoid
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local GuiService = game:GetService("GuiService")
    local currentRod = nil
    local rodEquipped = false


	do
		
        _G.AutoCast = false
        task.spawn(function()
            while wait() do
                if _G.AutoCast and rodEquipped and LocalPlayer.Character:FindFirstChildOfClass('Tool') and LocalPlayer.Character:FindFirstChildOfClass('Tool'):FindFirstChild("values") and LocalPlayer.Character:FindFirstChildOfClass('Tool').values.casted and LocalPlayer.Character:FindFirstChildOfClass('Tool').values.casted.Value == false then
                    local args = {
                        [1] = 100
                    }
                    
                    LocalPlayer.Character:FindFirstChildOfClass('Tool').events.cast:FireServer(unpack(args))
                    wait(2)
                end
            end
        end)


        _G.AutoShake = false
        task.spawn(function()
            while true do
                task.wait(.01)
                if _G.AutoShake then
                    pcall(function()
                        if LocalPlayer.Character:FindFirstChildOfClass('Tool') and LocalPlayer.Character:FindFirstChildOfClass('Tool'):FindFirstChild("values") and LocalPlayer.Character:FindFirstChildOfClass('Tool').values.casted and LocalPlayer.Character:FindFirstChildOfClass('Tool').values.casted.Value == true then
                            GuiService.SelectedObject = LocalPlayer.PlayerGui.shakeui.safezone.button
                            if GuiService.SelectedObject == LocalPlayer.PlayerGui.shakeui.safezone.button then
                                VirtualInputManager:SendKeyEvent(true, 13, false, LocalPlayer.Character.HumanoidRootPart)
                                VirtualInputManager:SendKeyEvent(false, 13, false, LocalPlayer.Character.HumanoidRootPart)
                            end
                        end
                    end)
                end
            end
        end)
        -- AutoReel
        _G.AutoReel = false
        task.spawn(function()
            while true do
                task.wait()
                if _G.AutoReel then
                    pcall(function()
                        for i,v in pairs(LocalPlayer.PlayerGui:GetChildren()) do
                            if v:IsA "ScreenGui" and v.Name == "reel"then
                                if v:FindFirstChild "bar" then
                                    task.wait(.15)
                                        ReplicatedStorage.events.reelfinished:FireServer(100,true)
                                end
                            end
                        end
                    end)
                end
            end
        end)

        

        task.spawn(function()
            while true do
                task.wait(1)
                currentRod = Char:FindFirstChildOfClass("Tool")
                if currentRod and currentRod.Name:lower():find("rod") then
                    rodEquipped = true
                else
                    rodEquipped = false
                end
            end
        end)

		local AutoCastToggle = Tabs.Main:AddToggle("AutoCast", {Title = "Auto Cast", Default = false})
		AutoCastToggle:OnChanged(function()
			_G.AutoCast = Options.AutoCast.Value
		end)
		
		Tabs.Main:AddButton({
			Title = "Perfect Cast",
			Description = "Cast your rod",
			Callback = function()
                if currentRod then
					local args = {
                        [1] = 100,
                        [2] = 1
                    }
					currentRod.events.cast:FireServer(unpack(args))
				end
			end
		})

		local AutoReelToggle = Tabs.Main:AddToggle("AutoReel", {Title = "Auto Reel", Default = false})
		AutoReelToggle:OnChanged(function()
			_G.AutoReel = Options.AutoReel.Value
		end)
        
        local AutoShakeToggle = Tabs.Main:AddToggle("AutoShake", {Title = "Auto Shake", Default = false})
        AutoShakeToggle:OnChanged(function()
            _G.AutoShake = Options.AutoShake.Value
        end)
		



        local clientFolder = workspace:WaitForChild("X7N6Y"):WaitForChild("client")
        if clientFolder then
            local disableOxygenToggle = Tabs.Misc:AddToggle("disableOxygen", {Title = "disable oxygen", Default = false})
            disableOxygenToggle:OnChanged(function()
                local oxygenScript = clientFolder:FindFirstChild("oxygen")
                if oxygenScript and oxygenScript:IsA("LocalScript") then
                    oxygenScript.Disabled = Options.disableOxygen.Value
                     if  Options.disableOxygen.Value and oxygenScript:FindFirstChild("Value") then
                         oxygenScript.Value.Value = false
                    end
                end
            end)
            local disableOxygenPeaksToggle = Tabs.Misc:AddToggle("disableOxygen(peaks)", {Title = "disable oxygen(peaks)", Default = false})
            disableOxygenPeaksToggle:OnChanged(function()
                 local oxygenPeaksScript = clientFolder:FindFirstChild("oxygen(peaks)")
                if oxygenPeaksScript and oxygenPeaksScript:IsA("LocalScript") then
                     oxygenPeaksScript.Disabled = Options["disableOxygen(peaks)"].Value
                     if Options["disableOxygen(peaks)"].Value and oxygenPeaksScript:FindFirstChild("Value")  then
                         oxygenPeaksScript.Value.Value = false
                     end
                end
            end)
            local disableTemperatureToggle = Tabs.Misc:AddToggle("disableTemperature", {Title = "disable temperature", Default = false})
            disableTemperatureToggle:OnChanged(function()
                local temperatureScript = clientFolder:FindFirstChild("temperature")
                if temperatureScript and temperatureScript:IsA("LocalScript") then
                    temperatureScript.Disabled = Options.disableTemperature.Value
                    if Options.disableTemperature.Value and temperatureScript:FindFirstChild("Value") then
                        temperatureScript.Value.Value = false
                   end
                end
            end)
        end

		Tabs.Home:AddParagraph({
			Title = "Credit",
			Content = "Made by Azure"
		})
		Tabs.Home:AddButton({
			Title = "Discord (Copy)",
			Description = "Copy the discord link to your clipboard",
			Callback = function()
				setclipboard("https://discord.gg/cUujpKKdtX")
				
			end
		})
	end

	SaveManager:SetLibrary(Fluent)
	InterfaceManager:SetLibrary(Fluent)

	SaveManager:IgnoreThemeSettings()
	SaveManager:SetIgnoreIndexes({})
	InterfaceManager:SetFolder("FluentScriptHub")
	SaveManager:SetFolder("FluentScriptHub/specific-game")

	InterfaceManager:BuildInterfaceSection(Tabs.Misc)
	SaveManager:BuildConfigSection(Tabs.Misc)

	Window:SelectTab(1)

	Fluent:Notify({
		Title = "Fluent",
		Content = "The script has been loaded.",
		Duration = 8
	})
    local CoreGui = game:GetService("CoreGui"):FindFirstChild("RobloxGui")
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CustomScreenGui"
    ScreenGui.Parent = CoreGui
    local CloseOpen = Instance.new("TextButton")
    CloseOpen.Name = "CloseOpenButton"
    CloseOpen.Text = ""
    CloseOpen.Parent = ScreenGui
    CloseOpen.Size = UDim2.new(0, 30, 0, 30)
    CloseOpen.Position = UDim2.new(0.95, -30, 0.5, -15)
	CloseOpen.AnchorPoint = Vector2.new(1,0.5)
    CloseOpen.BackgroundColor3 = Color3.fromRGB(255, 164, 164)
    CloseOpen.BackgroundTransparency = 0
    CloseOpen.BorderSizePixel = 0
    CloseOpen.Text = ""
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(1, 0)
    UICorner.Parent = CloseOpen
    local function CloseOpenFunc()
        for i,v in pairs(game:GetService("CoreGui"):FindFirstChild("ScreenGui"):GetChildren()) do
            if v.Name == "Frame" and v:FindFirstChild("TextLabel") then
                if v.Visible then
                    v.Visible = false
                    game:GetService("CoreGui"):FindFirstChild("ScreenGui").Enabled = false
                else
                    v.Visible = true
                    game:GetService("CoreGui"):FindFirstChild("ScreenGui").Enabled = true
                end
            end
        end
    end
    CloseOpen.Activated:Connect(CloseOpenFunc)

	SaveManager:LoadAutoloadConfig()
else
	game.Players.LocalPlayer:Kick("Game not supported")
end