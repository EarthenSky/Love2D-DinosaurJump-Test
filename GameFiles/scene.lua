local Scene = {}

-- Tile is equal to the module that is loaded.
tile = require("groundTile")

-- tile:new(x) makes a new *instance* of tile.
local groundTileList = {tile:new(0), tile:new(1024)}

-- Draw function.
function Scene.draw()
    -- i is the key and v is value. -> python.
    for i,v in ipairs(groundTileList) do
        groundTileList[i]:draw()
    end
end

-- Update function.
function Scene.update(dt)
    -- i is the key and v is value. -> python.
    for i,v in ipairs(groundTileList) do
        groundTileList[i]:update(dt)
    end
end

return Scene
