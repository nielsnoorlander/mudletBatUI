deleteLine()
local q = BatUI.queue
if matches[3] ~= "stop" and matches[3] ~= "info" then
	q.currentActionType = matches[2]
    q.currentAction = matches[3]:gsub("^%l", string.upper)
	q.essenceEyeTrigger = tempRegexTrigger(f"^{q.currentAction}: ([#]+)$", function()
	    deleteLine()
        raiseEvent("BatUI.event.essenceEye", string.len(matches[2]))
    end)
	if matches[4] then
		q.actionTarget = matches[4]
	else
		q.actionTarget = q.defaultTarget
	end
end