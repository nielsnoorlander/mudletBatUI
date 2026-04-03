local spTickedStr = matches[3]
if spTickedStr and string.sub(spTickedStr, 1, 1) == "+" then
	local spTicked = tonumber(string.sub(spTickedStr, 2))
	if spTicked > 20 then
		raiseEvent("BatUI.event.spTick")
	end
elseif not matches[2] then
    deleteLine()
end
