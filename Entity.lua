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
    love.graphics.draw(self.imgs[self.currentImg], self.x, self.y)
end

function Entity:moveUp()
    self.acelY = -self.acelVert
end

function Entity:moveDown()
    self.acelY = self.acelVert
end

function Entity:moveLeft()
    self.acelX = -self.acelHoriz
end

function Entity:moveRight()
    self.acelX = self.acelHoriz
end