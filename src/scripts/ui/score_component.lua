BatUI = BatUI or {}
BatUI.ScoreComponent = {
    name = "BatUI.ScoreComponent",
    stat = "Stat",
    defaultStat = 100,
    defaultBase = 100,
    statVariable = "",
    baseVariable = "",
}
local function getValueAt(accessString)
  local ok, err = pcall(loadstring("return " .. tostring(accessString)))
  if ok then return err end
  return nil, err
end

function BatUI.ScoreComponent:new(cons, container)
    local funcName = "BatUI.ScoreComponent:new(cons, container)"
    cons = cons or {}
    local consType = type(cons)
    assert(consType == "table", string.format("%s: cons as table expected, got %s", funcName, consType))
    local me = BatUI.ScoreComponent.parent:new(cons, container)
    setmetatable(me, self)
    self.__index = self
    me:update()
    return me
end

function BatUI.ScoreComponent:update()
    local current = getValueAt(self.statVariable)
    local base = getValueAt(self.baseVariable)
    current = tonumber(current)
    base = tonumber(base)
    if current == nil then
        current = self.defaultStat
        debugc(string.format(
             "ScoreComponent named %s is trying to update with an invalid value. Using the defaultValue instead. statVariable: '%s' baseVariable: '%s'",
             self.name, self.statVariable, self.baseVariable))
    end
    if base == nil then
        base = self.defaultBase
        if self.baseVariable ~= "" then
        debugc(string.format(
               "ScoreComponent named %s is trying to update with an invalid base value. Using the defaultBase instead. statVariable: '%s' baseVariable: '%s'",
               self.name, self.currentVariable, self.maxVariable))
        end
    end
    local diffColor = "<lightgrey>"
    local diff = current - base
    if diff < 0 then
        diffColor = "<red>"
    elseif diff > 0 then
        diffColor = "<green>"
    end
    local lp = BatUI.utils.lpad
    local statString = lp(f"{current}", 4, "&nbsp;")
    local baseString = lp(f"{diff}",4, "&nbsp;")
    self:setFont("Ubuntu Mono")
    self:cecho(f"<white:blue>{self.stat} <r><white>&nbsp;{statString} {diffColor}({baseString})")
end

BatUI.ScoreComponent.parent = Geyser.Label
setmetatable(BatUI.ScoreComponent, Geyser.Label)
