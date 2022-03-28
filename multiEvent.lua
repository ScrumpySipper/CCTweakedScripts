
monitor1 = peripheral.wrap("right")
modem1 = peripheral.wrap("left")
local xsize, ysize = monitor1.getSize()
local xbuttonsize = 10
local ybuttonsize = 10
local startX = xsize / 2 - xbuttonsize / 2
local startY = ysize / 2 - ybuttonsize / 2
local endX = xsize / 2 + xbuttonsize / 2
local endY = ysize / 2 + xbuttonsize / 2

paintutils.drawFilledBox(startX, startY, endX, endY, colors.red) 


while true do

    os.startTimer(0.5)

    event, arg1, arg2, arg3, arg4, arg5 = os.pullEvent()
    if event == "monitor_touch" then
        print("DingDong at " .. arg2 .. "," .. arg3)
    end
end