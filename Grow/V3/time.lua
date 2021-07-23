time = {}



function time:load()
    self.start = os.time()
    self.elapsed = .0001
    self.secondsPerDay = WINDOW_W * 2
    self.day = 0
end

function time:update()
    self.elapsed = os.time() - self.start
    
    if sun.y < WINDOW_H - groundH then
        self.day = 1
    else
        self.day = 0
    end
end