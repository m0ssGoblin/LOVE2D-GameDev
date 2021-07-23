STI = require("sti")

function love.load()
    Map = STI("assets/Map1.lua")
end

function love.update (dt)    
end



function love.draw()
    Map:draw(0,0,2,2)
end