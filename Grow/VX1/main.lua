Class = require 'class'

require 'Sprout'

WINDOW_W = 960
WINDOW_H = 480

groundH = WINDOW_H * 0.15

stateSelection = true


function love.load()
    startTime = os.time()
    currentTime = startTime
    playerTime = 0
    
    sprout = Sprout()

    state = "Real Time"

    timeScrub = 0

    MenuState = false

    
    if not love.filesystem.getInfo("timelog.lua")then --if no time log file is found
        timeElapsed = 0 --set the timElapsed to 0
        love.filesystem.newFile("timelog.lua")  --create a new time log file 
        loggedTime = 0
    else --If the timeLog file is found then use the value stored in it to set loggedTime equal to that time so we can use it later.
        loggedTime = love.filesystem.read("timeLog.lua")
    end
end

function love.update(dt)

    sprout:update(dt)
    currentTime = os.time()

    StateMachine()

    stateSelector()

end

function love.draw()
--     for k, sprout in pairs(sprouts) do
--         sprout:render()
--     end
if not MenuState then
    sprout:render()
end
    --Diagnostics 
    diagFont = love.graphics.newFont(10)
    love.graphics.setFont(diagFont)
    love.graphics.print("start: "..startTime)
    love.graphics.print("current: "..currentTime,0,10)
    love.graphics.print("playerTime: "..playerTime,0,20)
    love.graphics.print("TimeElapse: "..timeElapsed, 0, 30)
    love.graphics.print("State: "..state, 0, 40)

    if state == "Menu" then
        menuFont = love.graphics.newFont(20)
        love.graphics.setFont(menuFont)
        love.graphics.printf( "Press 'esc' to return to game \nPress 'n' for new game \nPress 'q' to quit",0,WINDOW_H/2,WINDOW_W,"center")
    end
end



function love.keypressed(key)
    -- keys can be accessed by string name
    if key == 'escape' then
        love.filesystem.write("timelog.lua", timeElapsed)
        MenuState = not MenuState
    end

    if key == 'space' then
        stateSelection = not stateSelection
    end

    if state == "Menu" then
        if key =="q" then
            love.event.quit()
        end
        if key =="n" then
            newFile = true           
        end
        if key == "escape" then
            state = "Real Time"
        end
    end

end


function Scrubber(key)
    if love.keyboard.isDown("up") then
        if playerTime < timeElapsed then
            upKey = true
            timeScrub = timeScrub + 1
            upKey = false
        end
        
    end
    if love.keyboard.isDown("down") then
        downKey = true
        timeScrub = timeScrub - 1
        downKey = false
    end
end


function stateSelector()     
    if stateSelection then
        state = "Real Time"
        playerTime = timeElapsed
    end
    if not stateSelection then
        state = "Scrub Time"
        playerTime = playerTime
    end
    if MenuState == true then
        state = 'Menu'
    end
    if newFile then
        love.filesystem.write("timelog.lua", 0) 
        love.event.quit('restart')
    end
end

function StateMachine()
    
    if state == "Real Time" then
        timeElapsed = loggedTime + currentTime - startTime
        playerTime = timeElapsed        
    end  

    if state == "Scrub Time" then
        Scrubber(key)
        playerTime = loggedTime + currentTime - startTime + timeScrub
    end
end
