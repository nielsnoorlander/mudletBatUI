if BatUI.left.eq.updateEquipment ~= false then
  BatUI.left.eq.console:clear()
  deleteLine()
else
  setTriggerStayOpen("Update equipment", 0)
end