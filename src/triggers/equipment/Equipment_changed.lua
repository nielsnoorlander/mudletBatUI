local eq = BatUI.left.eq
local gag = BatUI.utils.gagOnce
if eq.debounceTimer then killTimer(eq.debounceTimer) end

eq.debounceTimer = tempTimer(0.25, function()
    if eq.updateEquipment == false then
        eq.updateEquipment = true
        gag("equipment brief")
        gag("slots")
        gag(f"idle {BatUI.player.name}")
        send(f"@equipment brief;;@slots;;@idle {BatUI.player.name}")
        eq.debounceTimer = nil
    end
end)