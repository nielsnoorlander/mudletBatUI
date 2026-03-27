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
    self.eq.console:echo("Not available yet")
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
end