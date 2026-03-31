BatUI = BatUI or {}

BatUI.bottom = BatUI.bottom or {}
BatUI.bottom.queue = BatUI.bottom.queue or {}
BatUI.bottom.status = BatUI.bottom.status or {}
BatUI.bottom.party = BatUI.bottom.party or {}
BatUI.bottom.chat = BatUI.bottom.chat or {}

function BatUI.bottom:load(parent)
    self.queue.layout = Geyser.Container:new({
        name = "BatUI.bottom.queue.layout",
        x = 0,
        y = 0,
        width = "15%",
        height = "100%",
    }, parent)
    self.queue:load(self.queue.layout)

    self.cmdLine = Geyser.CommandLine:new({
        x = "15%",
        y = 0,
        width = "40%",
        height = 24,
        stylesheet = "border: 1px solid silver;",
    }, parent)

    self.status.layout = Geyser.Container:new({
        name = "BatUI.bottom.status.layout",
        x = "15%",
        y = 25,
        width = "15%",
        height = "100%-25",
    }, parent)
    self.status:load(self.status.layout)

    self.party.layout = Geyser.Container:new({
        name = "BatUI.bottom.party.layout",
        x = "30%",
        y = 25,
        width = "25%",
        height = "100%-25",
    }, parent)
    self.party:load(self.party.layout)

    self.chat.layout = Geyser.Container:new({
        name = "BatUI.bottom.chat.layout",
        x = "55%",
        y = 0,
        width = "45%-6px",
        height = "100%",
    }, parent)
    self.chat:load(self.chat.layout)
end

function BatUI.bottom.queue:load(parent)
    self.background = Geyser.Label:new({
        name = "BatUI.bottom.queue.background",
        x = 0,
        y = 0,
        width = "100%",
        height = "100%",
        color = "#101010",
        fillBg = 1
    }, parent)
    self.background:setStyleSheet(BatUI.layout.panelStyle)

    self.label = Geyser.Label:new({
        name = "BatUI.bottom.queue.label",
        x = 4,
        y = 4,
        width = "100%-8",
        height = "20",
        fgColor = "black",
        color = "#ffd503",
        message = [[<center>QUEUE</center>]]
    }, self.background)

    self.console = Geyser.MiniConsole:new({
        name = "BatUI.bottom.queue.console",
        x = 5,
        y = 29,
        width = "100%-10",
        height = "100%-32px",
        color = "black",
        scrollBar = false,
        autoWrap = false,
        fontSize = 9
    }, self.background)
end

function BatUI.bottom.status:load(parent)
    self.background = Geyser.Label:new({
        name = "BatUI.bottom.status.background",
        x = 0,
        y = 0,
        width = "100%",
        height = "100%",
        color = "#101010",
        fillBg = 1
    }, parent)
    -- Row Status header
    local panelHeight = 20
    local yIndex = 4;
    self.background:setStyleSheet(BatUI.layout.panelStyle)
    self.label = Geyser.Label:new({
        name = "BatUI.bottom.status.label",
        x = 4,
        y = yIndex,
        width = "100%-8px",
        height = panelHeight,
        fgColor = "black",
        color = "#f35811",
        message = [[<center>STATUS</center>]]
    }, self.background)
    yIndex = yIndex + panelHeight + 4
    -- Introduce panels
    self.panels = self.panels or {}
    -- Row HP Gauge
    panelHeight = 20
    local SUG = require("BatUI.sug")
    self.panels.hpGaugeLabel = Geyser.Label:new({
        name = "BatUI.bottom.status.panel.hpGaugeLabel",
        x = 4,
        y = yIndex,
        width = 36,
        height = panelHeight,
        fontSize = 9,
        fgColor = "white",
        color = "#202020",
        message = "HP:",
        stylesheet = "padding-left:2px;",
    }, self.background)
    if self.panels.hpGauge then self.panels.hpGauge:stop() end
    self.panels.hpGauge = SUG:new({
        name = "BatUI.bottom.status.panel.hpGauge",
        x = 44,
        y = yIndex,
        width = "100%-48",
        height = panelHeight,
        color = "#f01010",
        textTemplate = "|c/|m",
        currentVariable = "BatUI.player.hpcurrent",
        maxVariable = "BatUI.player.hpmax",
        updateEvent = "BatUI.event.playerUpdated",
        updateHook = function (self, cur, max)
                 -- figure out the percentage of HP remaining
                 local perc = math.floor((cur / max * 100) + 0.5)
                 if perc > 75 then -- > 75 is green
                     self:setColor("#196019")
                 elseif perc > 50 then -- 50 < perc < 76 is yellow
                     self:setColor("#ece939")
                 elseif perc > 25 then -- 25 < perc < 51 is orange
                     self:setColor("#df7816")
                 else -- 25% or less is red
                     self:setColor("#cf2b23")
                 end
             end,
    }, self.background)
    self.panels.hpGauge:setAlignment("center")
    yIndex = yIndex + panelHeight + 4
    -- Row SP Gauge
    panelHeight = 20
    self.panels.spGaugeLabel = Geyser.Label:new({
        name = "BatUI.bottom.status.panel.spGaugeLabel",
        x = 4,
        y = yIndex,
        width = 36,
        height = panelHeight,
        fontSize = 9,
        fgColor = "white",
        color = "#202020",
        message = "SP:",
        stylesheet = "padding-left:2px;",
    }, self.background)
    if self.panels.spGauge then self.panels.spGauge:stop() end
    self.panels.spGauge = SUG:new({
        name = "BatUI.bottom.status.panel.spGauge",
        x = 44,
        y = yIndex,
        width = "100%-48",
        height = panelHeight,
        color = "#1010f0",
        textTemplate = "|c/|m",
        currentVariable = "BatUI.player.spcurrent",
        maxVariable = "BatUI.player.spmax",
        updateEvent = "BatUI.event.playerUpdated"
    }, self.background)
    self.panels.spGauge:setAlignment("center")
    yIndex = yIndex + panelHeight + 4
    -- Row EP Gauge
    panelHeight = 20
    self.panels.epGaugeLabel = Geyser.Label:new({
        name = "BatUI.bottom.status.panel.epGaugeLabel",
        x = 4,
        y = yIndex,
        width = 36,
        height = panelHeight,
        fontSize = 9,
        fgColor = "white",
        color = "#202020",
        message = "EP:",
        stylesheet = "padding-left:2px;",
    }, self.background)
    if self.panels.epGauge then self.panels.epGauge:stop() end
    self.panels.epGauge = SUG:new({
        name = "BatUI.bottom.status.panel.epGauge",
        x = 44,
        y = yIndex,
        width = "100%-48",
        height = panelHeight,
        color = "#7623cf",
        fgColor = "#000000",
        textTemplate = "|c/|m",
        currentVariable = "BatUI.player.epcurrent",
        maxVariable = "BatUI.player.epmax",
        updateEvent = "BatUI.event.playerUpdated"
    }, self.background)
    self.panels.epGauge:setAlignment("center")
    yIndex = yIndex + panelHeight + 4
    -- Row Action
    panelHeight = 18
    self.panels.actionType = Geyser.Label:new({
        name = "BatUI.bottom.status.panel.actionType",
        x = 4,
        y = yIndex,
        width = 36,
        height = panelHeight,
        fontSize = 9,
        fgColor = "black",
        color = "#202020",
        message = "-",
        stylesheet = "padding-left:2px;",
    }, self.background)

    self.panels.action = Geyser.Label:new({
        name = "BatUI.bottom.status.panel.action",
        x = 44,
        y = yIndex,
        width = "80%-44",
        height = panelHeight,
        fontSize = 9,
        stylesheet = "padding-left:2px; background-color: black;",
        message = "-"
    }, self.background)
    self.panels.rounds = Geyser.Label:new({
        name = "BatUI.bottom.status.panel.rounds",
        x = "-20%",
        y = yIndex,
        width = "20%-4px",
        height = panelHeight,
        fontSize = 9,
        fgColor = "green",
        message = "?",
        stylesheet = "padding-right: 2px; background-color: black;",
    }, self.background)
    self.panels.rounds:setAlignment("right")
    yIndex = yIndex + panelHeight + 4
    -- Row Action Target
    panelHeight = 18
    self.panels.actionTargetLabel = Geyser.Label:new({
        name = "BatUI.bottom.status.panel.actionTargetLabel",
        x = 4,
        y = yIndex,
        width = 36,
        height = panelHeight,
        fontSize = 9,
        fgColor = "black",
        color = "#202020",
        message = "At",
        stylesheet = "padding-left:2px;"
    }, self.background)
    self.panels.actionTarget = Geyser.Label:new({
        name = "BatUI.bottom.status.panel.actionTarget",
        x = 44,
        y = yIndex,
        width = "100%-48",
        height = panelHeight,
        fontSize = 9,
        fgColor = "white",
        message = "-",
        stylesheet = "padding-left:2px; background-color: black;"
    }, self.background)
    yIndex = yIndex + panelHeight + 4
end

function BatUI.bottom.party:load(parent)
    self.background = Geyser.Label:new({
        name = "BatUI.bottom.party.background",
        x = 0,
        y = 0,
        width = "100%",
        height = "100%",
        color = "#101010",
        fillBg = 1
    }, parent)
    self.background:setStyleSheet(BatUI.layout.panelStyle)

    self.label = Geyser.Label:new({
        name = "BatUI.bottom.party.label",
        x = 4,
        y = 4,
        width = "100%-8px",
        height = "20",
        fgColor = "white",
        color = "#db1718",
        message = [[<center>PARTY</center>]]
    }, self.background)
end

function BatUI.bottom.chat:load(parent)
    self.background = Geyser.Label:new({
        name = "BatUI.bottom.chat.background",
        x = 0,
        y = 0,
        width = "100%",
        height = "100%",
        color = "#101010",
        fillBg = 1
    }, parent)
    self.background:setStyleSheet(BatUI.layout.panelStyle)

    local EMCO = require("BatUI.emco")
    BatUI.bottom.chat.emco = EMCO:new({
        name = "BatUI.bottom.chat.emco",
        x = "4",
        y = "4",
        width = "100%-8px",
        height = "100%-6px",
        tabHeight = 18,
        allTab = true,
        allTabName = "All",
        gap = 2,
        consoleColor = "#000000",
        consoles = {
            "All",
            "bat",
            "chat",
            "ghost",
            "newbie",
            "party",
            "sales",
            "SS",
            "tell",
            "wanted",
        },
        timestamp = true,
        customTimestampColor = true,
        timestampFGColor = "#ffffff",
        timestampBGColor = "#202020",
        mapTab = false,
        leftMargin = 2,
        topMargin = 2,
        scrollbars = true
    }, self.background)
end

registerNamedEventHandler("BatUI", "status.panels.action.started", "BatUI.event.actionStarted", function()
    local p = BatUI.bottom.status.panels
    local q = BatUI.queue
    p.action:echo(q.currentAction)
    if q.currentActionType == "use" or q.currentActionType == "tunnel" then
        p.actionType:echo("Skill")
        p.actionType:setColor("#eec241")
    else
        p.actionType:echo("Spell")
        p.actionType:setColor("#417fee")
    end
    if q.actionTarget ~= q.defaultTarget then
        p.actionTarget:echo(q.actionTarget)
        p.actionTargetLabel:setColor("white")
    else
        p.actionTarget:echo("-")
        p.actionTargetLabel:setColor("#202020")
    end
end)

registerNamedEventHandler("BatUI", "status.panels.action.done", "BatUI.event.actionDone", function ()
    local p = BatUI.bottom.status.panels
    local q = BatUI.queue
    p.action:echo("-")
    p.actionType:echo("-")
    p.rounds:echo("?")
    p.actionType:setColor("#202020")
    p.actionTargetLabel:setColor("#202020")
    p.actionTarget:echo("-")
    if q.essenceEyeTrigger then killTrigger(q.essenceEyeTrigger) end
end)

registerNamedEventHandler("BatUI", "status.panels.action.round", "BatUI.event.essenceEye", function(_, rounds)
    BatUI.bottom.status.panels.rounds:echo(rounds)
    BatUI.bottom.status.panels.rounds:flash(0.2)
end)