BatUI = BatUI or {}

function BatUI.init(_, _)
    BatUI.layout:load()
    BatUI.left:load(BatUI.layout.left)
    BatUI.bottom:load(BatUI.layout.bottom)
end

registerNamedEventHandler("BatUI", "init", "sysLoadEvent", BatUI.init)
registerNamedEventHandler("BatUI", "install", "sysInstall", BatUI.init)
