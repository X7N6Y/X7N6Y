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
    local rodDetected = false
    local currentRod = nil
    local lastManualCast = 0

    local function detectRod()
        currentRod = game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool") or game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if currentRod and currentRod:FindFirstChild("events") and currentRod.events:FindFirstChild("cast") then
            rodDetected = true
        else
            rodDetected = false
        end
    end

    local function castRod()
        if rodDetected then
            currentRod.events.cast:FireServer(100, 1)
            lastCastTime = tick()
            reelFinished = false
              if autoReelEnabled then
                  local connection
                  connection = game:GetService("ReplicatedStorage").events.reelfinished.OnClientEvent:Connect(function()
                      connection:Disconnect()
                      reelFinished = true
                  end)
            end
        end
    end

    task.spawn(function()
        while true do
            detectRod()
            task.wait(1)
        end
    end)

    local AutoCastToggle = Tabs.Main:AddToggle("AutoCast", {Title = "Auto Cast", Default = false})
    AutoCastToggle:OnChanged(function()
        autoCastEnabled = Options.AutoCast.Value
        if autoCastEnabled then
            task.spawn(function()
                while autoCastEnabled do
                    if rodDetected and not casting and (tick() - lastCastTime >= 0.2) then
                        casting = true
                        castRod()
                        lastCastTime = tick()
                    else
                        casting = false
                    end
                    task.wait()
                end
            end)
        end
    end)

     local castButton = Tabs.Main:AddButton({
        Title = "Perfect Cast",
        Description = "Cast your rod",
    })

     castButton.OnClicked(function()
         if (tick() - lastManualCast >= 0.5) then
            lastManualCast = tick()
            castButton.Text = "Casting..."
            castRod()
             task.wait()
             castButton.Text = "Perfect Cast"
         end
     end)

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