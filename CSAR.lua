local my_csar = CSAR:New(coalition.side.BLUE,"Downed Pilot","Luftrettung")

my_csar.immortalcrew = true -- downed pilot spawn is immortal
my_csar.invisiblecrew = false -- downed pilot spawn is visible
my_csar.FARPRescueDistance = 100
my_csar.extractDistance = 50
my_csar.loadDistance = 20
my_csar.useprefix = false
my_csar.AllowIRStrobe = true
-- start the FSM
my_csar:Start()

local function spawnCSARfnc() 
    my_csar:SpawnCSARAtZone( "CSAR_Start_1", coalition.side.BLUE, "Sparrow", true )
end

local SpawnCSAR = MENU_MISSION_COMMAND:New("Spawn CSAR", SpawnMenu, spawnCSARfnc)