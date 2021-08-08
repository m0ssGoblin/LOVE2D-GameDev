Sprout = Class{}

function Sprout:init()
self.x = WINDOW_W/2
self.y = WINDOW_H
self.width = 1
self.height = 5
end

function Sprout:update(dt)

    self.height = playerTime

    --overly simplistic growth function
    -- if self.height > 10 then
    --     self.width = math.pow(self.height, 0.3)
    -- end
end

function Sprout:render()
    love.graphics.rectangle("fill", self.x, self.y - self.height, self.width, self.height)
end