local a=loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()local b=loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()local c=loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()local d=a:CreateWindow({Title="Azure Z",SubTitle="V 0.1",TabWidth=160,Size=UDim2.fromOffset(580,460),Acrylic=true,Theme="Dark",MinimizeKey=Enum.KeyCode.P})local e={Main=d:AddTab({Title="Main",Icon="align-left"})}local f=a.Options;local g=e.Main:AddToggle("AutoClickToggle",{Title="Auto Click",Default=false})local h=false;local function i()while h do game:GetService("ReplicatedStorage").Events.Click4:FireServer()wait(0.1)end end;g:OnChanged(function()h=f.AutoClickToggle.Value;if h then spawn(i)end end)local j=e.Main:AddToggle("AutoClaimToggle",{Title="Auto Claim Reward",Default=false})local k=false;local function l()while k do for m=1,12 do local n={[1]=m}pcall(function()game:GetService("ReplicatedStorage").Functions.ClaimPlaytimeReward:InvokeServer(unpack(n))end)end;wait(1)end end;j:OnChanged(function()k=f.AutoClaimToggle.Value;if k then spawn(l)end end)b:SetLibrary(a)c:SetLibrary(a)b:IgnoreThemeSettings()b:SetIgnoreIndexes({})c:SetFolder("FluentScriptHub")b:SetFolder("FluentScriptHub/specific-game")d:SelectTab(1)a:Notify({Title="Azure Z",Content="The script has been loaded.",Duration=3})b:LoadAutoloadConfig()
