local bombTargets = {"Kobuleti-Range-Center", "Kobuleti-Range-NW", "Kobuleti-Range-NE", "Kobuleti-Range-SW", "Kobuleti-Range-SE"}
local strafeTargets = {"Kobuleti-Range-Strafe-1", "Kobuleti-Range-Strafe-2"}
local KobuletiRangeZone = ZONE:FindByName("Kobuleti-Range-Zone")

SenakiRange=RANGE:New("Senaki Range") 

SenakiRange:SetRangeZone(KobuletiRangeZone)
SenakiRange:SetRangeCeiling(20000) -- 20 000ft / GND
SenakiRange:EnableRangeCeiling(true)

SenakiRange:AddBombingTargets(bombTargets, 6)

SenakiRange:AddStrafePit(strafeTargets, 3000, 300, 90, false, 6, 600)

SenakiRange:Start()