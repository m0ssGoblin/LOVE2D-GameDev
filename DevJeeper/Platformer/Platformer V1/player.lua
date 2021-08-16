Player = {}

function Player:load()
    self.x = 100
    self.y = 0
    self.width = 20
    self.height = 60

    self.xVel = 0
    self.yVel = 0
    self.maxSpeed = 200
    self.acceleration = 4000
    self.friction = 3500
    self.gravity = 1500

    self.physics = {}
    self.physics.body = love.physics.newBody(World, self.x, self.y, "dynamic")
    self.physics.body:setFixedRotation(true)
    self.physics.shape = love.physics.newRectangleShape(self.width, self.height)
    self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)

    self.graceTime = 0
    self.graceDuration = 0.1

    self.grounded = false
    self.jumpAmmount = -500
    self.hasDoubleJumped = false
end

function Player:update(dt)
    self:syncPhysics()
    self:move(dt)
    self:applyGravity(dt)
    self:decreaseGraceTime(dt)
end

function Player:decreaseGraceTime (dt)
  if not self.grounded then
    self.graceTime = self.graceTime - dt
  end
end

function Player:applyGravity(dt)
  if not self.grounded then
    self.yVel = self.yVel + self.gravity * dt
  end
end

function Player:move(dt)
    if love.keyboard.isDown("d", "right") then
        if self.xVel < self.maxSpeed then
            if self.xVel + self.acceleration * dt < self.maxSpeed then
                self.xVel = self.xVel + self.acceleration * dt
            else
                self = self.maxSpeed
            end
        end
    elseif love.keyboard.isDown("a", "left") then
        if self.xVel > -self.maxSpeed then
            if self.xVel - self.acceleration * dt > -self.maxSpeed then
                self.xVel = self.xVel - self.acceleration * dt
            else
                self = -self.maxSpeed
            end
        end
    else
        self:applyFriction(dt)
    end
end

function Player:applyFriction(dt)
    if self.xVel > 0 then
        if self.xVel - self.friction * dt > 0 then
            self.xVel = self.xVel - self.friction * dt
        else
            self.xVel = 0
        end
    elseif self.xVel < 0 then
        if self.xVel + self.friction * dt < 0 then
            self.xVel = self.xVel + self.friction * dt
        else
            self.xVel = 0
        end
    end
end

function Player:syncPhysics()
    self.x, self.y = self.physics.body:getPosition()
   self.physics.body:setLinearVelocity(self.xVel, self.yVel)
end


function Player:draw()
    love.graphics.rectangle("fill", self.x - self.width/2, self.y - self.height/2, self.width, self.height)
end

function Player:beginContact(a, b, collision)
  if self.grounded == true then return end
  local nx, ny = collision:getNormal()
    if a == self.physics.fixture  then
      if ny > 0 then
        self:land()
      end
    elseif b == self.physics.fixture then
      if ny < 0 then
        self:land(collision)
      end
    end
end

function Player:land(collision)
  self.currentGroundCollision = collision
  self.yVel = 0
  self.grounded = true
  self.hasDoubleJumped = false
  self.graceTime = self.graceDuration
end

function Player:jump (key)
  if self.hasDoubleJumped == false and (key == "w" or key == "up") then
    self.yVel = self.jumpAmmount
    self.hasDoubleJumped = true
  elseif (key == "w" or key == "up") then
      if self.grounded or self.graceTime > 0 then
        self.yVel = self.jumpAmmount
        self.graceTime = 0
      end
  end
end

function Player:endContact(a, b, collision)
  if a == self.physics.fixture or b == self.physics.fixture then
    if self.currentGroundCollision == collision then
      self.grounded = false
    end
  end
end
