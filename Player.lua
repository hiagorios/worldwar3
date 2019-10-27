Player = Entity:extend()

function Player:new(x, y, img, acelHoriz, acelVert, left, right, up, down, shoot)
    Player.super:new(x, y, img, acelHoriz, acelVert, 100, 100)
    self.gun = Gun()
    self.left = left or 'left'
    self.right = right or 'right'
    self.up = up or 'up'
    self.down = down or 'down'
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
    Player.super.draw(self.img)
end