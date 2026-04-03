BatUI = BatUI or {}
BatUI.player = BatUI.player or {
    hpcurrent = 100,
    hpmax = 100,
    spcurrent = 100,
    spmax = 100,
    epcurrent = 100,
    epmax = 100,
    strength = 50,
    dexterity = 60,
    constitution = 70,
    intelligence = 80,
    wisdom = 90,
    charisma = 100,
    level = 1,
    experience = 0,
    cash = 0,
    bank = 0,
    weight = 0,
    alignment = "neutral",
    parry = 0,
    name = "John Doe",
    capName = "John Doe",
    size = 50,
    explored = 0,
    age = "unknown",
    eqset = "unknown",
    campingAvailable = true,
    fastCamp = false,
    combatTarget = "",
    healTarget = "",
}

BatUI.player.timers = BatUI.player.timers or {}
BatUI.player.timers.spTickStopWatch = BatUI.player.timers.spTickStopWatch or createStopWatch("spTickStopWatch", false)
BatUI.player.timers.sleepStopWatch = BatUI.player.timers.sleepStopWatch or createStopWatch("sleepStopWatch", false)

function BatUI.player.update(_, stats)
    local changed = {}
    local player = BatUI.player
    for stat, value in pairs(stats) do
        if player[stat] then
            if player[stat] ~= value then
                player[stat] = value
                table.insert(changed, stat)
            end
        else
            BatUI.utils.error(f "Trying to update unknown player stat '{stat}' with value '{value}'")
        end
    end
    if #changed > 0 then
        raiseEvent("BatUI.event.playerUpdated", changed)
    end
end

function BatUI.player.tick(_)
    startStopWatch( BatUI.player.timers.spTickStopWatch )
end

registerNamedEventHandler("BatUI", "scoreUpdated","BatUI.event.scoreUpdated", BatUI.player.update)
registerNamedEventHandler("BatUI", "spTick","BatUI.event.spTick", BatUI.player.tick)
