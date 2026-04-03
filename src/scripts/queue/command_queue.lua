BatUI = BatUI or {}
BatUI.queue = BatUI.queue or {
    commands = {},
    noAction = "none",
    defaultTarget = "default",
    currentAction = "none",
    actionTarget = "default",
    repeatAction = false,
}

function BatUI.queue:addAction(action, position)
    if #self.commands == 0 and self.currentAction == "none" then
        send(action)
    else
        if position then
            local pos = tonumber(position)
            if pos > 0 and pos <= #self.commands then
                table.insert(self.commands, pos, action)
            else
                BatUI.utils.error(f"Could not add action to queue: position {pos} out-of-bounds")
            end
        else
            table.insert(self.commands, action)
        end
    end
    raiseEvent("BatUI.event.queue.updated")
end

function BatUI.queue:removeAction(position)
    if position then
        local pos = tonumber(position)
        if pos > 0 and pos <= #self.commands then
            table.remove(self.commands, pos)
        else
            BatUI.utils.error(f"Could not remove action to queue: position {pos} out-of-bounds")
        end
    end
    raiseEvent("BatUI.event.queue.updated")
end

function BatUI.queue:nextAction()
    local nextAction = self.commands and table.remove(self.commands, 1)
    if nextAction ~= nil then
        send(nextAction)
    end
    raiseEvent("BatUI.event.queue.updated")
end

function BatUI.queue:clear()
    self.commands = {}
    raiseEvent("BatUI.event.queue.updated")
end

function BatUI.queue.actionDone()
    local q = BatUI.queue
    if q.repeatAction == false then
        q.currentAction = q.noAction
        if #q.commands > 0 then
            q:nextAction()
        end
    end
end

function BatUI.queue.updateQueueConsole()
    local q = BatUI.queue.commands
    local qc = BatUI.bottom.queue.console
    qc:clear()
    if #q > 0 then
        for i = 1, #q do
            qc:cecho(f"<yellow>[{i}] <white>{q[i]}\n")
        end
    else
        local cols = qc:getColumnCount()
        local msg = "<< EMPTY >>"
        qc:echo(string.rep("\n", math.floor((qc:getRowCount() -1) / 2)))
        qc:echo(string.rep(" ", math.floor((cols - string.len(msg))/ 2))..msg)
    end
end

registerNamedEventHandler("BatUI", "actionDone","BatUI.event.actionDone", BatUI.queue.actionDone)
registerNamedEventHandler("BatUI", "queueUpdated", "BatUI.event.queue.updated", BatUI.queue.updateQueueConsole)