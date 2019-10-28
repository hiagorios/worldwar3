Enemie = Object:extend()

function Enemie:new(x, y, imgPath)
    self.x = x
    self.y = y
    self.direction = 1
    self.velX = 0
    self.velY = 0
    self.acelY = 0
    self.acelX = 0
    self.acelHoriz = 150
    self.acelVert = 150
    
    self.imgs = {}
    self.currentImg = 1
    for i = 1, 7 do
        table.insert(self.imgs, love.graphics.newImage(imgPath .. '/' .. i .. ".png"))
    end
    self.width= self.imgs[1]:getWidth()
    self.height= self.imgs[1]:getHeight()
end

function Enemie:update(dt)
    self:animate(dt)
    self.x = self.x + dt
end

function Enemie:draw()
    love.graphics.draw(self.imgs[math.floor(self.currentImg)], self.x, self.y, 0, self.direction, 1)
end

function Enemie:animate(dt)
    self.currentImg = self.currentImg + dt*7
    if self.currentImg >= 7 then
        self.currentImg= 1
    end
end