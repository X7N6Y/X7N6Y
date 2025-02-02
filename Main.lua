local Games = loadstring(game:HttpGet('https://raw.githubusercontent.com/X7N6Y/X7N6Y/refs/heads/main/List.lua'))()

for PlaceID, Execute in pairs(Games) do
    if PlaceID == game.PlaceId then
        loadstring(game:HttpGet(Execute))()
    end
end