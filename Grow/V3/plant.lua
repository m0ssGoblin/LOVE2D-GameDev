plant = {}

groundH = 10
growthLog = 0
--nodeLog = 0

function plant:load()
    self.growthRate = 2
    self.wideningInterval = 10

    self.width = 3
    self.height = 0

    self.x = love.graphics.getWidth() / 2 - self.width
    self.y = love.graphics.getHeight() - groundH - self.height

    
    self.internode = 10
    self.terminalGrowth = 100

    self.leafStemL = 6
    self.leafStemW = 2

    self.leafL = 20
    self.leafW = 10

    self.nodePositions = {}
    self.nodePositions["a"] = 5
    self.numberOfLeaves = 1
end

function plant:update(dt)
    plant:growStem(dt)
    plant:addLeaves()
end

function plant:draw()
    plant:drawStem()
    plant:drawLeaves(self.numberOfLeaves[a])
end

function plant:drawStem()
    love.graphics.rectangle( "fill", self.x, self.y, self.width, self.height)
end


function plant:growStem(dt)
    if self.height < self.terminalGrowth then 
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


-- under construction

function plant:addLeaves()
    if self.y > self.nodePositions.a then
        self.numberOfLeaves = self.numberOfLeaves + 1
    end
end

function plant:drawLeaves(y)
    love.graphics.rectangle("fill", self.x, y + (self.leafW / 2), self.leafStemL , self.leafStemW)    
    love.graphics.rectangle("fill", self.x+self.leafStemL, y, self.leafL, self.leafW)
end






