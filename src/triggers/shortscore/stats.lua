deleteLine()
-- EQ:<eqset> STATS: <name>/<capname>/<mortlevel>/<strnum>/<dexnum>/<connum>/<intnum>/<wisnum>/<chanum>/<siznum>/<tp>/<alignment>/<rooms>/<age>/
--     2              3      4         5           6        7        8        9        10       11       12       13   14          15      16
local stats = {}
stats.eqset = matches[2]
stats.name = matches[3]
stats.capName = matches[4]
stats.level = tonumber(matches[5])
stats.strength = tonumber(matches[6])
stats.dexterity = tonumber(matches[7])
stats.constitution = tonumber(matches[8])
stats.intelligence = tonumber(matches[9])
stats.wisdom = tonumber(matches[10])
stats.charisma = tonumber(matches[11])
stats.size = tonumber(matches[12])
stats.alignment = matches[14]
stats.explored = tonumber(matches[15])
stats.age = matches[16]

raiseEvent("BatUI.event.scoreUpdated", stats)