if matches[3] ~= "stop" and matches[3] ~= "info" then
	-- BatUI.queue.currentActionCommand = matches[2]
	BatUI.queue.currentAction = matches[3]
	if matches[4] then
		BatUI.queue.actionTarget = matches[4]
	else
		BatUI.queue.actionTarget = BatUI.queue.defaultTarget
	end
end