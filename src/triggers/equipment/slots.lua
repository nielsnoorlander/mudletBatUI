local c = BatUI.left.eq.console
local u = BatUI.utils
local amount = matches[2]
local slot = matches[3]

deleteLine()
if amount ~= "no" and slot ~= "held" then
    local numAmount = 1
    if amount == "two" then
        numAmount = 2
    elseif amount == "three" then
        numAmount = 3
    elseif amount == "four" then
        numAmount = 4
    end
    c:echo(f"{u.rpad(u.firstToUpper(slot),8)}: {numAmount}\n")
end