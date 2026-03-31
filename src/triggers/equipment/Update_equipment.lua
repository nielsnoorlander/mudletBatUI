if BatUI.left.eq.updateEquipment ~= false then
  BatUI.left.eq.console:clear()
  deleteLine()
  BatUI.utils.sendAndIgnore("sc")
else
  setTriggerStayOpen("Update equipment", 0)
end