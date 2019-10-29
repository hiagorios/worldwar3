Menu = Object:extend()

function Menu:new(x,y, options, imgPath)
    self.image = love.graphics.newImage(imgPath.. "box.png")
    self.backImage = love.graphics.newImage(imgPath.. "menu.png")
    self.backImageFront = love.graphics.newImage(imgPath.. "menu2.png")
    self.boxW, self.boxH = self.image:getDimensions()
    self.yBox = 100
    self.x = x
    self.y = y
    self.offsetY = 10
    self.yOption = 0
    self.optionSelect = 0
    self.options = options
    self.internalState = 0
end

function Menu:getSelected()
    return self.optionSelect
end

function Menu:getState()
    return self.internalState
end

function Menu:setState(state)
    self.internalState = state
end

function Menu:update(dt)
    if love.keyboard.isDown("down") and not pressedKey then
        self.optionSelect = self.optionSelect < #self.options - 1 and self.optionSelect + 1 or #self.options - 1
        pressedKey = true
    elseif love.keyboard.isDown("up") and not pressedKey then
        self.optionSelect = self.optionSelect > 0 and self.optionSelect - 1  or 0
        pressedKey = true
    elseif not love.keyboard.isDown("down") and not love.keyboard.isDown("up") then
        pressedKey = false
    end

    self.yBox = self.y + (self.optionSelect * self.offsetY*5) - self.boxH/3
end

function Menu:draw(dt)
    love.graphics.draw(self.backImage, 0, 0, 0, 1, 1)
    love.graphics.draw(self.backImageFront, self.x - 2*self.boxH, self.y-self.offsetY*3)
    love.graphics.draw(self.image, self.x - 2*self.boxH, self.yBox)
    for i, option in pairs(self.options) do 
        love.graphics.print(option, self.x - #option*2, self.y + (self.yOption * self.offsetY*5))
        self.yOption = self.yOption + 1
    end
    love.graphics.print(self.optionSelect, 100, 100)
    love.graphics.print(self.internalState, 100, 110)
    self.yOption = 0
end