-- Constant variables
screenSize = {x=720, y=320}
groundMoveSpeed = 280
floorPosition = 300

-- This function is called when the game starts
function love.load()
    -- initialize other modules.
    char = require("char")
    scene = require("scene")
    ui = require("ui")
    spawner = require("spawner")  -- cactus spawner

    -- Set up the window.
    love.window.setMode(screenSize.x, screenSize.y, {resizable=false, vsync=false})
    love.window.setTitle("Dinosaur Cactus Jump!")
    love.graphics.setBackgroundColor(255, 255, 255, 255)

    -- Load images.
    dinosaur = love.graphics.newImage("Assets/charSmall.png")
    ground = love.graphics.newImage("Assets/Ground.png")
    cactusImg = love.graphics.newImage("Assets/Cactus.png")
end

-- This draws things to the screen.
function love.draw()
    -- Set mod colour to white when drawing pictures.
    love.graphics.setColor(255, 255, 255, 255)
    scene.draw() -- Bottom.
    char.draw()  -- Top.
    ui.draw()  -- Draw UI elements, like points.
    spawner.draw()  -- Draw the cacti.
end

-- This is the function that repeats constantly.
function love.update(dt)
    scene.update(dt)  -- Move the tiles.
    char.update(dt)
    ui.update(dt)
    spawner.update(dt)  -- Move the cacti.
end
