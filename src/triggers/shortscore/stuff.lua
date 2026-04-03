deleteLine()

local stats = {}

stats.cash = matches[2] and tonumber(matches[2])
stats.bank = matches[3] and tonumber(matches[3])
stats.experience = matches[4] and tonumber(matches[4])
stats.weight = matches[5] and tonumber(matches[5])
stats.parry = matches[6] and tonumber(matches[6])
stats.combatTarget = matches[7]
raiseEvent("BatUI.event.scoreUpdated", stats)