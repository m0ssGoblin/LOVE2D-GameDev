Selector = Class{}

function Selector:init()
    alert = "empty message"
end

function Selector:update(dt)
end

function Selector:render()
    love.graphics.print(alert, WINDOW_W/2, WINDOW_H/2)    
end

function love.keypressed(key)
    if key == "space" then
        alert = "the space key has been hit"
    end
end

