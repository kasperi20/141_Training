ActiveSam = nil

function ClearRange()
    if ActiveSam == nil then return end
    
    local despawnArmyGroup = ARMYGROUP:New(ActiveSam)
    despawnArmyGroup:Despawn()
end

local ClearRangeMenu = MENU_MISSION_COMMAND:New("Clear Range", SamRange, ClearRange)

-- SA-2
function SpawnSA2()
    ClearRange()
    local SA2template = SPAWN:New("Red-SAM-SA2")
    local SA2 = SA2template:Spawn()
    ActiveSam = SA2
end

local spawnSA2Menu = MENU_MISSION_COMMAND:New("Spawn SA-2", SamRange, SpawnSA2)

-- SA-3
function SpawnSA3()
    ClearRange()
    local SA3template = SPAWN:New("Red-SAM-SA3")
    local SA3 = SA3template:Spawn()
    ActiveSam = SA3
end

local spawnSA3Menu = MENU_MISSION_COMMAND:New("Spawn SA-3", SamRange, SpawnSA3)

-- SA-5
function SpawnSA5()
    ClearRange()
    local SA5template = SPAWN:New("Red-SAM-SA5")
    local SA5 = SA5template:Spawn()
    ActiveSam = SA5
end

local spawnSA5Menu = MENU_MISSION_COMMAND:New("Spawn SA-5", SamRange, SpawnSA5)

-- SA-6
function SpawnSA6()
    ClearRange()
    local SA6template = SPAWN:New("Red-SAM-SA6")
    local SA6 = SA6template:Spawn()
    ActiveSam = SA6
end

local spawnSA6Menu = MENU_MISSION_COMMAND:New("Spawn SA-6", SamRange, SpawnSA6)

-- SA-10
function SpawnSA10()
    ClearRange()
    local SA10template = SPAWN:New("Red-SAM-SA10")
    local SA10 = SA10template:Spawn()
    ActiveSam = SA10
end

local spawnSA10Menu = MENU_MISSION_COMMAND:New("Spawn SA-10", SamRange, SpawnSA10)

-- SA-11
function SpawnSA11()
    ClearRange()
    local SA11template = SPAWN:New("Red-SAM-SA11")
    local SA11 = SA11template:Spawn()
    ActiveSam = SA11
end

local spawnSA11Menu = MENU_MISSION_COMMAND:New("Spawn SA-11", SamRange, SpawnSA11)