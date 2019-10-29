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
    menu = Menu(200, screenWidth/2 - 20, {'Start Game 1P','Start Game 2P', 'Exit'}, "assets/image/")
    players = {
        player = Player(screenWidth/2, screenHeight/2, 'assets/image/playerRed'),
    }
    player2 = Player(screenWidth/2 - 100, screenHeight/2, 'assets/image/playerRed', "a", "d", "w", "s", "space")

    enemies = {}
    dtEnemies = 2
    state = 0
end

function Game:update(dt)
    if menu:getState() == 1 then
        for i, player in pairs(players) do 
            player:update(dt)
        end

        for i, enemie in pairs(enemies) do 
            enemie:update(dt)
            if enemie:mustBeRemoved() then
                table.remove(enemies, i)
            end
        end
        generateEnemies(dt)
    elseif menu:getState() == 0 and love.keyboard.isDown("return") then
        if menu:getSelected() == 2 then
            love.event.quit()
        elseif menu:getSelected() == 1 then
            table.insert(players, player2)
            menu:setState(1)
        else
            menu:setState(1)
        end
    elseif menu:getState() == 0 then 
        menu:update(dt)
    end

end

function Game:draw()
    love.graphics.draw(background)
    if menu:getState() == 1 then
        for i, player in pairs(players) do 
            player:draw()
        end
        love.graphics.print('Enemies ' .. #enemies, 0, 0, 0, 2, 2)
        for i, enemie in pairs(enemies) do
            enemie:draw(dt)
        end
    elseif menu:getState() == 0 then
        menu:draw(dt)
    end
end

function createEnemie()
    local enemie = Enemie(0, 0, 'assets/image/playerRed', love.math.random(screenWidth*2/3, screenWidth))
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