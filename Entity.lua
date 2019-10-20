Entity = Object:extend()

function Entity:new(x, y, img, direction)
    self.x = x
    self.y = y
    self.img = img
    self.quadro = 0
    self.direction = direction
    self.vel_x = 0
    self.vel_y = 0
    self.acel_y = 0
    self.acel_x = 0
end

function Entity:update(dt)

end

function Entity:draw()
    love.graphics.draw()
end