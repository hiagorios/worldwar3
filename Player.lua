Player = Object:extend()

function Player:new(x, y, imgPath, left, right, up, down, shoot)
    self.x = x
    self.y = y
    self.direction = 1
    self.velX = 0
    self.velY = 0
    self.acelY = 0
    self.acelX = 0
    self.acelHoriz = 150
    self.acelVert = 150

    self.gun = Gun()
    self.left = left or 'left'
    self.right = right or 'right'
    self.up = up or 'up'
    self.down = down or 'down'
    self.shoot = shoot or 'return'

    self.imgs = {}
    self.currentImg = 1
    for i = 1, 7 do
        table.insert(self.imgs, love.graphics.newImage(imgPath .. '/' .. i .. ".png"))
    end
    self.width= self.imgs[1]:getWidth()
    self.height= self.imgs[1]:getHeight()
end

function Player:update(dt)
    if love.keyboard.isDown(self.left) and not love.keyboard.isDown(self.right) then
        self:animate(dt)
        self:rotateLeft()
        self:moveLeft(dt)
    end
    if love.keyboard.isDown(self.right) and not love.keyboard.isDown(self.left) then
        self:animate(dt)
        self:rotateRight()
        self:moveRight(dt)
    end

    if love.keyboard.isDown(self.up) and not love.keyboard.isDown(self.down) then
        self:animate(dt)
        self:moveUp(dt)
    end
    if love.keyboard.isDown(self.down) and not love.keyboard.isDown(self.up) then
        self:animate(dt)
        self:moveDown(dt)
    end
    if love.keyboard:isDown(self.shoot) then
        self.gun:shoot()
    end
end

function Player:draw()
    love.graphics.draw(self.imgs[math.floor(self.currentImg)], self.x, self.y, 0, self.direction, 1)
end

function Player:animate(dt)
    self.currentImg = self.currentImg + dt*7
    if self.currentImg >= 7 then
        self.currentImg = 1
    end
end

function Player:moveUp(dt)
    self.acelY = -self.acelVert
    self.y = self.y + self.acelY*dt
end

function Player:moveDown(dt)
    self.acelY = self.acelVert
    self.y = self.y + self.acelY*dt
end

function Player:moveLeft(dt)
    self.acelX = -self.acelHoriz
    self.x = self.x + self.acelX*dt
end

function Player:moveRight(dt)
    self.acelX = self.acelHoriz
    self.x = self.x + self.acelX*dt
end

function Player:rotateLeft()
    if self.direction == 1 then
        self.direction = -1
        self.x = self.x + self.width
    end
end

function Player:rotateRight()
    if self.direction == -1 then
        self.direction = 1
        self.x = self.x - self.width
    end
end