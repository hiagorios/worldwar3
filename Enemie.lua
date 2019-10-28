Enemie = Entity:extend()

function Enemie:new(x, y, imgPath)
    local imgs = {}
    for i = 1, 7 do
        table.insert(imgs, love.graphics.newImage(imgPath .. '/' .. i .. ".png"))
    end
    Enemie.super:new(x, y, imgs, 150, 150)
end

function Enemie:update(dt)
    Enemie:animate(dt)
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