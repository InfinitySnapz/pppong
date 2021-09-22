Object = require "libs.classic"
Paddle = Object.extend(Object)

MaxHeight = love.graphics.getHeight()

function Paddle:new(x,y)
    self.x = x
    self.y = y
    self.width = 20
    self.height = 120
    self.speed = 60
end

function Paddle:render()
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle('fill', self.x-(self.width/2), self.y-(self.height/2), self.width, self.height)
end

function Paddle:update(dt)
    self.y = Clamp(0+self.height/2,self.y+dt*self.speed,MaxHeight-self.height/2)
end
