BatUI.left.eq.debounceTimer = BatUI.left.eq.debounceTimer or tempTimer(0.3, function()
    BatUI.left.eq.updateEquipment = true
    send("eq brief")
    killTimer(BatUI.left.eq.debounceTimer)
    BatUI.left.eq.debounceTimer = nil
end)
