local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

local mainGui = Instance.new("ScreenGui")
mainGui.Name = "MainGui"
mainGui.Parent = playerGui
mainGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 200, 0, 100)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -50)
mainFrame.BackgroundColor3 = Color3.fromRGB(50,50,50)
mainFrame.BorderColor3 = Color3.fromRGB(0,0,0)
mainFrame.BorderSizePixel = 2
mainFrame.Parent = mainGui

local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Text = "Toggle"
toggleButton.Size = UDim2.new(0, 100, 0, 30)
toggleButton.Position = UDim2.new(0.5, -50, 0.5, -15)
toggleButton.BackgroundColor3 = Color3.fromRGB(80,80,80)
toggleButton.TextColor3 = Color3.fromRGB(255,255,255)
toggleButton.BorderColor3 = Color3.fromRGB(0,0,0)
toggleButton.BorderSizePixel = 2
toggleButton.Font = Enum.Font.SourceSans
toggleButton.TextScaled = true
toggleButton.Parent = mainFrame

local iconImage = Instance.new("ImageLabel")
iconImage.Name = "IconImage"
iconImage.Size = UDim2.new(0, 25, 0, 25)
iconImage.Position = UDim2.new(0, 5, 0, 5)
iconImage.BackgroundTransparency = 1
iconImage.Image = "rbxassetid://111176864113621"
iconImage.Parent = mainFrame


local isGuiVisible = true

local function toggleGui()
	isGuiVisible = not isGuiVisible
	mainFrame.Visible = isGuiVisible
end

toggleButton.MouseButton1Click:Connect(toggleGui)

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if gameProcessedEvent then return end
	if input.KeyCode == Enum.KeyCode.RightShift then
		toggleGui()
	end
end)
