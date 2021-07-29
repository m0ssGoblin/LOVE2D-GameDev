Sprout = Class{}

numberOfSprouts = 0

function Sprout:init(x, growthRate, maxH)
    self.x = x
    self.y = WINDOW_H - groundH
    self.width = 1
    self.height = 0
    self.growthRate = growthRate
    self.maxH = maxH
    self.birthTime = os.time()
    self.maxAge = 20
    self.age = 0
    numberOfSprouts = numberOfSprouts + 1
end

function Sprout:update(dt)
    self.age = os.time() - self.birthTime 

    if self.age < self.maxAge then
        if self.height < self.maxH then
            self.height = self.height + dt * self.growthRate
        end
    else
        self.height = self.height - dt * 10 * self.growthRate
    end
        
    self.y = WINDOW_H - groundH - self.height
end


function Sprout:render()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.print(self.age, self.x - 10, self.y - 15)
end
