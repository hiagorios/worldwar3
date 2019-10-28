Player = Entity:extend()

function Player:new(x, y, imgPath, acelHoriz, acelVert, left, right, up, down, shoot)
    local imgs = {}
    for i = 1, 7 do
        table.insert(imgs, love.graphics.newImage(imgPath .. '/' .. i .. ".png"))
    end
    Player.super:new(x, y, imgs, acelHoriz, acelVert, 200, 200)
    self.gun = Gun()
    self.left = left or 'left'
    self.right = right or 'right'
    self.up = up or 'up'
    self.down = down or 'down'
    self.shoot = shoot or 'return'
end

function Player:update(dt)
    Player.super:update(dt)
    if love.keyboard.isDown(self.left) and not love.keyboard.isDown(self.right) then
        Player.super:rotateLeft()
        Player.super:moveLeft(dt)
        Player:animate(dt)
    end
    if love.keyboard.isDown(self.right) and not love.keyboard.isDown(self.left) then
        Player.super:rotateRight()
        Player.super:moveRight(dt)
        Player:animate(dt)
    end

    if love.keyboard.isDown(self.up) and not love.keyboard.isDown(self.down) then
        Player.super:moveUp(dt)
        Player:animate(dt)
    end
    if love.keyboard.isDown(self.down) and not love.keyboard.isDown(self.up) then
        Player.super:moveDown(dt)
        Player:animate(dt)
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
        self.currentImg= 1
    end
end