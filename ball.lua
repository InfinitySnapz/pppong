Object = require "libs.classic"
Ball = Object.extend(Object)

function toVector(b) -- year 11 trigonometry here we come. sohcahtoa, 0 degrees is north
    return({math.sin(b[1])*b[2],math.cos(b[1])*b[2]})
end    

function toBearing(v) 
    --return({ math.atan(v[1]/v[2]) , math.sqrt(v[1]^2+v[2]^2) })
    sq = math.sqrt(v[1]^2+v[2]^2)
    return({ math.acos(v[2]/sq)*v[1]/math.abs(v[1]) , sq })
end    

function Ball:new(x,y)
    self.x = x
    self.y = y
    self.width = 20
    self.height = 20
    self.bearing = {math.rad(math.random(-120,-60)),250}
    --self.bearing = {math.rad(0),250} -- angle, velocity, better for calculating new direction
    self.vector = toVector(self.bearing) -- x velocity, y velocity, better for performance, better for fine collision details
    --print("vec",self.vector[1],self.vector[2])
    --print("bear",self.bearing[1],self.bearing[2])
end

function Ball:update(dt)

    oldX = self.x 
    oldY = self.y
    self.x = self.x + self.vector[1]*dt
    self.y = self.y + self.vector[2]*dt

    if self.x - self.width/2 < P1.x + P1.width/2 then
        self.x = oldX
        self.y = oldY
        rt = (P1.x - self.x + P1.width/2 + self.width/2)/(self.vector[1]*dt)
        self.x = self.x + self.vector[1]*dt*rt
        self.y = self.y + self.vector[2]*dt*rt
        if P1.y-P1.height/2 < self.y and self.y < P1.y+P1.height/2 then
            self.vector[1] = -self.vector[1]
            self.bearing = toBearing(self.vector)
        end
        self.x = self.x + self.vector[1]*dt*(1-rt)
        self.y = self.y + self.vector[2]*dt*(1-rt)
    end

end

function Ball:render()
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle('fill', self.x-(self.width/2), self.y-(self.height/2), self.width, self.height)
    love.graphics.print(self.bearing[1]..' ('..math.deg(self.bearing[1])..')',0,15)
    love.graphics.print(self.bearing[2],0,30)
    love.graphics.print(self.vector[1],0,45)
    love.graphics.print(self.vector[2],0,60)
end
