Player = Entity:extend()

function Player:new(x, y, imgPath, acelHoriz, acelVert, left, right, up, down, shoot)
    local imgs = {}
    for i = 1, 7 do
        table.insert(imgs, love.graphics.newImage(imgPath .. '/' .. i .. ".png"))
    end
    Player.super:new(x, y, imgs, acelHoriz, acelVert, 150, 150)
    self.gun = Gun()
    self.left = left or 'left'
    self.right = right or 'right'
    self.up = up or 'up'
    self.down = down or 'down'
    self.shoot = shoot or 'return'
end

function Player:update()
    Player.super:update()
    if love.keyboard.isDown(self.left) and not love.keyboard.isDown(self.right) then
        Player.super:moveLeft()
    end
    if love.keyboard.isDown(self.right) and not love.keyboard.isDown(self.left) then
        Player.super:moveRight()
    end

    if love.keyboard.isDown(self.up) and not love.keyboard.isDown(self.down) then
        Player.super:moveUp()
    end
    if love.keyboard.isDown(self.down) and not love.keyboard.isDown(self.up) then
        Player.super:moveDown()
    end
    if love.keyboard:isDown(self.shoot) then
        self.gun:shoot()
    end
end

function Player:draw()
    Player.super:draw()
end