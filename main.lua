player = require "objects/player"

function love.load()
    love.graphics.setDefaultFilter('nearest','nearest',1)
    player.init()
end

function love.draw()
    -- love.graphics.printf("I am penguin", 256, 200, 100, 'center')
    love.graphics.scale(4)
    love.graphics.setBackgroundColor(255,0,255)

    player.draw()
end

function love.keypressed(key)
   if key == 'right' then
      player.moveRight()
   elseif key == 'left' then
      player.moveLeft()
   elseif key == 'down' then
     player.moveDown()
   elseif key == 'up' then
     player.moveUp()
   end
end

function love.update(dt)
    player.update()
end
