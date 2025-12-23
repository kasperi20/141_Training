-- Supply to Gaduta group
GadutaSupply = SPAWN:New("Gudata-Supply")
GadutaZone = ZONE:New("Gaduta_supply_Zone")



function SpawnGadutaSupplyfnc()
    GadutaGroup = GadutaSupply:Spawn()

    Messenger = SCHEDULER:New( GadutaGroup,
        function()
            if GadutaGroup:IsCompletelyInZone(GadutaZone) then 
                DespawnGroup(GadutaGroup)
            end
        end,
        {}, 0, 60 --delay between every check
    )
end

function DespawnGroup(group)
    local despawnArmyGroup = ARMYGROUP:New(group)
    despawnArmyGroup:Despawn()

    SpawnGadutaSupplyfnc()
end

SpawnGadutaSupplyfnc()

local SpawnGadutaSupply = MENU_MISSION_COMMAND:New("Spawn Gaduta Supply", SpawnMenu, SpawnGadutaSupplyfnc)


-- Gaduta Units 
function GadutaUnits()
    GdutaStaticTable = STATIC:FindAllByMatching("Gaduta%-Static")

    GadutaUnitTable = UNIT:FindAllByMatching("Gaduta%-Shorad")

    GadutaAlive = {}
    GadutaUnitCords = {}

    for i = 1, #GdutaStaticTable do
        table.insert(GadutaAlive, GdutaStaticTable[i]:GetName())
    end

    for i = 1, #GadutaUnitTable do
        table.insert(GadutaAlive, GadutaUnitTable[i]:GetName())
        table.insert(GadutaUnitCords, GadutaUnitTable[i]:GetPointVec2())
    end

    GadutaStatic = GdutaStaticTable[1]
    GadutaStatic:HandleEvent(EVENTS.Dead)

    function RespawnGaduta()
        -- respawn statics
        for i = 1, #GdutaStaticTable do
            local respawnStatic = GdutaStaticTable[i]
            respawnStatic:ReSpawn()
        end

        -- Remove tank wrecks DSC function
        local gadutaZone = trigger.misc.getZone("Gaduta Zone")
        gadutaZone.point.y = land.getHeight({x = gadutaZone.point.x, y = gadutaZone.point.z})
        local volume = {
            id = world.VolumeType.SPHERE,
            params = {
                point = gadutaZone.point,
                radius = gadutaZone.radius
            }
        }
        world.removeJunk(volume)

        -- respawn units
        for i = 1, #GadutaUnitTable do
            local respawnUnit = GadutaUnitTable[i]
            respawnUnit:ReSpawnAt(GadutaUnitCords[i], 0)
        end

        -- handle clearing & updating the tables
        GdutaStaticTable = {}
        GadutaUnitTable = {}
        GadutaAlive = {}

        GdutaStaticTable = STATIC:FindAllByMatching("Gaduta%-Static")
        GadutaUnitTable = UNIT:FindAllByMatching("Gaduta%-Shorad")

        for i = 1, #GdutaStaticTable do
            table.insert(GadutaAlive, GdutaStaticTable[i]:GetName())
        end

        for i = 1, #GadutaUnitTable do
            table.insert(GadutaAlive, GadutaUnitTable[i]:GetName())
        end

        MESSAGE:New("Gaduta Respawn", 25, "Info"):ToAll()
    end

    function InstructorKillGaduta()
        for i = 1, #GdutaStaticTable do
            local static = GdutaStaticTable[i]
            static:Destroy(false)
        end

        for i = 1, #GadutaUnitTable do
            local unit = GadutaUnitTable[i]
            unit:Destroy(false)
        end
        
        MESSAGE:New("Units at Gaduta destroyed", 25, "Info"):ToAll()
    end

    function InstructorRespawnGaduta()
        InstructorKillGaduta()
        local instructorTimer = SCHEDULER:New()
        instructorTimer:Schedule(instructorTimer, RespawnGaduta, {}, 10) -- Timer in seconds
    end
end

GadutaUnits()

-- Gaduta Instructor Commands
local destroyGaduta = MENU_MISSION_COMMAND:New("Destroy Gaduta", Instructor, InstructorKillGaduta)
local destroyGaduta = MENU_MISSION_COMMAND:New("Respawn Gaduta", Instructor, InstructorRespawnGaduta)

function GadutaStatic:OnEventDead(EventData)
    -- chek for dublicate calls by cheking if unit killed is nill
    if EventData.IniDCSUnit == nil then
        MESSAGE:New("misfire\n if you see this message something whent wrong with the respawn function", 25, "Info"):ToAll()
        return
    end

    local deadUnit = EventData.IniDCSUnitName

    -- chek if unit killed is part of gaduta statics
    for iterator = 1, #GadutaAlive do
        if deadUnit == GadutaAlive[iterator] then
            table.remove(GadutaAlive, iterator)
        end

        if #GadutaAlive == 0 then
            MESSAGE:New("All units in Gaduta are dead.\n Respawn in 10 min", 25, "Info"):ToAll()

            local respawnTimer = SCHEDULER:New()
            respawnTimer:Schedule(respawnTimer, RespawnGaduta, {}, 600) -- Timer in seconds
        end
    end
end