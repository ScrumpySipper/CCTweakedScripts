while true do

    os.startTimer(0.5)

    event, arg1, arg2, arg3, arg4, arg5 = os.pullEvent()
    if event == "monitor_touch"
        print("DingDong at " ... arg2 ... "," ... arg3)
    end
end