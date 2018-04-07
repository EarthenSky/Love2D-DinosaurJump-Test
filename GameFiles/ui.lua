local UI = {}

--Init variables.
scoreCurrent = 0
scoreHigh = 0

function UI.draw()
    -- Set colour to black before drawing text.
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.print("HI " .. scoreHigh .. " : " .. scoreCurrent, screenSize.x - 100, 10)
end

-- When the timer counter is over 100 (ms), it goes down by 100 and does something.
-- In this case it makes scoreCurrent go up by 1.
local timeCounter = 0
function UI.update(dt)
    timeCounter = timeCounter + (dt * 1000)

    -- If 100 ms have occured.
    if timeCounter > 100 then
        timeCounter = timeCounter - 100

        -- inc scoreCurrent by 1 every 100 ms.
        scoreCurrent = scoreCurrent + 1
    end
end

-- This is called when the player dies.
function UI.resetScore()
    -- Highscore is updated if needed.
    if scoreCurrent > scoreHigh then
        scoreHigh = scoreCurrent
    end

    -- scoreCurrent is reset to zero.
    scoreCurrent = 0
end

return UI
