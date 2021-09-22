Object = require "libs.classic"
Ball = Object.extend(Object)

function toVector(b) -- year 11 trigonometry here we come. sohcahtoa, 0 degrees is north
    return({math.cos(b[1])*b[2],math.sin(b[1])*b[2]})
end    

function Ball:new(x,y)
    self.x = x
    self.y = y
    self.width = 20
    self.height = 20
    self.bearing = {math.random(0,360),250} -- angle, velocity, better for calculating new direction
    self.vector =  toVector(self.bearing) -- x velocity, y velocity, better for performance, better for fine collidion details
end

function Ball:update(dt)
    self.x = self.x + self.vector[1]*dt
    self.y = self.y + self.vector[2]*dt
end

function Ball:render()
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle('fill', self.x-(self.width/2), self.y-(self.height/2), self.width, self.height)
    love.graphics.print(self.bearing,0,10)
    love.graphics.print(self.vector,0,20)
end
