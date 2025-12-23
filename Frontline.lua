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


-- Gaduta Statics
function GadutaStatics()
    GdutaStaticTable = STATIC:FindAllByMatching("Gaduta%-Static")

    GadutaAlive = {}

    for i = 1, #GdutaStaticTable do
        table.insert(GadutaAlive, GdutaStaticTable[i]:GetName())
    end

    GadutaStatic = GdutaStaticTable[1]
    GadutaStatic:HandleEvent(EVENTS.Dead)

    function RespawnStatics()
        for i = 1, #GdutaStaticTable do
            local respawnStatic = GdutaStaticTable[i]
            respawnStatic:ReSpawn()
        end

        GdutaStaticTable = {}
        GadutaAlive = {}

        GdutaStaticTable = STATIC:FindAllByMatching("Gaduta%-Static")

        for i = 1, #GdutaStaticTable do
            table.insert(GadutaAlive, GdutaStaticTable[i]:GetName())
        end

        MESSAGE:New("Respawn", 25, "Info"):ToAll()
    end

end

GadutaStatics()

function GadutaStatic:OnEventDead(EventData)
    -- chek for dublicate calls by cheking if unit killed is nill
    if EventData.IniDCSUnit == nil then
        MESSAGE:New("misfire", 25, "Info"):ToAll()
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
            respawnTimer:Schedule(respawnTimer, RespawnStatics, {}, 600) -- Timer in seconds
        end
    end
end