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
	local autoShakeEnabled = false
	local navigationActive = false
	local lastCastTime = 0
	local isMobile = UserInputService.TouchEnabled

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
						local rod = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
						if rod and rod:FindFirstChild("events") and rod.events:FindFirstChild("cast") then
							local args = {
								[1] = 100,
								[2] = 1
							}
							rod.events.cast:FireServer(unpack(args))
							lastCastTime = tick()
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
		
		local AutoShakeToggle = Tabs.Main:AddToggle("AutoShake", {Title = "Auto Shake", Default = false})
		AutoShakeToggle:OnChanged(function()
			autoShakeEnabled = Options.AutoShake.Value
			if autoShakeEnabled then
				task.spawn(function()
					while autoShakeEnabled do
						local shakeButton = nil
						for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
							if v:IsA("TextButton") and v.Text == "SHAKE" then
								shakeButton = v
								break
							end
						end
						
						if shakeButton or tick() - lastCastTime < 0.5 then
							if not navigationActive then
								navigationActive = true
								game:GetService("UserInputService").InputBegan:Connect(function(input, gp)
                                   if input.KeyCode == (isMobile and Enum.KeyCode.Backquote or Enum.KeyCode.Backslash) then
										navigationActive = not navigationActive
										if navigationActive then
											game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default
										else
											game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.LockCenter
										end
									end
								end)
							end
							if navigationActive then
								game:GetService("VirtualInputManager"):SendKeyEvent(false,Enum.KeyCode.Down,false,game)
								wait(0.05)
							end
							if shakeButton then
								game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default
								game:GetService("VirtualInputManager"):SendMouseButtonEvent(shakeButton.AbsolutePosition.X + shakeButton.AbsoluteSize.X / 2, shakeButton.AbsolutePosition.Y + shakeButton.AbsoluteSize.Y / 2, 1, true, nil, false)
								game:GetService("VirtualInputManager"):SendMouseButtonEvent(shakeButton.AbsolutePosition.X + shakeButton.AbsoluteSize.X / 2, shakeButton.AbsolutePosition.Y + shakeButton.AbsoluteSize.Y / 2, 1, false, nil, false)
								game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.LockCenter
							end
						end
						wait(0.1)
					end
				end)
			end
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