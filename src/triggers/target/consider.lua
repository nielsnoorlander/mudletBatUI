local considered = matches[1]
local p = BatUI.player
p.considered = p.considered or {}
if string.find(considered, "is weaker than a butterfly[.]$") then
    p.considered.result = "weak"
elseif string.find(considered, "seems to be really easy[.]$") then
    p.considered.result = "easy"
elseif string.find(considered, "doesn't look very dangerous[.]$") then
    p.considered.result = "not dangerous"
elseif string.find(considered, "looks reasonably competent[.]$") then
    p.considered.result = "competent"
elseif string.find(considered, "looks like a fair opponent[.]$") then
    p.considered.result = "fair"
elseif string.find(considered, "looks quite skilled, beware[.]$") then
    p.considered.result = "quite skilled"
elseif string.find(considered, "and you are nearly equal in power. Damn[.]$") then
    p.considered.result = "equal"
elseif string.find(considered, "looks much stronger than you, beware[.]$") then
    p.considered.result = "much stronger"
elseif string.find(considered, "can easily reduce you to minced meat, so run for your life[.]$") then
    p.considered.result = "Run!"
elseif string.find(considered, "power overwhelms your mind! You PANIC!!$") then
    p.considered.result = "PANIC!"
else
    p.considered.result = "UNKNOWN"
end

if p.considered.result ~= "UNKNOWN" then deleteLine() end