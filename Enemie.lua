Enemie = Object:extend()

function Enemie:new(x, y, imgPath, shootPosition)
    self.x = x
    self.y = y
    self.size = self.y*0.004
    self.direction = -1
    self.acelY = 0
    self.acelX = 0
    self.acelHoriz = 150
    self.acelVert = 150
    self.shootPosition = shootPosition
    
    self.imgs = {}
    self.currentImg = 1
    for i = 1, 7 do
        table.insert(self.imgs, love.graphics.newImage(imgPath .. '/' .. i .. ".png"))
    end
    self.width= self.imgs[1]:getWidth()
    self.height= self.imgs[1]:getHeight()
    self.state = 'entering'
end

function Enemie:update(dt)
    if self.state == 'entering' then
        self.size = self.y*0.004
        self:animate(dt)
        self.x = self.x + self.direction*self.acelHoriz*dt
        if self.direction == 1 and self.x >= self.shootPosition then
            self.state = 'shooting'
        elseif self.direction == -1 and self.x <= self.shootPosition then
            self.state = 'shooting'
        end
    elseif self.state == 'shooting' then
        --self:shoot()
        self.state = 'gettingAway'
        if self.direction == 1 then
            self:rotateLeft()
        else
            self:rotateRight()
        end
    elseif self.state == 'gettingAway' then 
        self.size = self.y*0.004
        self:animate(dt)
        self.x = self.x + self.direction*self.acelHoriz*dt
    end


end

function Enemie:draw()
    love.graphics.draw(self.imgs[math.floor(self.currentImg)], self.x, self.y, 0, self.direction*self.size, self.size)
end



function Enemie:animate(dt)
    self.currentImg = self.currentImg + dt*7
    if self.currentImg >= 7 then
        self.currentImg= 1
    end
end

function Enemie:rotateLeft()
    self.direction = -1
    self.x = self.x + self.width*self.size
end

function Enemie:rotateRight()
    self.direction = 1
    self.x = self.x - self.width*self.size
end

function Enemie:mustBeRemoved()
    if self.state ~= 'gettingAway' then
        return false
    end
    if self.direction == 1 and self.x > love.graphics.getWidth() then
        return true
    elseif self.direction == -1 and self.x + self.width*self.size < 0 then
        return true
    end
    return false
end