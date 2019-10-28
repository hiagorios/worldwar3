Game = Object:extend()

function Game:new()
    --love.window.setMode( 1010, 720 )
    screenHeight = love.graphics.getHeight()
    screenWidth = love.graphics.getWidth()
    --[[
    love.graphics.setNewFont("assets/font/soopafre.ttf", 50)
    menuTrack = love.audio.newSource("assets/audio/menu.ogg", "stream")
    ingameTrack = love.audio.newSource("assets/audio/ingame.mp3", "stream")
    --]]
    player = Player(screenWidth/2, screenHeight/2, 'assets/image/playerRed', 100, 100)
    background = love.graphics.newImage("assets/image/background.png")
end

function Game:update()
    player:update()
end

function Game:draw()
    love.graphics.draw(background)
    player:draw()
end