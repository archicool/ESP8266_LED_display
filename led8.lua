function writegpio_HIGH(pin)
    gpio.mode(pin,gpio.OUTPUT)
    gpio.write(pin,gpio.HIGH)
end

function writegpio_LOW(pin)
    gpio.mode(pin,gpio.OUTPUT)
    gpio.write(pin,gpio.LOW)
end

function ledlight(pin,light)
    if 1==light then writegpio_HIGH(pin)
    else writegpio_LOW(pin)
    end
end

function no_light(led1,led2,led3,led4,led5,led6,led7)
-- 右上
    ledlight(0,led1)
-- 上
    ledlight(1,led2)
-- 左上
    ledlight(2,led3)
-- 中
    ledlight(3,led4)
-- 左下
    ledlight(4,led5)
-- 下
    ledlight(5,led6)
-- 右下
    ledlight(6,led7)
end
t_led={}
t_led[0]={1,1,1,0,1,1,1}
t_led[1]={1,0,0,0,0,0,1}
t_led[2]={1,1,0,1,1,1,0}
t_led[3]={1,1,0,1,0,1,1}
t_led[4]={1,0,1,1,0,0,1}
t_led[5]={0,1,1,1,0,1,1}
t_led[6]={0,1,1,1,1,1,1}
t_led[7]={1,1,0,0,0,0,1}
t_led[8]={1,1,1,1,1,1,1}
t_led[9]={1,1,1,1,0,1,1}


function led_dark()
    no_light(0,0,0,0,0,0,0)
end

function led_appear(no)
    no_light(t_led[no][1],t_led[no][2],t_led[no][3],t_led[no][4],t_led[no][5],t_led[no][6],t_led[no][7])
end

delayns=1000000
tmr.alarm(0,1000,1,function()
    for i=0,9 do
        led_appear(i)
        tmr.delay(delayns)
        led_dark()
    end
end)

