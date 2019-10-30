Firework = Object:extend()

function Firework:new(x, y, direction, size, width, height)
    self.image = love.graphics.newImage("assets/image/shoot.png")    
    self.x = x - 100
    self.y = y
    self.direction = direction
    self.velX = 5
    self.width = 57
    self.height = 9
    self.quad = love.graphics.newQuad(0, 0, self.width, self.height, self.image:getDimensions())
    self.currentImg = 0
    self.size = size
    self.movementDt = 0
    self.movementY = 0.5
end

function Firework:update(dt)
    self.movementDt = self.movementDt + dt

    if self.movementDt > 1 then
        self.movementDt = 0
        self.movementY = - self.movementY
    end

    self.y = self.y + self.movementY
    self.x = self.x + (self.direction*self.velX)
    self:animate(dt)
end

function Firework:animate(dt)
    local x, y, w, h = self.quad:getViewport()
    self.currentImg = self.currentImg + dt*4
    if self.currentImg >= 6 then
        self.currentImg = 0
    end
    self.quad:setViewport(w*math.floor(self.currentImg), y, w, h)
end

function Firework:draw()
    love.graphics.draw(self.image, self.quad, self.x, self.y, 0, -self.direction*self.size, self.size)
end