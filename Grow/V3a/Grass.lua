grass  = {}


--OBJECTIVE

--draw a blade of grass of height defined by self.height 
--grass will be a line


function grass:load()
    self.x = 10
    self.y = 0
    self.height = 20
    self.width = 0
    self.xPoints = {}
    
    self.heightList = {}
    self.xList = {}

    numberOfBlades = 100

    self.expList = {}

    for i = 1 , self.height do
        table.insert(self.xPoints, i)    
    end

    for i = 1, numberOfBlades do
        table.insert(self.expList, 0.5 + (math.random(1, 400)/1000 ))
    end

end

function grass:update(dt)
        for i = 1, table.getn(self.heightList) do
        if self.heightList[i] < 100 then
        self.heightList[i] = self.heightList[i] + dt * 10
        end
    end

    math.randomseed(os.time())
end


function grass:draw()    

    -- this is a work in progress but is designed to place blades of grass
        --aroudn the screen, at different heights and different trajectories
        
    -- for i=1, numberOfBlades do
    --     self.x = math.random (1, WINDOW_W)
    -- end
    for k = 1, numberOfBlades do
        table.insert(self.heightList, love.math.random(self.height - 10, self.height + 10))
        table.insert(self.xList, love.math.random(0, WINDOW_W))


        for i = 1, self.heightList[k]  do
            x1 = self.xList[k] - 0.1 + i * 0.1
            y1 = WINDOW_H - groundH - (20 * math.pow(i * 0.1 -1, self.expList[k]))
            x2 = self.xList[k] + i * 0.1
            y2 = WINDOW_H - groundH - (20 * math.pow(i * 0.1, self.expList[k]))

            love.graphics.line(x1, y1, x2, y2)
            
        end
    end
end