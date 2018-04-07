Cactus = {}

-- This is a class constructor
function Cactus:new()
    -- This line makes a table with all the class's variables in it.
    thisObj = {position = {x=screenSize.x*2, y=floorPosition-92}}

    -- This line does something important; to do with the dot operator.
    self.__index = self

    -- This line sets the object's metatable to be equal to the table made earlier.
    return setmetatable(thisObj, self)
end

-- This is the class's draw function.  The "this" keyword comes from the colon ":".
-- It's like c++, functions separated from the class.
function Cactus:draw()
    love.graphics.draw(cactusImg, self.position.x, self.position.y)
end

function Cactus:update(dt)
    -- Moves the block of ground until it is out of the screen.
    self.position.x = self.position.x - (groundMoveSpeed * dt)

    -- Checks if the ground piece needs to be moved.
    if self.position.x < -256 then
        destroyCactus()
    end
end

return Cactus
