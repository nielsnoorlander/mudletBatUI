BatUI = BatUI or {}

BatUI.utils = BatUI.utils or {}
BatUI.utils.commandGags = BatUI.utils.commandGags or {}

function BatUI.utils.error(message)
    cecho(f "<orange>ERROR - <reset>{message}\n")
end

function BatUI.utils.sendAndIgnore(command)
    -- Ignore the next echoing of this command
    table.insert(BatUI.utils.commandGags, tempRegexTrigger(f "^{command}$", [[ deleteLine() ]], 1))
    send(command)
end

function BatUI.utils.cleanupCommandGags(_)
    for _, triggerId in pairs(BatUI.utils.commandGags) do
        killTrigger(triggerId)
    end
end
registerAnonymousEventHandler("sysDisconnectionEvent", "BatUI.utils.cleanupCommandGags")

function BatUI.utils.comma_value(amount)
    local formatted = amount
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k==0) then
            break
        end
    end
    return formatted
end
