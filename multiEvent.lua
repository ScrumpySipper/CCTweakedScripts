
monitor1 = peripheral.wrap("right")
modem1 = peripheral.wrap("left")
local xsize, ysize = monitor1.getSize()
local xbuttonsize = 10
local ybuttonsize = 10
local startX = xsize / 2 - xbuttonsize / 2
local startY = ysize / 2 - ybuttonsize / 2
local endX = xsize / 2 + xbuttonsize / 2
local endY = ysize / 2 + xbuttonsize / 2

term.redirect(monitor1)
--paintutils.drawFilledBox(startX, startY, endX, endY, colors.red) 

function buttonAdd(xpos, ypos, text)
    local oldColor = term.getTextColor()
    term.setCursorPos(xpos,ypos)
    term.setTextColor(colors.red)
    term.write(text)
    x_end, y_end = term.getCursorPos()
    local length = x_end - xpos
    local height = y_end - ypos

    term.setTextColor(oldColor)

    return xpos, ypos, length, height
end

function checkButton(xpos,ypos,buttonProps)
    local xstart = buttonProps[1]
    local xend = xstart + buttonProps[3]
    local ystart = buttonProps[2]
    local yend = ystart + buttonProps[4]

    if xpos >= xstart and xpos <= xend and ypos >= ystart and ypos <= yend then
        return true
    else
        return false
    end
end



local redrawFlag = true

while true do

    if(redrawFlag) then
        term.clear()
        props1 = {buttonAdd(3,3,"Click Me")}
        redrawFlag = false
    end
    
    os.startTimer(0.5) --Timer will stop event blocking every half second for redraw

    event, arg1, arg2, arg3, arg4, arg5 = os.pullEvent()
    if event == "monitor_touch" then
        term.setCursorPos(0,0)
        --print("DingDong at " .. arg2 .. "," .. arg3)
        if checkButton(arg2, arg3, props1) then
            print("Button Clicked! " .. arg2 .. "," .. arg3)
            redrawFlag = true
        else
            --print("Button Not Click! " .. arg2 .. "," .. arg3 .. " Not in: " .. props1[1] .. "," .. props1[2] .. "," .. props1[3]  .. "," .. props1[4])
        end

    end
end