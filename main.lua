require "paddle"

function love.load()
   love.graphics.setNewFont(12)
   love.graphics.setColor(255,255,255)
   love.graphics.setBackgroundColor(0,0,0)
   P1 = Paddle(0,0)
   P2 = Paddle(60,0)
end

function love.update(dt)
   P1:update(dt)
   P2:update(dt/2)
end

function love.draw()
   love.graphics.print('pppong 0.0.2')
   P1:render()
   P2:render()
end

