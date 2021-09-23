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
    self.bearing = {math.rad(math.random(-60,-120)),250}
    --self.bearing = {math.rad(0),250} -- angle, velocity, better for calculating new direction
    self.vector = toVector(self.bearing) -- x velocity, y velocity, better for performance, better for fine collision details
    print("vec",self.vector[1],self.vector[2])
    print("bear",self.bearing[1],self.bearing[2])
    
    test1 = toBearing(toVector({2,100}))
    print(test1[1],test1[2])
    test2 = toVector(toBearing({2,100}))
    print(test2[1],test2[2])

end

function Ball:update(dt)
    if Collide(self.x, self.y, self.width, self.height, P1.x, P1.y, P1.width, P1.height) then
        self.vector = {-self.vector[1],self.vector[2]}
        self.bearing = toBearing(self.vector)
    end
    if Collide(self.x, self.y, self.width, self.height, P2.x, P2.y, P2.width, P2.height*100) then
        self.vector = {-self.vector[1],self.vector[2]}
        self.bearing = toBearing(self.vector)
    end
    self.x = self.x + self.vector[1]*dt
    self.y = self.y + self.vector[2]*dt
end

function Ball:render()
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle('fill', self.x-(self.width/2), self.y-(self.height/2), self.width, self.height)
    love.graphics.print(self.bearing[1]..' ('..math.deg(self.bearing[1])..')',0,15)
    love.graphics.print(self.bearing[2],0,30)
    love.graphics.print(self.vector[1],0,45)
    love.graphics.print(self.vector[2],0,60)
end
