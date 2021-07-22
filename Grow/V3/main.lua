
-- Initialize the startup time variables

require("plant")
require("sun")
require("time")


WINDOW_W = 400
WINDOW_H = 240

groundH = WINDOW_H * .2


--Core Functions

function love.load()
    time:load()
    plant:load()
    sun:load()
    love.window.setMode(WINDOW_W, WINDOW_H)
end

function love.update(dt)
    time:update()
    plant:update(dt)
    sun:update(dt)
    deltaT = dt
    sun:Colorizer()
end
    

function love.draw()
    sun:draw()
    plant:draw()
    diagnostics()
    drawGround()

end

--Game Functions


function drawGround()
    love.graphics.rectangle("fill", 0, WINDOW_H - groundH, WINDOW_W, groundH)
end





--Other Functions

--currentNode = plant.nodepositions[1]

function diagnostics()
    love.graphics.setFont(love.graphics.newFont(9))
    love.graphics.print("Time Elapsed: " .. time.elapsed , 10, 10)
    love.graphics.print(WINDOW_W .. " x " .. WINDOW_H, 10, 20)
    love.graphics.print("Plant Height: " .. math.floor(plant.height), 10, 30)
    love.graphics.print("Plant Width: " .. plant.width, 10, 40)
    --love.graphics.print("Node Positions: " .. currentNode, 10, 50)
    love.graphics.print("deltaT: " .. deltaT, 10, 50)
    love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 60)

    love.graphics.print("Sun Radius: " ..  math.floor(sun.radius), 10, 100)
    love.graphics.print("Time of Day: " .. 6 + (time.elapsed/WINDOW_W)*12, 10, 110)
    love.graphics.print("Day Count: " .. daysElapsed, 10, 120)
end



function love.keypressed(key)
    -- keys can be accessed by string name
    if key == 'escape' then
        -- function LÖVE gives us to terminate application
        love.event.quit()
    end
end