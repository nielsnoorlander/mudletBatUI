local q = BatUI.queue
deleteLine()
if matches[1] == "You finish the last repeated action." then
    q.repeatAction = false
end
raiseEvent("BatUI.event.actionDone")
