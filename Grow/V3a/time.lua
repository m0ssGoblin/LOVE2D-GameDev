time = Class{}



function time:init()
    self.start = os.time()
    self.elapsed = 0
    self.day = 0
end

function time:update(dt)
    self.elapsed = os.time() - self.start
    
    -- if sun.y < WINDOW_H - groundH then
    --     self.day = 1
    -- else
    --     self.day = 0
    -- end
end