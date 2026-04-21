local eq = BatUI.left.eq
if BatUI.left.eq.updateEquipment then
    if matches[2] == "armour" then
        eq.console:cecho("\n<yellow>---< Available slots >---\n")
    else
        eq.console:cecho("<yellow>---< Available limbs >---\n")
    end
    deleteLine()
end