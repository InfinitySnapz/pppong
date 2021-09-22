require "paddle"
require "ball"

function Clamp(min, val, max)
    return math.max(min, math.min(val, max));
end

function love.load()
    Motion = 1.0
    love.graphics.setNewFont(12)
    love.graphics.setColor(255,255,255)
    love.graphics.setBackgroundColor(0,0,0)
    P1 = Paddle(20,0)
    P2 = Paddle(love.graphics.getWidth()-20,0)
end

function love.update(dt)
    dm = dt*Motion
    P1:update(dm)
    P2:update(dm/2)
end

function love.draw()
    love.graphics.print('pppong 0.0.4')
    P1:render()
    P2:render()
end

