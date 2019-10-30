Gun = Object:extend()

function Gun:new()
    self.image = love.graphics.newImage("assets/image/gun2.png")
    self.fireworks = {}
    self.currentImg = 0
    self.shootDt = 0
end

function Gun:update(dt)
    self.shootDt = self.shootDt - dt
    for i, firework in pairs(self.fireworks) do
        firework:update(dt)
    end
end

function Gun:draw(quad, x, y, direction, size)
    love.graphics.draw(self.image, quad, x, y, 0, direction, size)

    for i, firework in pairs(self.fireworks) do
        firework:draw()
    end
end

function Gun:shoot(x, y, direction, size, width, height)
    if self.shootDt <= 0 then
        local firework = Firework(x, y, direction, size, width, height)
        table.insert(self.fireworks, firework)
        self.shootDt = 2
    end
end

