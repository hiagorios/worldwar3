Gun = Object:extend()

function Gun:new()
    self.image = love.graphics.newImage("assets/image/gun2.png")
end

function Gun:update()

end

function Gun:draw(quad, x, y, direction, size)
    love.graphics.draw(self.image, quad, x, y, 0, direction, size)
end

function Gun:shoot()

end