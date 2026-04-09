deleteLine()
local q = BatUI.queue
local u = BatUI.utils
local index = 2
if matches[2] ~= "tunnel" then index = 4 end
if string.find(matches[2], "^repeat ") then q.repeatAction = true else q.repeatAction = false end
if matches[index + 1] ~= "stop" and matches[index + 1] ~= "info" then
	q.currentActionType = matches[index]
    q.currentAction = u.firstToUpper(matches[index + 1])
	if matches[index + 2] then
		q.actionTarget = matches[index + 2]
	else
		q.actionTarget = q.defaultTarget
	end
end