sun = {}



function sun:load()
    self.x = 0
    self.y = 0
    self.radius = 5
    timeElapsed = 0
    dayBegins = os.time()
    screenW = love.graphics.getWidth()
    screenH = love.graphics.getHeight()
end

function sun:update()
    timeELapsed = os.time() - dayBegins
    self.radius = 10 + 100 * math.sin(timeELapsed/screenW/math.pi)
    self.x = timeELapsed
    self.y = love.graphics.getHeight() - (screenH * math.sin(self.x/(screenW/math.pi))+ 10)

    if timeElapsed == screenW * 2 then
        dayBegins = os.time()
    end

end


function sun:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.radius, self.radius)
    love.graphics.print("Sun Radius: " .. self.radius, 10, 60)
    love.graphics.print("Time of Day: " .. 6 + (timeELapsed/screenW)*12, 10, 60)
end
