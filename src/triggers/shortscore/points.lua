deleteLine()

local stats = {}
stats.hpcurrent = tonumber(matches[2])
stats.hpmax = tonumber(matches[3])
stats.spcurrent = tonumber(matches[4])
stats.spmax = tonumber(matches[5])
stats.epcurrent = tonumber(matches[6])
stats.epmax = tonumber(matches[7])

raiseEvent("BatUI.event.scoreUpdated", stats)
raiseEvent("BatMap.event.locationUpdated", matches[8], matches[9], matches[10])