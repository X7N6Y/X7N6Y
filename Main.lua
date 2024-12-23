-- Main.lua (simplified for testing)
print("[X7N6Y_Main]: Script loaded successfully.")

return function(screenGui)
    print("[X7N6Y_Main]: createMainUI function called.")
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.2, 0, 0.2, 0)
    frame.Position = UDim2.new(0.4, 0, 0.4, 0)
    frame.BackgroundColor3 = Color3.new(1, 0, 0)
    frame.Parent = screenGui
    return frame
end