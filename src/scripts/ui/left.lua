BatUI = BatUI or {}

BatUI.left = BatUI.left or {}
BatUI.left.eq = BatUI.left.eq or {}
BatUI.left.score = BatUI.left.score or {}

function BatUI.left:load(parent)
    self.score.layout = Geyser.Container:new({
        name = "BatUI.left.score.layout",
        x = 0,
        y = 0,
        width = "100%",
        height = "25%",
    }, parent)
    self.score:load(self.score.layout)

    self.eq.layout = Geyser.Container:new({
        name = "BatUI.left.eq.layout",
        x = 0,
        y = "25%",
        width = "100%",
        height = "75%",
    }, parent)
    self.eq:load(self.eq.layout)
end

function BatUI.left.score:load(parent)
    self.background = Geyser.Label:new({
        name = "BatUI.left.score.background",
        x = 0, y = 0,
        width = "100%", height = "100%",
        color = "#101010",
        fillBg = 1
    }, parent)
    self.label = Geyser.Label:new({
        name = "BatUI.left.score.label",
        x = 4, y = 4,
        width = "100%-8", height = "20",
        fgColor = "white",
        color = "#1768cc",
        message = [[<center>SCORE</center>]]
    }, self.background)
end

function BatUI.left.eq:load(parent)
    self.background = Geyser.Label:new({
        name = "BatUI.left.eq.background",
        x = 0, y = 0,
        width = "100%", height = "100%",
        color = "#101010",
        fillBg = 1
    }, parent)
    self.label = Geyser.Label:new({
        name = "BatUI.left.eq.label",
        x = 4, y = 4,
        width = "100%-8", height = "20",
        fgColor = "white",
        color = "#5d341c",
        message = [[<center>EQUIPMENT</center>]]
    }, self.background)

    self.eqset = Geyser.Label:new({
        name = "BatUI.left.eq.eqset",
        x = "80%",
        y = 1,
        width = "20%-1",
        height = "100%-2",
        color = "black",
        fgColor = "green",
        message = "SPR",
        }, self.label)
    self.eqset:setAlignment("center")

    self.weight = Geyser.Label:new({
        name = "BatUI.left.eq.weight",
        x = "1",
        y = 1,
        width = "20%-1",
        height = "100%-2",
        color = "black",
        }, self.label)
    self.weight:setAlignment("center")
    self.weight:cecho("<yellow>0 <white>kg")

    self.console = Geyser.MiniConsole:new({
        name = "BatUI.left.eq.console",
        x = 5,
        y = 29,
        width = "100%-10",
        height = "100%-32",
        color = "black",
        scrollBar = false,
        autoWrap = false,
        fontSize = 9
    }, self.background)
    BatUI.left.eq.updateEquipment = false
end

function BatUI.left.eq:copyLine()
    if BatUI.left.eq.updateEquipment ~= false then
        selectCurrentLine()
        copy()
        self.console:appendBuffer()
        deleteLine()
    end
end

registerNamedEventHandler("BatUI", "status.playerUpdated.left", "BatUI.event.playerUpdated", function(_, stats)
    local player = BatUI.player
    local p = BatUI.left.eq
    for _, stat in ipairs(stats) do
        if stat == "weight" then p.weight:cecho(f"<yellow>{player.weight} <white>kg") end
        if stat == "eqset" then
            local config = BatConfig and BatConfig.eqsets and BatConfig.eqsets[player.eqset]
            local color = config and config.color or "green"
            local eqset = config and config.name or string.upper(string.sub(player.eqset, 1, 3))
            p.eqset:cecho(f"<{color}>{eqset}")
        end
    end
end)