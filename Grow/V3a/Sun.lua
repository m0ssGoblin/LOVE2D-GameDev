sun = {}

dayBegins = os.time()
dayCount = 0



function sun:load()
    self.x = 0
    self.y = 0
    self.radius = 5
    self.speed = 100
    -- not currently functional 
    self.minSize = 7
    self.maxSize = 5
    ---------------------------

    self.objectColor = .2
    self.skyColor = .7

    daysElapsed = 0
end



function sun:update(dt)
    --sun:time()
    sun:move(dt)
    sun:Colorizer()
end

function sun:draw()
    love.graphics.print("Sun Position: "..math.floor(self.x) ..", ".. math.floor(self.y), WINDOW_W -120, 10)
    love.graphics.circle("line", self.x, self.y, self.radius)
    
end


-- function sun:time()
--     timeElapsed = os.time() - startTime,
-- end

function sun:move(dt)
    

    self.x = self.x + dt * self.speed
    --y = windowH - (windowW - groundH) * sin(x/windowW) + groundH
    self.y = WINDOW_H - ((WINDOW_H-groundH) * math.sin(self.x/(WINDOW_W/math.pi)) + groundH)

--    size of the sun is proportional to how much time has elapsed 
    self.radius = self.maxSize * math.sin(self.x/(WINDOW_W/math.pi)) + sun.minSize

if self.x > WINDOW_W *2 then
    daysElapsed = daysElapsed + 1
self.x = 0        
end

end



function sun:Colorizer()

    if self.y < WINDOW_H - groundH then
        -- day colors
        self.skyColor = .8
        self.objectColor = .3
    else
    self.skyColor = .4
    self.objectColor = 0
    end  

    love.graphics.setColor(self.objectColor, self.objectColor, self.objectColor)
    love.graphics.setBackgroundColor(self.skyColor,self.skyColor,self.skyColor) 
end
