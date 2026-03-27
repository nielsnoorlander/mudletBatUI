BatUI = BatUI or {}
BatUI.layout = BatUI.layout or {}
BatUI.layout.mainWidth, BatUI.layout.mainHeight = getMainWindowSize()

function BatUI.layout:load()
    -- Make this config overridable at a later stage?
    self.ratios = { left = 15, right = 10, bottom = 25 }
    self.border = 10

    self.left = Geyser.Container:new({
        name = "BatUI.layout.left",
        x = 0,
        y = 0,
        width = f"{BatUI.layout.ratios.left}%",
        height = f"{100 - BatUI.layout.ratios.bottom}%"
    })

    self.right = Geyser.Container:new({
        name = "BatUI.layout.right",
        x = f"{100 - BatUI.layout.ratios.right}%",
        y = 0,
        width = f"{BatUI.layout.ratios.right}%",
        height = f"{100 - BatUI.layout.ratios.bottom}%"
    })

    self.bottom = Geyser.Container:new({
        name = "BatUI.layout.bottom",
        x = 0,
        y = f"{100 - BatUI.layout.ratios.bottom}%",
        width = "100%",
        height = f"{BatUI.layout.ratios.bottom}%"
    })
    registerNamedEventHandler("BatUI", "layoutResize","sysWindowResizeEvent", BatUI.layout.resize)
end

function BatUI.layout.resize(_, _, _)
      BatUI.layout.debounceTimer = BatUI.layout.debounceTimer or tempTimer(0.5, function()
        local newWidth, newHeight = getMainWindowSize()
        local me = BatUI.layout
        if newWidth ~= me.mainWidth or newHeight ~= me.mainHeight then
          me.width = newWidth
          me.height = newHeight
          me:resizeLayout(newWidth, newHeight)
        end
        killTimer(BatUI.layout.debounceTimer)
        BatUI.layout.debounceTimer = nil
      end)
end

function BatUI.layout:resizeLayout(currentWidth, currentHeight)
    local ratios = self.ratios
    local border = self.border
    setBorderLeft((ratios.left / 100) * currentWidth + border)
    setBorderRight((ratios.right / 100) * currentWidth + border)
    setBorderBottom((ratios.bottom / 100) * currentHeight + border)
    self.left:flash()
    self.right:flash()
    self.bottom:flash()
end

