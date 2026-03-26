if BatUI.left.eq.updateEquipment then
  BatUI.left.eq.console:clear()
  deleteLine()
  send("sc")
else
  setTriggerStayOpen("Update equipment", 0)
end