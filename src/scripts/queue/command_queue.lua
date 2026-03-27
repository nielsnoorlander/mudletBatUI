BatUI = BatUI or {}
BatUI.queue = BatUI.queue or {}
BatUI.queue.commands = BatUI.queue.commands or {}
BatUI.queue.currentAction = "none"

-- Should be moved to separate utils script
BatUI.utils = BatUI.utils or {}
function BatUI.utils.error(message)
    cecho(f"<orange>ERROR - <reset>{message}\n")
end

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