Frontline = {ZONE:New("front-zone")}

FrontlineTemplates = {"Front-Section-1", "Front-Section-2", "Front-Section-3", "Front-Section-4"}
FrontBacklineTemplates = {"Front-AAA-1", "Front-AAA-2", "Front-AAA-3"}

local frontlineUnits = SPAWN:New("Front-Section-1")
    :InitLimit(28,0)
    :InitRandomizeTemplatePrefixes( FrontlineTemplates )
    :InitRandomizeZones(Frontline)
    :InitValidateAndRepositionGroundUnits(true, 30, 10)
    :SpawnScheduled(15, 5)   

local forntBackLineUnits = SPAWN:New("Front-AAA-1")
    :InitLimit(4,0)
    :InitRandomizeTemplatePrefixes( FrontBacklineTemplates )
    :InitRandomizeZones(Frontline)
    :InitValidateAndRepositionGroundUnits(true, 30, 10)
    :SpawnScheduled(15, 5)  