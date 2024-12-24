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
		Testing = Window:AddTab({Title = "Testing", Icon = ""})
	}

	local Options = Fluent.Options

	local autoCastEnabled = false
	local autoReelEnabled = false

	do
		Fluent:Notify({
			Title = "Notification",
			Content = "This is a notification",
			SubContent = "SubContent",
			Duration = 5
		})

		local AutoCastToggle = Tabs.Main:AddToggle("AutoCast", {Title = "Auto Cast", Default = false})
		AutoCastToggle:OnChanged(function()
			autoCastEnabled = Options.AutoCast.Value
			if autoCastEnabled then
				task.spawn(function()
					while autoCastEnabled do
						local args = {
							[1] = 100,
							[2] = 1
						}
						
						if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Wisdom Rod") then
							game:GetService("Players").LocalPlayer.Character:FindFirstChild("Wisdom Rod").events.cast:FireServer(unpack(args))
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
				local args = {
					[1] = 100,
					[2] = 1
				}

				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Wisdom Rod") then
					game:GetService("Players").LocalPlayer.Character:FindFirstChild("Wisdom Rod").events.cast:FireServer(unpack(args))
				end
			end
		})

		local AutoReelToggle = Tabs.Main:AddToggle("AutoReel", {Title = "Auto Reel", Default = false})
		AutoReelToggle:OnChanged(function()
			autoReelEnabled = Options.AutoReel.Value
			if autoReelEnabled then
				task.spawn(function()
					while autoReelEnabled do
						local args = {
							[1] = 100,
							[2] = true
						}
						game:GetService("ReplicatedStorage").events.reelfinished:FireServer(unpack(args))
						wait(0.2)
					end
				end)
			end
		end)
		
		Tabs.Testing:AddButton({
			Title = "Dialog Button",
			Callback = function()
				Window:Dialog({
					Title = "Test Dialog",
					Content = "This is a test dialog in the testing tab.",
					Buttons = {
						{
							Title = "Okay",
							Callback = function()
								print("Okay button pressed")
							end
						}
					}
				})
			end
		})
		Tabs.Home:AddParagraph({
			Title = "Credit",
			Content = "Made by Azure"
		})
		Tabs.Home:AddButton({
			Title = "Discord (Copy)",
			Description = "Copy the discord link to your clipboard",
			Callback = function()
				setclipboard("https://discord.gg/cUujpKKdtX")
				Fluent:Notify({
					Title = "Discord Copied",
					Content = "Discord link copied to clipboard!"
				})
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