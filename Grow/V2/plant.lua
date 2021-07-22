plant = {}

growthRate = 1

groundH = 10

growthLog = 0
wideningInterval = 10
nodeLog = 0


function plant:load()
    self.x = love.graphics.getWidth() / 2 - stemW
    self.y = love.graphics.getHeight() - groundH - stemH
    self.height = 0
    self.width = 3
    self.nodepositions ={10, "bean",.5}
    self.internode = 10
    self.terminalGrowth = 300

end

function plant:update()
    plant:growStem()
end

function plant:draw()
    plant:drawStem()
end


function drawPlant()
    plant:drawStem()
end


function plant:drawStem()
    love.graphics.rectangle( "fill", self.x, self.y, self.width, self.height)
end


function plant:growStem()
    if self.height < self.terminalGrowth then 
        if self.height > growthLog + wideningInterval then
            self.width = self.width + 1
            growthLog = self.height
            wideningInterval = wideningInterval + 5        
        end

        if os.time() > loggedTime + growthRate then
            loggedTime = os.time()
            self.height = self.height +1
            self.x = love.graphics.getWidth() / 2 - self.width
            self.y = love.graphics.getHeight() - groundH - self.height
        end
    end
end


-- under construction

function plant:addLeaves()
    if self.height > nodeLog + self.internode then
        nodeLog = self.height
        table.insert(nodepositions, self.height)
    end
end
function plant:drawLeaf()

        side = math.random(2)

        -- draw leaf on right side 
        love.graphics.rectangle("fill", self.x + self.width / 2, self.height)

end




