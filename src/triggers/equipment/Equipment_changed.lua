local eq = BatUI.left.eq
if eq.updateEquipment == false then
    eq.updateEquipment = true
    BatUI.utils.sendAndIgnore("equipment brief")
end
