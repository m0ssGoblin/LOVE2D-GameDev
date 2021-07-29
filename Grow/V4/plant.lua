plant = {}

groundH = 10
growthLog = 0
--nodeLog = 0

function plant:load()
    self.growthRate = 5
    self.wideningInterval = 10

    self.width = 3
    self.height = 0

    self.x = love.graphics.getWidth() / 2 - self.width
    self.y = love.graphics.getHeight() - groundH - self.height

    
    self.internode = 10
    self.terminalGrowth = 150

    self.leafStemL = 8
    self.leafStemW = 3

    self.leafRadY = 10
    self.leafRadX = 5

    self.nodePositions = {15, 30, 45, 60, 75, 90, 105, 120, 135, 200 }
    self.numberOfLeaves = 0

    self.blooming = 0

    self.flowerInnerRadius = 4
    self.flowerOutterRadius = 6
    
    self.bloomSize = 25

    self.bloomPoint = .85

end

function plant:update(dt)
    plant:growStem(dt)
    plant:bloom(dt)
    plant:addLeaves()
end

function plant:draw()
    plant:drawStem()
    plant:drawLeaves()
    plant:drawFlower()
end

function plant:drawStem()
    love.graphics.rectangle( "fill", self.x, self.y, self.width, self.height)
end


function plant:growStem(dt)
    if self.height < self.terminalGrowth then 
        if time.day == 1 then 

            if self.height > growthLog + self.wideningInterval then
                self.width = self.width + 1
                growthLog = self.height
                self.wideningInterval = self.wideningInterval + 5        
            end

            self.height = self.height + dt * self.growthRate
            self.x = love.graphics.getWidth() / 2 - self.width
            self.y = love.graphics.getHeight() - groundH - self.height
        end
    end
end


-- under construction

function plant:addLeaves()
    if self.height > self.nodePositions[self.numberOfLeaves + 1] then
        self.numberOfLeaves = self.numberOfLeaves+1
    end
end

function plant:drawLeaves()
    for i = 1,self.numberOfLeaves do
        if i % 2 == 0 then
            love.graphics.rectangle("fill", self.x + self.width, WINDOW_H - groundH - self.nodePositions[i] - 1, self.leafStemL , self.leafStemW)    
            love.graphics.ellipse("fill", self.leafRadX * 2 + self.x + self.width / 2 + self.leafStemL, WINDOW_H - groundH - self.nodePositions[i], self.leafRadY, self.leafRadX)
            else
            love.graphics.rectangle("fill", self.x - self.leafStemL, WINDOW_H - groundH - self.nodePositions[i] - 1, self.leafStemL , self.leafStemW)        
            love.graphics.ellipse("fill", self.x - self.leafStemL - self.leafRadX * 2 , WINDOW_H - groundH - self.nodePositions[i], self.leafRadY, self.leafRadX)
        end
    end
end

function plant:bloom(dt)
        if time.day == 1 then 
        if self.height > self.terminalGrowth * self.bloomPoint and self.flowerOutterRadius < self.bloomSize then
            self.blooming = 1
            self.flowerInnerRadius = self.flowerInnerRadius + 0.9 * dt
            self.flowerOutterRadius = self.flowerOutterRadius + 1.3 * dt
        end
    end
end


function plant:drawFlower()
    if self.blooming == 1 then        
    love.graphics.circle("line", self.x + self.width / 2, WINDOW_H - groundH - self.height - self.flowerOutterRadius, self.flowerOutterRadius)
    love.graphics.circle("fill", self.x + self.width / 2, WINDOW_H - groundH - self.height - self.flowerOutterRadius, self.flowerInnerRadius)
    end
end