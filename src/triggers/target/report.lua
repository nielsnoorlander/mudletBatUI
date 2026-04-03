local p = BatUI and BatUI.player
local q = BatUI and BatUI.queue
local reportCommand = "@party report --> "

p.combatTarget = matches[3]
raiseEvent("BatUI.event.playerUpdated", { "combatTarget" })

if q.currentAction == "dim mak" then
	reportCommand = reportCommand.."DIM MAK: "
elseif q.currentAction == "battlecry" then
	reportCommand = reportCommand.."CRY: "
elseif q.currentAction == "prismatic burst" then
	reportCommand = reportCommand.."BURST: "
else
	reportCommand = reportCommand.."Target: "
end

reportCommand = reportCommand..matches[3]

if p.combatTargetAlias then
	reportCommand = f"{reportCommand} [{p.combatTargetAlias}]"
end
if p.considered and p.considered.result then
	reportCommand = f"{reportCommand} ({p.considered.result})"
	if p.considered.inferior then
		reportCommand = f"{reportCommand} ## INFERIOR"
	end
	p.considered = nil
end

BatUI.utils.sendAndIgnore(reportCommand, "^party report .*")