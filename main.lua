function love.load()
    love.graphics.setNewFont(12)
    love.graphics.setColor(255,255,255)
    love.graphics.setBackgroundColor(0,0,0)
    P1 = Paddle.init(0,0)
    P2 = Paddle.init(60,0)
end

function love.update(dt)
    P1:update(dt)
    P2:update(dt/2)
end

function love.draw()
    love.graphics.print('pppong 0.0.1')
    P1:render()
    P2:render()
end

--[[ function Paddle(x,y)
    print('argh')

    local pad = {
    x = x,
    y = y,
    w  = 20,
    h  = 80,
    s  = 60
    }

    function pad:render()
        love.graphics.setColor(255,255,255)
        love.graphics.rectangle('fill', pad.x, pad.y, pad.w, pad.h)
    end
    function pad:update(dt)
        pad.y = pad.y+dt*pad.s
    end
    return pad
    
end ]]--

function Paddle.init(xx,yy)
    print('argh')

    local pad

        x = xx
        y = yy
        w  = 20
        h  = 80
        s  = 60 

    function pad:render()
        love.graphics.setColor(255,255,255)
        love.graphics.rectangle('fill', x, y, w, h)
    end

    function pad:update(dt)
        y = y+dt*s
    end
    return pad
    
end