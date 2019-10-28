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
    background = love.graphics.newImage("assets/image/background.png")
    player = Player(screenWidth/2, screenHeight/2, 'assets/image/playerRed')
    enemies = {}
    dtEnemies = 2
end

function Game:update(dt)
    player:update(dt)
    for i, enemie in pairs(enemies) do 
        enemie:update(dt)
    end
    generateEnemies(dt)
end

function Game:draw()
    love.graphics.draw(background)
    player:draw()
    for i, enemie in pairs(enemies) do 
        enemie:draw(dt)
    end
end

function createEnemie()
    local x = screenWidth/3
    local y = screenHeight/3
    return Enemie(x, y, 'assets/image/playerGreen')
end

function generateEnemies(dt)
    dtEnemies = dtEnemies - dt
    if dtEnemies <= 0 and #enemies <=2 then
        table.insert(enemies, createEnemie())
    end
end