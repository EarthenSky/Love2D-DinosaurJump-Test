-- This function is called when the game starts
function love.load()
    -- initialize other modules.
    char = require("char")
    scene = require("scene")

    -- Set up the window.
    love.window.setMode(400, 400, {resizable=false, vsync=true})
    love.graphics.setBackgroundColor(255, 255, 255, 255)

    -- Load images.
    dinosaur = love.graphics.newImage("Assets/char.png")
    ground = love.graphics.newImage("Assets/Ground.png")

    --Init variables.
    scoreCurrent = 0
    scoreHigh = 0
end

-- This draws hello world to the screen.
function love.draw()
    -- Set mod colour to white when drawing pictures.
    love.graphics.setColor(255, 255, 255, 255)
    scene.draw() -- Bottom.
    char.draw()  -- Top.

    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.print("HI " .. scoreHigh .. " " .. scoreCurrent, 300, 10)
end

-- This is the function that repeats constantly.
function love.update(dt)
    char.update(dt)
end
