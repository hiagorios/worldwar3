Enemie = Object:extend()

function Enemie:new(x, y, imgPath, shootPosition)
    self.x = x
    self.y = y
    self.size = self.y*0.004
    self.direction = -1
    self.acelY = 0
    self.acelX = 0
    self.acelHoriz = 150
    self.acelVert = 150
    self.shootPosition = shootPosition
    
    self.image = love.graphics.newImage(imgPath.. "/player2.png")
    self.currentImg = 0
    self.width = 150
    self.height = 150
    self.quad = love.graphics.newQuad(0, 0, self.width, self.height, self.image:getDimensions())
    self.state = 'entering'
end

function Enemie:update(dt)
    if self.state == 'entering' then
        self.size = self.y*0.004
        self:animate(dt)
        self.x = self.x + self.direction*self.acelHoriz*dt
        if self.direction == 1 and self.x >= self.shootPosition then
            self.state = 'shooting'
        elseif self.direction == -1 and self.x <= self.shootPosition then
            self.state = 'shooting'
        end
    elseif self.state == 'shooting' then
        --self:shoot()
        self.state = 'gettingAway'
        if self.direction == 1 then
            self:rotateLeft()
        else
            self:rotateRight()
        end
    elseif self.state == 'gettingAway' then 
        self.size = self.y*0.004
        self:animate(dt)
        self.x = self.x + self.direction*self.acelHoriz*dt
    end
end

function Enemie:draw()
    love.graphics.draw(self.image,  self.quad, self.x, self.y, 0, self.direction*self.size, self.size)    
    love.graphics.rectangle( "line", self.x, self.y, self.width*self.direction, self.height )
    love.graphics.print(self.state, self.x, self.y)
end

function Enemie:stop()
    local x, y, w, h = self.quad:getViewport()
    self.quad:setViewport(w*7, y, w, h)
end

function Enemie:animate(dt)
    local x, y, w, h = self.quad:getViewport()
    self.currentImg = self.currentImg + dt*8
    if self.currentImg >= 7 then
        self.currentImg = 0
    end
    self.quad:setViewport(w*math.floor(self.currentImg), y, w, h)
end

function Enemie:rotateLeft()
    self.direction = -1
    self.x = self.x + self.width*self.size
end

function Enemie:rotateRight()
    self.direction = 1
    self.x = self.x - self.width*self.size
end

function Enemie:mustBeRemoved()
    if self.state ~= 'gettingAway' then
        return false
    end
    if self.direction == 1 and self.x > love.graphics.getWidth() then
        return true
    elseif self.direction == -1 and self.x + self.width*self.size < 0 then
        return true
    end
    return false
end