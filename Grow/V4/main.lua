
-- Initialize the startup time variables

Class = require 'class'

-- require("plant")
-- require("sun")
require 'time'
-- require("grass")
require 'Sprout'


WINDOW_W = 800
WINDOW_H = 480

groundH = WINDOW_H * 0.15

local spawnTimer = 0

local sprouts = {}

local sproutXs = {}
local sproutGrowthRates = {}
local sproutMaxHs = {}


--Core Functions

function love.load()
    math.randomseed(os.time())

    time:init()
    -- plant:load()
    -- grass:load()
    -- sun:load()
    love.window.setMode(WINDOW_W, WINDOW_H)

    grass = Sprout(math.random(100, 700), 8, math.random(100,300))
    spawnCt = 0
end

function love.update(dt)
    
    
    spawnTimer = spawnTimer + dt

    if spawnTimer > 0.2 then

        spawnCt = spawnCt + 1
        table.insert(sproutXs, math.random(50, 750))
        table.insert(sproutGrowthRates, math.random(200, 500))
        table.insert(sproutMaxHs, math.random(100, 300))
        table.insert(sprouts, Sprout(sproutXs[spawnCt], sproutGrowthRates[spawnCt], sproutMaxHs[spawnCt]))
        print('Added new sprout!')
        spawnTimer = 0
    end

    for k, sprout in pairs(sprouts) do
        sprout:update(dt)

        -- if pipe is no longer visible past left edge, remove it from scene
        if sprout.age > sprout.maxAge and sprout.height < 1 then
            table.remove(sprouts, k)
        end
    end

    grass:update(dt)
    time:update(dt)
    -- plant:update(dt)
    -- sun:update(dt)
    -- deltaT = dt
    -- grass:update(dt)
end
    

function love.draw()

    grass:render()

    for k, sprout in pairs(sprouts) do
        sprout:render()
    end
    -- sun:draw()
    -- plant:draw()
    -- grass:draw()
    -- diagnostics()
    drawGround()
    -- experiment:draw()

end

--Game Functions


function drawGround()
    love.graphics.rectangle("fill", 0, WINDOW_H - groundH, WINDOW_W, groundH)
end





--Other Functions


-- function diagnostics()
    
--     diagnosticLines = { 
--         "Window: " ..WINDOW_W .. " x " .. WINDOW_H,
--         "Time Elapsed: ".. time.elapsed, 
--         "Plant Height: " .. math.floor(plant.height), 
--         "Time of Day: " .. 6 + (time.elapsed/WINDOW_W)*12,
--         "Days: " .. daysElapsed, 
--         "#Leaves: ".. plant.numberOfLeaves,
--         "Blooming? " .. plant.blooming, 


--         --"NextNode: " .. plant.nextNode, 
--         }

--     love.graphics.setFont(love.graphics.newFont(9))
--     for i = 1,table.getn(diagnosticLines) do
--         love.graphics.print(diagnosticLines[i], 10, i * 10)
--     end
-- end



function love.keypressed(key)
    -- keys can be accessed by string name
    if key == 'escape' then
        -- function LÖVE gives us to terminate application
        love.event.quit()
    end
end