for i = 10,1,-1 
do 
   print(i) 
end

startTime = 0
timeElapsed = 0


function love.load()
   startTime = os.time()
   
end

function love.update(dt)
   timeElapsed = os.time() - startTime
end

function love.draw()
   tunnel(timeElapsed)
end



function tunnel(num)
   love.graphics.rectangle("line", num / 2, num / 2, love.graphics.getWidth() - num,  love.graphics.getHeight() - num)
end