HitBox = Object:extend()

function HitBox:new(x, y, width, height, direction)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.direction = direction
end

function HitBox:update(x, y, width, height, direction)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.direction = direction
end

function HitBox:draw()
    love.graphics.rectangle( "line", self.x, self.y, self.width, self.height)
end

function HitBox:checkColision(other)
    return verifyPoints(self.x, self.y, self.width, self.height, other.x, other.y, other.width, other.height)
end

function verifyPoints(x1, y1, w1, h1, x2, y2, w2, h2)
    if x1 < x2 + w2 and
        x1 + w1 > x2 and
        y1 < y2 + h2 and
        y1 + h1 > y2 then
        return true
    end
end