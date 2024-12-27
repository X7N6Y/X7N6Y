local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local gameId = 16732694052

if game.PlaceId == gameId then

	local Window = Fluent:CreateWindow({
		Title = "Fluent " .. Fluent.Version,
		SubTitle = "by dawid",
		TabWidth = 160,
		Size = UDim2.fromOffset(580, 460),
		Acrylic = true,
		Theme = "Dark",
		MinimizeKey = Enum.KeyCode.LeftControl
	})

	local Tabs = {
		Home = Window:AddTab({Title = "Home", Icon = "home"}),
		Main = Window:AddTab({ Title = "Main", Icon = "menu" }),
		Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
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
            while true do
                task.wait()
                if _G.AutoCast and rodEquipped then
                    pcall(function()
                        if currentRod then
                            task.wait(.1)
                            currentRod.events.cast:FireServer(100,1)
                        end
                    end)
                end
            end
        end)


        _G.AutoShake = false
        task.spawn(function()
            while true do
                task.wait()
                if _G.AutoShake then
                    pcall(function()
                         task.wait(0.01)
                        local PlayerGUI = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
                        local shakeUI = PlayerGUI:FindFirstChild("shakeui")
                        if shakeUI and shakeUI.Enabled then
                            local safezone = shakeUI:FindFirstChild("safezone")
                            if safezone then
                                local button = safezone:FindFirstChild("button")
                                if button and button:IsA("ImageButton") and button.Visible then
                                        GuiService.SelectedObject = button
                                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                                end
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
					currentRod.events.cast:FireServer(100,1)
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

	InterfaceManager:BuildInterfaceSection(Tabs.Settings)
	SaveManager:BuildConfigSection(Tabs.Settings)

	Window:SelectTab(1)

	Fluent:Notify({
		Title = "Fluent",
		Content = "The script has been loaded.",
		Duration = 8
	})

	SaveManager:LoadAutoloadConfig()
else
	game.Players.LocalPlayer:Kick("Game not supported")
end