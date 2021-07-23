
-- Initialize the startup time variables

require("plant")
require("sun")
require("time")


WINDOW_W = 800
WINDOW_H = 480

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



    -- love.graphics.print("Plant Width: " .. plant.width, 10, 40), 
    -- love.graphics.print("deltaT: " .. deltaT, 10, 50), 
    -- love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 60), 
    -- love.graphics.print("Sun Radius: " ..  math.floor(sun.radius), 10, 100), 


function diagnostics()
    
    diagnosticLines = { 
        "Window: " ..WINDOW_W .. " x " .. WINDOW_H,
        "Time Elapsed: ".. time.elapsed, 
        "Plant Height: " .. math.floor(plant.height), 
        "Time of Day: " .. 6 + (time.elapsed/WINDOW_W)*12,
        "Days: " .. daysElapsed, 
        "#Leaves: ".. plant.numberOfLeaves,
        "Blooming? " .. plant.blooming, 


        --"NextNode: " .. plant.nextNode, 
        }

    love.graphics.setFont(love.graphics.newFont(9))
    for i = 1,table.getn(diagnosticLines) do
        love.graphics.print(diagnosticLines[i], 10, i * 10)
    end
end



function love.keypressed(key)
    -- keys can be accessed by string name
    if key == 'escape' then
        -- function LÖVE gives us to terminate application
        love.event.quit()
    end
end