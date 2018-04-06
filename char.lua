local Char = {}

-- important positions.
jumpHeight = 200
floorPosition = 300

-- The position of the character's bottom right corner.
Char.position = {x = 50, y = 300}

-- Is the character allowed to jump?
local isTouchingGround = true
local jumpIsActive = false
local function checkJumpStart()
    if love.keyboard.isDown("space") and jumpIsActive == false then
        jumpIsActive = true
        isTouchingGround = false
    end
end

function Char.draw()
    -- This character is drawn at its bottom right corner instead of the love2d top left.
    love.graphics.draw(dinosaur, Char.position.x - dinosaur:getWidth(), Char.position.y - dinosaur:getHeight())
end

function Char.update(dt)
    if isTouchingGround then
        -- Check if the player is trying to jump.
        checkJumpStart()
    end

    if jumpIsActive == false then
        -- This is run if the character is in the proccess of moving down.
        if Char.position.y < floorPosition then
            Char.position.y = Char.position.y + (200 * dt);  -- Move down.
        elseif Char.position.y ~= floorPosition then
            Char.position.y = floorPosition
            isTouchingGround = true
        end
    else
        -- This is run if the character is in the proccess of moving up.
        Char.position.y = Char.position.y - (200 * dt);  -- Move up.
        if Char.position.y >= floorPosition - jumpHeight then
            jumpIsActive = false
        end
    end
end

return Char
