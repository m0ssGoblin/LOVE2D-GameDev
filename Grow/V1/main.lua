
-- Initialize the startup time variables

startTime = 0
loggedTime = 0

screenW = 0
screenH = 0

groundH = 10

stemW = 5
stemH = 0

derivedScreenH = 0
derivedScreenW = 0

plantHeight = 8

growthinterval = 1


--Core Functions

function love.load()
    startTime = os.time()
    screenW = love.graphics.getWidth()
    screenH = love.graphics.getHeight()
end

function love.update(dt)
    grow()
end
    

function love.draw()
    drawGround()
    drawPlant(plantHeight)
    diagnostics()
end

--Game Functions


function drawGround()
    love.graphics.rectangle("fill", 0, screenH - groundH, screenW, groundH)
end

function drawPlant(y)
    love.graphics.rectangle( "fill", screenW / 2 - stemW, screenH - groundH - stemH - y, stemW, stemH + y)
    node = {10,20}
    if plantHeight > node[1] then
        addLeaf("right", node[2])
    elseif plantHeight >node[2] then
        addLeaf("right", node[2])
    end    
end


function grow()
    if os.time() > loggedTime + growthinterval then
        loggedTime = os.time()
        plantHeight = plantHeight +1
    end
end

function addLeaf(side, y)
    leafStemL = 8
    leafStemW = 2

    leafW = 4
    leafL = 8

    if side == "right" then 
        love.graphics.rectangle("fill", screenW / 2 + stemW / 2 - 2,             screenH - groundH - y,                 leafStemL, leafStemW)
        love.graphics.rectangle("fill", screenW / 2 + stemW / 2 + leafStemL - 1, screenH - groundH - y - leafW / 2 + 1, leafL,     leafW)
    else love.graphics.rectangle("fill", screenW / 2 - stemW / 2 - leafStemL - 2,    screenH - groundH - y,                 leafStemL, leafStemW)
        love.graphics.rectangle("fill", screenW / 2 - stemW / 2 - leafStemL - leafL -2, screenH - groundH - y - leafW / 2 -1, leafL, leafW )
    end
end





--Other Functions


function diagnostics()
    love.graphics.print("Time Elapsed: " .. os.time() - startTime , 10, 10)
    love.graphics.print(screenW .. " x " .. screenH, 10, 20)
    love.graphics.print("Plant Hiehgt: " .. plantHeight, 10, 30)
end