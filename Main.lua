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

	local autoCastEnabled = false
	local autoReelEnabled = false
    local lastCastTime = 0
    local reelFinished = true
    local casting = false

	do
		

		local AutoCastToggle = Tabs.Main:AddToggle("AutoCast", {Title = "Auto Cast", Default = false})
		AutoCastToggle:OnChanged(function()
			autoCastEnabled = Options.AutoCast.Value
			if autoCastEnabled then
				task.spawn(function()
					while autoCastEnabled do
                        local rod = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
                        if rod and rod:FindFirstChild("events") and rod.events:FindFirstChild("cast") and not casting then
                            casting = true
							local args = {
								[1] = 100,
								[2] = 1
							}
							rod.events.cast:FireServer(unpack(args))
							lastCastTime = tick()
                            reelFinished = false
                            task.delay(0.7, function()
                                if autoReelEnabled then
                                    local args = {
                                        [1] = 100,
                                        [2] = true
                                    }
                                    game:GetService("ReplicatedStorage").events.reelfinished:FireServer(unpack(args))
                                    reelFinished = true
                                    casting = false
                                end
                            end)
						else
                            casting = false
                        end
						wait(0.2)
					end
				end)
			end
		end)
		
		Tabs.Main:AddButton({
			Title = "Perfect Cast",
			Description = "Cast your rod",
			Callback = function()
				local rod = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
				if rod and rod:FindFirstChild("events") and rod.events:FindFirstChild("cast") then
					local args = {
						[1] = 100,
						[2] = 1
					}
					rod.events.cast:FireServer(unpack(args))
                    lastCastTime = tick()
                    reelFinished = false
                    task.delay(0.7, function()
                        if autoReelEnabled then
                            local args = {
                                [1] = 100,
                                [2] = true
                            }
                            game:GetService("ReplicatedStorage").events.reelfinished:FireServer(unpack(args))
                             reelFinished = true
                        end
                    end)
				end
			end
		})

		local AutoReelToggle = Tabs.Main:AddToggle("AutoReel", {Title = "Auto Reel", Default = false})
		AutoReelToggle:OnChanged(function()
			autoReelEnabled = Options.AutoReel.Value
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