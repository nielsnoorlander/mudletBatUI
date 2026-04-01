local p = BatUI and BatUI.player
local sleepTimer = p.timers.sleepStopWatch
if p.fastCamp then
	send("@party report (- Awake: FAST CAMP! -)")
else
	send("@party report (- Awake -)")
end
startStopWatch(sleepTimer)