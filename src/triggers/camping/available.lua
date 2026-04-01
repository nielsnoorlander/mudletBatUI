local p = BatUI and BatUI.player
local sleepTimer = p.timers.sleepStopWatch
local timeSinceLastCamp = math.floor(stopStopWatch( sleepTimer ))
local seconds = timeSinceLastCamp%60
local minutes = math.floor(timeSinceLastCamp/60)%60
local message = string.format("%d:%02d", minutes, seconds)
BatUI.utils.sendAndIgnore(f"@party report (- Camping available [{message}] -)")
p.campingAvailable = true
