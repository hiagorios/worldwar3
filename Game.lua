Game = Object:extend()

function Game:new()
    love.window.setMode(816, 624)
    love.window.setTitle('Guerra de espada 2019')
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
        if enemie:mustBeRemoved() then
            table.remove(enemies, i)
        end
    end
    generateEnemies(dt)
end

function Game:draw()
    love.graphics.draw(background)
    player:draw()
    love.graphics.print('Enemies ' .. #enemies, 0, 0, 0, 3, 3)
    for i, enemie in pairs(enemies) do 
        enemie:draw(dt)
    end
end

function createEnemie()
    local enemie = Enemie(0, 0, 'assets/image/playerGreen', love.math.random(screenWidth*2/3, screenWidth))
    enemie.y = love.math.random(love.graphics.getHeight()/6, screenHeight - enemie.height)
    enemie.x = love.math.random(0,1)*(screenWidth + enemie.width)
    if enemie.x == 0 then
        enemie.x = -enemie.width
        enemie.direction = 1
        enemie.shootPosition = screenWidth - enemie.shootPosition
    end
    return enemie
end

function generateEnemies(dt)
    dtEnemies = dtEnemies - dt
    if dtEnemies <= 0 and #enemies <=3 then
        table.insert(enemies, createEnemie())
        dtEnemies = 2
    end
end