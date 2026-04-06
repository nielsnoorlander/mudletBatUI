local q = BatUI.queue
local fi = string.find
if fi(matches[1], "^You are") or fi(matches[1], "^You declare") or fi(matches[1], "^You finish") then deleteLine() end
if matches[1] == "You finish the last repeated action." then
    q.repeatAction = false
end
raiseEvent("BatUI.event.actionDone")