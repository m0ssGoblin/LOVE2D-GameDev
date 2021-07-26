grass  = {}


--OBJECTIVE

--draw a blade of grass of height defined by self.height 
--grass will be a line


function grass:load()
    self.x = 10
    self.y = 0
    self.height = 10
    self.width = 0
    self.xPoints = {}

    numberOfBlades = 10

    for i = 1 , self.height do
        table.insert(self.xPoints, i)    
    end
end

function grass:update()

end


function grass:draw()    

    -- this is a work in progress but is designed to place blades of grass
        --aroudn the screen, at different heights and different trajectories
        
    -- for i=1, numberOfBlades do
    --     self.x = math.random (1, WINDOW_W)
    -- end


    for i = 1, self.height  do
        x1 = self.x - 1 + i
        y1 = WINDOW_H - groundH - 20 * math.pow(i-1, 1/2)
        x2 = self.x + i
        y2 = WINDOW_H - groundH - 20 * math.pow(i, 1/2)

        love.graphics.line(x1, y1, x2, y2)
        
    end


    
    for i = 1, self.height do
    love.graphics.print(self.xPoints[i], 150, 10*i)
    end
end