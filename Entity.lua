Entity = Object:extend()

function Entity:new(x, y, imgs, acelHoriz, acelVert)
    self.x = x
    self.y = y
    self.direction = 1
    self.velX = 0
    self.velY = 0
    self.acelY = 0
    self.acelX = 0
    self.acelHoriz = acelHoriz
    self.acelVert = acelVert
    
    self.imgs = imgs
    self.currentImg = 1
    self.width= self.imgs[1]:getWidth()
    self.height= self.imgs[1]:getHeight()
end

function Entity:update(dt)

end

function Entity:draw()

end

function Entity:moveUp(dt)
    self.acelY = -self.acelVert
    self.y = self.y + self.acelY*dt
end

function Entity:moveDown(dt)
    self.acelY = self.acelVert
    self.y = self.y + self.acelY*dt
end

function Entity:moveLeft(dt)
    self.acelX = -self.acelHoriz
    self.x = self.x + self.acelX*dt
end

function Entity:moveRight(dt)
    self.acelX = self.acelHoriz
    self.x = self.x + self.acelX*dt
end

function Entity:rotateLeft()
    if self.direction == 1 then
        self.direction = -1
        self.x = self.x + self.width
    end
end

function Entity:rotateRight()
    if self.direction == -1 then
        self.direction = 1
        self.x = self.x - self.width
    end
end