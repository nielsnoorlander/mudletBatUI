local q = BatUI.queue
deleteLine()
cecho(f "\n<forest_green>{matches[1]} <goldenrod>({q.currentAction})")
if matches[2] ~= "casting" and matches[2] ~= "using" then
    if q.essenceEyeTrigger then killTrigger(q.essenceEyeTrigger) end
    q.essenceEyeTrigger = tempRegexTrigger(f"^{q.currentAction}: ([#]+)$", function()
        raiseEvent("BatUI.event.essenceEye", string.len(matches[2]))
    end)
    raiseEvent("BatUI.event.actionStarted")
end