local player = {}

local image = nil
local quads = {}
local quadIndex = 3
local ticks = 0
local animationSpeed = 10
local walkSide = {3,4,3,5}
local spriteIndex = walkSide[1]
local xScale = -1

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
end

function player.draw()
    p = center(64, 64)
    love.graphics.draw(image, quads[spriteIndex], p[1], p[2], math.rad(180), 1, -1)
end

function player.update()
    ticks = ticks + 1
    if ticks % animationSpeed == 0 then
        quadIndex = quadIndex + 1
        if quadIndex > 4 then
            quadIndex = 1
        end
        spriteIndex = walkSide[quadIndex]
    end
end

return player

