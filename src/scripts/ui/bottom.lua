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

    self.status.layout = Geyser.Container:new({
        name = "BatUI.bottom.status.layout",
        x = "15%",
        y = 0,
        width = "15%",
        height = "100%",
    }, parent)
    self.status:load(self.status.layout)

    self.party.layout = Geyser.Container:new({
        name = "BatUI.bottom.party.layout",
        x = "30%",
        y = 0,
        width = "25%",
        height = "100%",
    }, parent)
    self.party:load(self.party.layout)

    self.chat.layout = Geyser.Container:new({
        name = "BatUI.bottom.chat.layout",
        x = "55%",
        y = 0,
        width = "40%",
        height = "100%",
    }, parent)
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
        height = "100%-32",
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
    self.label = Geyser.Label:new({
        name = "BatUI.bottom.status.label",
        x = 4,
        y = 4,
        width = "100%-8",
        height = "20",
        fgColor = "black",
        color = "#f35811",
        message = [[<center>STATUS</center>]]
    }, self.background)
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
    self.label = Geyser.Label:new({
        name = "BatUI.bottom.party.label",
        x = 4,
        y = 4,
        width = "100%-8",
        height = "20",
        fgColor = "white",
        color = "#db1718",
        message = [[<center>PARTY</center>]]
    }, self.background)
end
