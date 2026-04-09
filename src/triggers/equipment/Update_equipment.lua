if BatUI.left.eq.updateEquipment ~= false then
  BatUI.left.eq.console:clear()
  deleteLine()
  BatUI.utils.sendAndIgnore(f"idle {BatUI.player.name}")
else
  setTriggerStayOpen("Update equipment", 0)
end