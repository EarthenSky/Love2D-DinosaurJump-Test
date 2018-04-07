local Spawner = {}

-- cactusObj is equal to the module that is loaded.
local cactusObj = require("cactus")

-- This list holds all the cacti that attack the player.
local cactusList = {}

-- This function adds a cactus object to the cactus list.
local function spawnCactus()
    cactusList[#cactusList + 1] = cactusObj:new()
end

-- This function removes the first element of the list.
function destroyCactus()
    table.remove(cactusList, 1)
end

-- Draw function.
function Spawner.draw()
    -- i is the key and v is value. -> python.
    for i,v in ipairs(cactusList) do
        cactusList[i]:draw()
    end
end

-- Update function.
local timeCounter = 0
function Spawner.update(dt)
    -- i is the key and v is value. -> python.
    for i,v in ipairs(cactusList) do
        cactusList[i]:update(dt)
    end

    -- inc timeCounter by the time last frame took to pass. (dt*1000)
    timeCounter = timeCounter + (dt * 1000)

    -- If 1000 ms have occured.
    if timeCounter > 800 then
        timeCounter = timeCounter - 800

        -- Check if game will spawn a cactus.
        if love.math.random(1, 3) == 1 then
            spawnCactus()
        end
    end

end

return Spawner
