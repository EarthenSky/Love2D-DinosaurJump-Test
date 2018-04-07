GroundTile = {}

-- This is a class constructor
function GroundTile:new(xIn)
    -- This line makes a table with all the class's variables in it.
    thisObj = {position = {x = xIn, y = floorPosition - 84}}

    -- This line does something important; to do with the dot operator.
    self.__index = self

    -- This line sets the object's metatable to be equal to the table made earlier.
    return setmetatable(thisObj, self)
end

-- This is the class's draw function.  The "this" keyword comes from the colon ":".
-- It's like c++, functions separated from the class.
function GroundTile:draw()
    love.graphics.draw(ground, self.position.x, self.position.y)
end

function GroundTile:update(dt)
    -- Moves the block of ground until it is out of the screen.
    self.position.x = self.position.x - (groundMoveSpeed * dt)

    -- Checks if the ground piece needs to be moved.
    if self.position.x < -1024 then
        self.position.x = 1023
    end
end

return GroundTile
