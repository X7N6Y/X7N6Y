-- In StarterGui

local themes = {
	Default = {
		ButtonColor = Color3.fromRGB(50, 50, 50),
		ButtonHoverColor = Color3.fromRGB(80, 80, 80),
		TextColor = Color3.fromRGB(255, 255, 255)
	}
}
local currentTheme = themes.Default

local function createButton(parent, text)
	local button = Instance.new("TextButton")
	button.Parent = parent
	button.Size = UDim2.new(0, 150, 0, 40)
	button.Position = UDim2.new(0.5, -75, 0.5, -20)
	button.BackgroundColor3 = currentTheme.ButtonColor
	button.TextColor3 = currentTheme.TextColor
	button.Font = Enum.Font.GothamBold
	button.Text = text

	button.MouseEnter:Connect(function()
		button.BackgroundColor3 = currentTheme.ButtonHoverColor
	end)

	button.MouseLeave:Connect(function()
		button.BackgroundColor3 = currentTheme.ButtonColor
	end)

	return button
end

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Size = UDim2.new(1, 0, 1, 0) -- Fill the screen
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0

local myButton = createButton(frame, "Click Me")

myButton.MouseButton1Click:Connect(function()
	print("Button clicked!")
	-- Do something here when the button is clicked
end)
