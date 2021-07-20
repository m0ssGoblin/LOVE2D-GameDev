
-- Initialize the startup time variables

require("plant")

startTime = 0
loggedTime = 0

screenW = 0
screenH = 0

groundH = 10

stemW = 5
stemH = 0

derivedScreenH = 0
derivedScreenW = 0


--Core Functions

function love.load()
    startTime = os.time()
    screenW = love.graphics.getWidth()
    screenH = love.graphics.getHeight()

    plant:load()
end

function love.update(dt)
    plant:update()
end
    

function love.draw()
    diagnostics()
    drawGround()

    plant:draw()
end

--Game Functions


function drawGround()
    love.graphics.rectangle("fill", 0, screenH - groundH, screenW, groundH)
end




--Other Functions

currentNode = plant.nodepositions[0]

function diagnostics()
    love.graphics.print("Time Elapsed: " .. os.time() - startTime , 10, 10)
    love.graphics.print(screenW .. " x " .. screenH, 10, 20)
    love.graphics.print("Plant Height: " .. plant.height, 10, 30)
    love.graphics.print("Plant Width: " .. plant.width, 10, 40)
    love.graphics.print("Node Positions: " .. currentNode, 10, 50)
end