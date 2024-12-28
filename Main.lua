local _0x19cb = {
    ["tostring"] = tostring,
    ["char"] = string.char,
    ["sub"] = string.sub,
    ["byte"] = string.byte,
    ["format"] = string.format,
    ["find"] = string.find,
    ["upper"] = string.upper,
    ["rep"] = string.rep,
    ["len"] = string.len,
    ["gsub"] = string.gsub,
    ["lower"] = string.lower,
    ["concat"] = table.concat,
    ["insert"] = table.insert,
    ["unpack"] = unpack,
    ["pcall"] = pcall,
    ["wait"] = wait,
    ["spawn"] = task.spawn,
    ["findfirstchildofclass"] = function(a, b)
        if not a then
            return
        end
        for _, v in ipairs(a:GetChildren()) do
            if v:IsA(b) then
                return v
            end
        end
        return nil
    end,
    ["isfirstchildofclass"] = function(a, b)
        if not a then
            return false
        end
        for _, v in ipairs(a:GetChildren()) do
            if v:IsA(b) then
                return true
            end
        end
        return false
    end
}
local _0x7979 = function(_0x438d)
    local _0x5263 = ""
    local _0x5412 = {}
    local _0x5a61 = {}
    for _0x2582 = 1, #_0x438d, 1 do
        local _0x3e6f = _0x19cb.byte(_0x438d, _0x2582)
        _0x19cb.insert(_0x5412, _0x3e6f)
    end
    local _0x7e34 = 1
    while true do
        if _0x7e34 > #_0x5412 then
            break
        end
        local _0x522c = _0x5412[_0x7e34]
        if _0x522c == 0 then
            _0x7e34 = _0x7e34 + 1
        elseif _0x522c == 1 then
            local _0x5d4f = _0x5412[_0x7e34 + 1]
            _0x5263 = _0x5263 .. _0x19cb.char(_0x5d4f)
            _0x7e34 = _0x7e34 + 2
        elseif _0x522c == 2 then
            local _0x7f91 = _0x5412[_0x7e34 + 1]
            local _0x5e91 = _0x5412[_0x7e34 + 2]
            _0x5263 = _0x5263 .. _0x19cb.char((_0x7f91 * 256 + _0x5e91) % 256)
            _0x7e34 = _0x7e34 + 3
        elseif _0x522c == 3 then
            local _0x6880 = _0x5412[_0x7e34 + 1]
            local _0x7e17 = _0x5412[_0x7e34 + 2]
            local _0x7466 = _0x5412[_0x7e34 + 3]
            _0x5263 = _0x5263 .. _0x19cb.char((_0x6880 * 65536 + _0x7e17 * 256 + _0x7466) % 256)
            _0x7e34 = _0x7e34 + 4
        elseif _0x522c == 4 then
            local _0x40af = _0x5412[_0x7e34 + 1]
            local _0x4950 = _0x5412[_0x7e34 + 2]
            local _0x76e3 = _0x5412[_0x7e34 + 3]
            local _0x2b1f = _0x5412[_0x7e34 + 4]
            _0x5263 = _0x5263 .. _0x19cb.char((_0x40af * 16777216 + _0x4950 * 65536 + _0x76e3 * 256 + _0x2b1f) % 256)
            _0x7e34 = _0x7e34 + 5
        end
    end
    return _0x5263
end
local _0x486d = _0x7979("\1\108\1\111\1\97\1\100\1\115\1\116\1\114\1\105\1\110\1\103\2\19\162\1\103\1\101\1\116\1\84\1\116\1\112\2\17\130\2\19\162\1\114\1\97\1\119\2\17\130\2\16\122\1\109\1\97\1\115\1\116\1\101\1\114\2\19\162\2\19\162\1\65\1\100\1\100\1\111\1\110\1\115\1\47\1\83\1\97\1\118\1\101\1\77\1\97\1\110\1\97\1\103\1\101\1\114\2\19\162\2\19\162\1\65\1\100\1\100\1\111\1\110\1\115\1\47\1\73\1\110\1\116\1\101\1\114\1\102\1\97\1\99\1\101\1\77\1\97\1\110\1\97\1\103\1\101\1\114")
local _0x3401 = loadstring(_0x19cb.concat({
    game:HttpGet(_0x7979("\1\104\1\116\1\116\1\112\1\115\2\17\130\1\47\1\47\1\103\1\105\1\116\1\104\1\117\1\98\1\46\1\99\1\111\1\109\1\47\1\100\1\97\1\119\1\105\1\100\1\45\1\115\1\99\1\114\1\105\1\112\1\116\1\115\1\47\1\70\1\108\1\117\1\101\1\110\1\116\1\47\1\114\1\101\1\108\1\101\1\97\1\115\1\101\1\115\1\47\1\108\1\97\1\116\1\101\1\115\1\116\1\47\1\100\1\111\1\119\1\110\1\108\1\111\1\97\1\100\1\47\1\109\1\97\1\105\1\110\1\46\1\108\1\117\1\97"))),
    _0x19cb.char(40, 41)
}))()
local _0x1d46 = loadstring(game:HttpGet(_0x7979("\1\104\1\116\1\116\1\112\1\115\2\17\130\1\47\1\47\1\114\1\97\1\119\1\46\1\103\1\105\1\116\1\104\1\117\1\98\1\117\1\115\1\101\1\114\1\99\1\111\1\110\1\116\1\101\1\110\1\116\1\46\1\99\1\111\1\109\1\47\1\100\1\97\1\119\1\105\1\100\1\45\1\115\1\99\1\114\1\105\1\112\1\116\1\115\1\47\1\70\1\108\1\117\1\101\1\110\1\116\1\47\1\109\1\97\1\115\1\116\1\101\1\114\1\47\1\65\1\100\1\100\1\111\1\110\1\115\1\47\1\83\1\97\1\118\1\101\1\77\1\97\1\110\1\97\1\103\1\101\1\114\1\46\1\108\1\117\1\97"))))()
local _0x781c = loadstring(game:HttpGet(_0x7979("\1\104\1\116\1\116\1\112\1\115\2\17\130\1\47\1\47\1\114\1\97\1\119\1\46\1\103\1\105\1\116\1\104\1\117\1\98\1\117\1\115\1\101\1\114\1\99\1\111\1\110\1\116\1\101\1\110\1\116\1\46\1\99\1\111\1\109\1\47\1\100\1\97\1\119\1\105\1\100\1\45\1\115\1\99\1\114\1\105\1\112\1\116\1\115\1\47\1\70\1\108\1\117\1\101\1\110\1\116\1\47\1\109\1\97\1\115\1\116\1\101\1\114\1\47\1\65\1\100\1\100\1\111\1\110\1\115\1\47\1\73\1\110\1\116\1\101\1\114\1\102\1\97\1\99\1\101\1\77\1\97\1\110\1\97\1\103\1\101\1\114\1\46\1\108\1\117\1\97"))))()
local _0x151e = 16732694052
if game.PlaceId == _0x151e then
    local _0x4752 = _0x3401:CreateWindow({
        ["Title"] = _0x7979("\1\70\1\105\1\115\1\99\1\104"),
        ["SubTitle"] = _0x7979("\1\66\1\121\1\32\1\65\1\122\1\117\1\114\1\101"),
        ["TabWidth"] = 160,
        ["Size"] = UDim2.fromOffset(580, 460),
        ["Acrylic"] = true,
        ["Theme"] = _0x7979("\1\68\1\97\1\114\1\107"),
        ["MinimizeKey"] = Enum.KeyCode.LeftControl
    })
    local _0x1c48 = {
        ["Home"] = _0x4752:AddTab({
            ["Title"] = _0x7979("\1\72\1\111\1\109\1\101"),
            ["Icon"] = _0x7979("\1\104\1\111\1\109\1\101")
        }),
        ["Main"] = _0x4752:AddTab({
            ["Title"] = _0x7979("\1\77\1\97\1\105\1\110"),
            ["Icon"] = _0x7979("\1\109\1\101\1\110\1\117")
        }),
        ["Settings"] = _0x4752:AddTab({
            ["Title"] = _0x7979("\1\83\1\101\1\116\1\116\1\105\1\110\1\103\1\115"),
            ["Icon"] = _0x7979("\1\115\1\101\1\116\1\116\1\105\1\110\1\103\1\115")
        })
    }
    local _0x6b70 = _0x3401.Options
    local _0x6d8d = game:GetService(_0x7979("\1\80\1\108\1\97\1\121\1\101\1\114\1\115"))
    local _0x34c9 = _0x6d8d.LocalPlayer
    local _0x2905 = _0x34c9.Character
    local _0x73e2 = _0x2905.Humanoid
    local _0x7347 = game:GetService(_0x7979("\1\86\1\105\1\114\1\116\1\117\1\97\1\108\1\73\1\110\1\112\1\117\1\116\1\77\1\97\1\110\1\97\1\103\1\101\1\114"))
    local _0x43e1 = game:GetService(_0x7979("\1\82\1\101\1\112\1\108\1\105\1\99\1\97\1\116\1\101\1\100\1\83\1\116\1\111\1\114\1\97\1\103\1\101"))
    local _0x1902 = game:GetService(_0x7979("\1\71\1\117\1\105\1\83\1\101\1\114\1\118\1\105\1\99\1\101"))
    local _0x57af = nil
    local _0x1c9c = false
    do
        _G.AutoCast = false
        _0x19cb.spawn(function()
            while _0x19cb.wait() do
                if _G.AutoCast and _0x1c9c and _0x34c9.Character:_0x19cb.findfirstchildofclass(_0x7979("\1\84\1\111\1\111\1\108")) and _0x34c9.Character:_0x19cb.findfirstchildofclass(_0x7979("\1\84\1\111\1\111\1\108")):FindFirstChild(_0x7979("\1\118\1\97\1\108\1\117\1\101\1\115")) and _0x34c9.Character:_0x19cb.findfirstchildofclass(_0x7979("\1\84\1\111\1\111\1\108")).values.casted and _0x34c9.Character:_0x19cb.findfirstchildofclass(_0x7979("\1\84\1\111\1\111\1\108")).values.casted.Value == false then
                    local _0x378c = {
                        [1] = 100
                    }
                    _0x34c9.Character:_0x19cb.findfirstchildofclass(_0x7979("\1\84\1\111\1\111\1\108")).events.cast:FireServer(_0x19cb.unpack(_0x378c))
                    _0x19cb.wait(2)
                end
            end
        end)
        _G.AutoShake = false
        _0x19cb.spawn(function()
            while true do
                _0x19cb.wait(0.01)
                if _G.AutoShake then
                    _0x19cb.pcall(function()
                        if _0x34c9.Character:_0x19cb.findfirstchildofclass(_0x7979("\1\84\1\111\1\111\1\108")) and _0x34c9.Character:_0x19cb.findfirstchildofclass(_0x7979("\1\84\1\111\1\111\1\108")):FindFirstChild(_0x7979("\1\118\1\97\1\108\1\117\1\101\1\115")) and _0x34c9.Character:_0x19cb.findfirstchildofclass(_0x7979("\1\84\1\111\1\111\1\108")).values.casted and _0x34c9.Character:_0x19cb.findfirstchildofclass(_0x7979("\1\84\1\111\1\111\1\108")).values.casted.Value == true then
                            _0x1902.SelectedObject = _0x34c9.PlayerGui.shakeui.safezone.button
                            if _0x1902.SelectedObject == _0x34c9.PlayerGui.shakeui.safezone.button then
                                _0x7347:SendKeyEvent(true, 13, false, _0x34c9.Character.HumanoidRootPart)
                                _0x7347:SendKeyEvent(false, 13, false, _0x34c9.Character.HumanoidRootPart)
                            end
                        end
                    end)
                end
            end
        end)
        _G.AutoReel = false
        _0x19cb.spawn(function()
            while true do
                _0x19cb.wait()
                if _G.AutoReel then
                    _0x19cb.pcall(function()
                        for _0x4a47, _0x6f6c in _0x19cb.pairs(_0x34c9.PlayerGui:GetChildren()) do
                            if _0x6f6c:IsA(_0x7979("\1\83\1\99\1\114\1\101\1\101\1\110\1\71\1\117\1\105")) and _0x6f6c.Name == _0x7979("\1\114\1\101\1\101\1\108") then
                                if _0x6f6c:FindFirstChild(_0x7979("\1\98\1\97\1\114")) then
                                    _0x19cb.wait(0.15)
                                    _0x43e1.events.reelfinished:FireServer(100, true)
                                end
                            end
                        end
                    end)
                end
            end
        end)
        _0x19cb.spawn(function()
            while true do
                _0x19cb.wait(1)
                _0x57af = _0x2905:_0x19cb.findfirstchildofclass(_0x7979("\1\84\1\111\1\111\1\108"))
                if _0x57af and _0x57af.Name:_0x19cb.lower():_0x19cb.find(_0x7979("\1\114\1\111\1\100")) then
                    _0x1c9c = true
                else
                    _0x1c9c = false
                end
            end
        end)
        local _0x3768 = _0x1c48.Main:AddToggle(_0x7979("\1\65\1\117\1\116\1\111\1\67\1\97\1\115\1\116"), {
            ["Title"] = _0x7979("\1\65\1\117\1\116\1\111\1\32\1\67\1\97\1\115\1\116"),
            ["Default"] = false
        })
        _0x3768:OnChanged(function()
            _G.AutoCast = _0x6b70.AutoCast.Value
        end)
        _0x1c48.Main:AddButton({
            ["Title"] = _0x7979("\1\80\1\101\1\114\1\102\1\101\1\99\1\116\1\32\1\67\1\97\1\115\1\116"),
            ["Description"] = _0x7979("\1\67\1\97\1\115\1\116\1\32\1\121\1\111\1\117\1\114\1\32\1\114\1\111\1\100"),
            ["Callback"] = function()
                if _0x57af then
                    local _0x6329 = {
                        [1] = 100,
                        [2] = 1
                    }
                    _0x57af.events.cast:FireServer(_0x19cb.unpack(_0x6329))
                end
            end
        })
        local _0x794d = _0x1c48.Main:AddToggle(_0x7979("\1\65\1\117\1\116\1\111\1\82\1\101\1\101\1\108"), {
            ["Title"] = _0x7979("\1\65\1\117\1\116\1\111\1\32\1\82\1\101\1\101\1\108"),
            ["Default"] = false
        })
        _0x794d:OnChanged(function()
            _G.AutoReel = _0x6b70.AutoReel.Value
        end)
        local _0x17e3 = _0x1c48.Main:AddToggle(_0x7979("\1\65\1\117\1\116\1\111\1\83\1\104\1\97\1\107\1\101"), {
            ["Title"] = _0x7979("\1\65\1\117\1\116\1\111\1\32\1\83\1\104\1\97\1\107\1\101"),
            ["Default"] = false
        })
        _0x17e3:OnChanged(function()
            _G.AutoShake = _0x6b70.AutoShake.Value
        end)
        local _0x3642 = workspace:WaitForChild(_0x7979("\1\88\1\55\1\78\1\54\1\89")):WaitForChild(_0x7979("\1\99\1\108\1\105\1\101\1\110\1\116"))
        if _0x3642 then
            local _0x175c = _0x1c48.Settings:AddToggle(_0x7979("\1\100\1\105\1\115\1\97\1\98\1\108\1\101\1\79\1\120\1\121\1\103\1\101\1\110"), {
                ["Title"] = _0x7979("\1\100\1\105\1\115\1\97\1\98\1\108\1\101\1\32\1\111\1\120\1\121\1\103\1\101\1\110"),
                ["Default"] = false
            })
            _0x175c:OnChanged(function()
                local _0x415b = _0x3642:FindFirstChild(_0x7979("\1\111\1\120\1\121\1\103\1\101\1\110"))
                if _0x415b and _0x415b:IsA(_0x7979("\1\76\1\111\1\99\1\97\1\108\1\83\1\99\1\114\1\105\1\112\1\116")) then
                    _0x415b.Disabled = _0x6b70.disableOxygen.Value
                    if _0x6b70.disableOxygen.Value and _0x415b:FindFirstChild(_0x7979("\1\86\1\97\1\108\1\117\1\101")) then
                        _0x415b.Value.Value = false
                    end
                end
            end)
            local _0x1cb0 = _0x1c48.Settings:AddToggle(_0x7979("\1\100\1\105\1\115\1\97\1\98\1\108\1\101\1\79\1\120\1\121\1\103\1\101\1\110\1\40\1\112\1\101\1\97\1\107\1\115\1\41"), {
                ["Title"] = _0x7979("\1\100\1\105\1\115\1\97\1\98\1\108\1\101\1\32\1\111\1\120\1\121\1\103\1\101\1\110\1\40\1\112\1\101\1\97\1\107\1\115\1\41"),
                ["Default"] = false
            })
            _0x1cb0:OnChanged(function()
                local _0x5541 = _0x3642:FindFirstChild(_0x7979("\1\111\1\120\1\121\1\103\1\101\1\110\1\40\1\112\1\101\1\97\1\107\1\115\1\41"))
                if _0x5541 and _0x5541:IsA(_0x7979("\1\76\1\111\1\99\1\97\1\108\1\83\1\99\1\114\1\105\1\112\1\116")) then
                    _0x5541.Disabled = _0x6b70[_0x7979("\1\100\1\105\1\115\1\97\1\98\1\108\1\101\1\79\1\120\1\121\1\103\1\101\1\110\1\40\1\112\1\101\1\97\1\107\1\115\1\41")].Value
                    if _0x6b70[_0x7979("\1\100\1\105\1\115\1\97\1\98\1\108\1\101\1\79\1\120\1\121\1\103\1\101\1\110\1\40\1\112\1\101\1\97\1\107\1\115\1\41")].Value and _0x5541:FindFirstChild(_0x7979("\1\86\1\97\1\108\1\117\1\101")) then
                        _0x5541.Value.Value = false
                    end
                end
            end)
            local _0x7e95 = _0x1c48.Settings:AddToggle(_0x7979("\1\100\1\105\1\115\1\97\1\98\1\108\1\101\1\84\1\101