Entity = Object:extend()

function Entity:new(x, y, img, acelHoriz, acelVert, quadWidth, quadHeight)
    self.x = x
    self.y = y
    self.img = img
    self.currentQuad = 0
    self.direction = 1
    self.velX = 0
    self.velY = 0
    self.acelY = 0
    self.acelX = 0
    self.acelHoriz = acelHoriz
    self.acelVert = acelVert

    self.quads = {}
    self.imgWidth= self.img:getWidth()
    self.imgHeight= self.img:getHeight()
    self.quadHeight = quadHeight
    self.quadWidth = quadWidth
    for y = 0, self.imgHeight - self.quadHeight, self.quadHeight do
        for x = 0, self.imgWidth - self.quadWidth, self.quadWidth do
            local quad = love.graphics.newQuad(self.x, self.y, self.quadWidth, self.quadHeight, self.imgWidth, self.imgHeight)
            table.insert(self.quads, quad)
        end
    end
end

function Entity:update(dt)

end

function Entity:draw()
    
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