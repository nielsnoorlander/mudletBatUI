BatUI = BatUI or {}

BatUI.utils = BatUI.utils or {}
BatUI.utils.commandGags = BatUI.utils.commandGags or {}

function BatUI.utils.error(message)
    cecho(f "<orange>ERROR - <reset>{message}\n")
end

function BatUI.utils.sendAndIgnore(command, pattern)
    -- Ignore the next echoing of this command
    local ignore = pattern or command
    BatUI.utils.gagOnce(ignore)
    send(command)
end

function BatUI.utils.gagOnce(exactMatch)
    tempRegexTrigger(f "^{exactMatch}$", [[ deleteLine() ]], 1)
end

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

function BatUI.utils.firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function BatUI.utils.rpad(str, len, char)
    if char == nil then
        char = ' '
    end
    return str .. string.rep(char, len - #str)
end

function BatUI.utils.lpad(str, len, char)
    if char == nil then
        char = ' '
    end
    return string.rep(char, len - #str) .. str
end