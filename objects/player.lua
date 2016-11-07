local player = {}

local image = nil
local quads = {}
local quadIndex = 3
local ticks = 0
local animationSpeed = 10
local walkSide = {3,4,3,5}
local spriteIndex = walkSide[1]
local xScale = -1
local position = {}
local xdirection = -1
local facing = "right"

local function center(x, y)
    return {x - 8, y - 8}
end

function player.init()
    image = love.graphics.newImage("assets/penguin.png")
    quads[1] = love.graphics.newQuad(0, 0, 16, 16, 64, 64)
    quads[2] = love.graphics.newQuad(16, 0, 16, 16, 64, 64)
    quads[3] = love.graphics.newQuad(0, 16, 16, 16, 64, 64)
    quads[4] = love.graphics.newQuad(16, 16, 16, 16, 64, 64)
    quads[5] = love.graphics.newQuad(32, 16, 16, 16, 64, 64)
    quads[6] = love.graphics.newQuad(0, 32, 16, 16, 64, 64)
    quads[7] = love.graphics.newQuad(16, 32, 16, 16, 64, 64)
    position = center(64, 64)


end

function player.draw()
    love.graphics.draw(image, quads[spriteIndex], position[1], position[2], math.rad(180), xdirection, -1)
end

local walkSideways = function ()
  if ticks % animationSpeed == 0 then
      quadIndex = quadIndex + 1
      if quadIndex > 4 then
          quadIndex = 1
      end
      spriteIndex = walkSide[quadIndex]
  end
end

local bopUp = function()
  if ticks % animationSpeed == 0 then
    quadIndex = quadIndex + 1
    if quadIndex > 7 then
      quadIndex = 6
    end
    spriteIndex = quadIndex
  end
end

local bopDown = function()
  if ticks % animationSpeed == 0 then
    quadIndex = quadIndex + 1
    if quadIndex > 2 then
      quadIndex = 1
    end
    spriteIndex = quadIndex
  end
end

function player.update()
    ticks = ticks + 1
    if facing == "left" or facing == "right" then
      walkSideways()
    elseif facing == "down" then
      bopDown()
    else
      bopUp()
    end
end

function player.moveDown()
  if facing == "down" then
    position[2] = position[2] + 4
  else
    facing = "down"
  end
end

function player.moveUp()
  if facing == "up" then
    position[2] = position[2] - 4
  else
    facing = "up"
  end
end

function player.moveLeft()
  if facing == "left" then
    position[1] = position[1] - 4
  else
    xdirection = 1
    facing = "left"
  end
end

function player.moveRight()
  if facing == "right" then
      position[1] = position[1] + 4
  else
    xdirection = -1
    facing = "right"
    position[1] = position[1] - 12
  end
end

return player
