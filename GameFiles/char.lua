local Char = {}

-- Private variables.
local jumpHeight = 100

-- The position of the character's bottom right corner.
Char.position = {x = 100, y = floorPosition}

Char.yImpulse = 0  -- The amount of upwards propulsion (affected by "air resistance.")

-- Is the character allowed to jump?
local isTouchingGround = true
local function checkJumpStart()
    if love.keyboard.isDown("space") and isTouchingGround == true then
        -- Assign flags.
        isTouchingGround = false

        -- Assign impulse.
        Char.yImpulse = 1000
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
    else
        -- This is run if the character is in the air.
        Char.position.y = Char.position.y - (Char.yImpulse * dt);  -- Move up, then down.

        -- Update impulse when player is in the air.  (isTouchingGround == false)
        Char.yImpulse = Char.yImpulse - (2500 * dt)

        -- If the char is below the floor, the char is set to floor height then is done jumping and can jump again
        if Char.position.y >= floorPosition then
            Char.position.y = floorPosition
            Char.yImpulse = 0
            isTouchingGround = true
        end
    end
end

return Char
