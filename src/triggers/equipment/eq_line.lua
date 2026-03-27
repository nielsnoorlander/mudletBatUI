if BatUI.left.eq.updateEquipment then
  selectCurrentLine()
  copy()
  BatUI.left.eq.console:appendBuffer()
  deleteLine()
end