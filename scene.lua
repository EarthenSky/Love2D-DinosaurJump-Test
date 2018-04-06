local Scene = {}

floorPosition = 300

Scene.position = {x = 0, y = floorPosition - 25}

function Scene.draw()
    love.graphics.draw(ground, Scene.position.x, Scene.position.y)
end

return Scene
