local c = BatUI.left.eq.console
local barso = matches[2]
local leftOrRight = matches[3]
local slot = matches[4]
local wielded = matches[5]

deleteLine()
if wielded == "unarmed" then
    c:echo(matches[1]:gsub("unarmed",""))
end
