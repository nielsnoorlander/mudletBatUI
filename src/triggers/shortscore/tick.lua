local spTickedStr = matches[3]
if spTickedStr and string.sub(spTickedStr, 1, 1) == "+" then
	local spTicked = tonumber(string.sub(spTickedStr, 2))
	if spTicked > 20 then
		raiseEvent("BatUI.event.spTick")
	end
end
if (not matches[2] or matches[2] == "") and (not matches[3] or matches[3] == "") then
    deleteLine()
end