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
    
    GadutaAlive = {table.unpack(GdutaStaticTable)}

    MESSAGE:New(tostring(#GadutaAlive), 25, "Info"):ToAll()
    
    for i = 1, #GdutaStaticTable do
        Static = GdutaStaticTable[i]
        Static:HandleEvent(EVENTS.Dead)
    end

    function Static:OnEventDead(EventData)
        for i = 1, #GadutaAlive do
            if GadutaAlive[i]:IsAlive() == false then
                table.remove(GadutaAlive, i)
            
                if #GadutaAlive == 0 then
                    MESSAGE:New("All Units Dead", 25, "Info"):ToAll()
                    MESSAGE:New(tostring(#GdutaStaticTable), 25, "Info"):ToAll()
                    RespawnStatics()
                end
            end
        end
    end

end

function RespawnStatics()
    for i = 1, #GdutaStaticTable do
        local respawnStatic = GdutaStaticTable[i]:GetDCSObject()
        MESSAGE:New(tostring(respawnStatic), 25, "Info"):ToAll()
        respawnStatic:ReSpawn()
    end

    --GdutaStaticTable = {}
   -- GadutaAlive = {}
    --GadutaStatics()
end

GadutaStatics()