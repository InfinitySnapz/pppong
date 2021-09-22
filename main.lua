require "paddle"
require "ball"

function Clamp(min, val, max)
    return math.max(min, math.min(val, max));
end

function love.load()
    GTime = 0
    Motion = 1.0
    love.graphics.setNewFont(12)
    love.graphics.setColor(255,255,255)
    love.graphics.setBackgroundColor(0,0,0)
    P1 = Paddle(20,love.graphics.getHeight()/2)
    P2 = Paddle(love.graphics.getWidth()-20,love.graphics.getHeight()/2)
end

function love.update(dt)
    dm = dt*Motion
    GTime = GTime + dm

    if love.keyboard.isDown( "up" ) then
        P1:update(-dm)
    elseif love.keyboard.isDown( "down" ) then
        P1:update(dm)
    end
      
    P2:update(dm*math.cos(GTime))
end

function love.draw()
    love.graphics.print('pppong 0.0.5')
    P1:render()
    P2:render()
end

