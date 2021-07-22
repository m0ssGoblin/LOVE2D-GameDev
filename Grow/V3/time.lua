time = {}



function time:load()
    self.start = os.time()
    self.elapsed = .0001
    self.secondsPerDay = WINDOW_W * 2
end

function time:update()
    self.elapsed = os.time() - self.start
end