-- North CAP

local northWinG = EASYGCICAP:New("Read North CAP Operations", AIRBASE.Caucasus.Maykop_Khanskaya, "red", "Read-EWR")

northWinG:AddPatrolPointCAP(AIRBASE.Caucasus.Maykop_Khanskaya, ZONE:FindByName("Read-North-Zone"):GetCoordinate(),30000,400,100,20)

northWinG:AddSquadron("Red-North-CAP", "1st SQN North", AIRBASE.Caucasus.Maykop_Khanskaya, 20, AI.Skill.VETERAN, 102) -- Fox 1 Mig-29
northWinG:AddSquadron("Red-North-CAP-1", "4th SQN North", AIRBASE.Caucasus.Maykop_Khanskaya, 20, AI.Skill.VETERAN, 202) -- Fox 3 Mig-29
northWinG:AddSquadron("Red-North-CAP-2", "1st Jef SQN North", AIRBASE.Caucasus.Maykop_Khanskaya, 20, AI.Skill.VETERAN, 202) -- Fox 3 Jef
northWinG:AddSquadron("Red-North-CAP-3", "1st Su-33 SQN North", AIRBASE.Caucasus.Maykop_Khanskaya, 20, AI.Skill.VETERAN, 202) -- Fox 1 SU-33

northWinG:AddAcceptZone(ZONE:New("Red-Border-North"))

-- Center CAP
local cneterWing = EASYGCICAP:New("Center CAP Operations", AIRBASE.Caucasus.Mineralnye_Vody, "red", "Read-EWR")

cneterWing:AddPatrolPointCAP(AIRBASE.Caucasus.Mineralnye_Vody, ZONE:FindByName("Red-Center-Point"):GetCoordinate(),30000,400,100,20)

cneterWing:AddSquadron("Red-Center-CAP", "2nd SQN Center", AIRBASE.Caucasus.Mineralnye_Vody, 20, AI.Skill.VETERAN, 302) -- Fox 1 MIG-29
cneterWing:AddSquadron("Red-Center-CAP-1", "1st F1 SQN Center", AIRBASE.Caucasus.Mineralnye_Vody, 20, AI.Skill.VETERAN, 302) -- Mirage F-1EE
cneterWing:AddSquadron("Red-Center-CAP-2", "2nd 27 SQN Center", AIRBASE.Caucasus.Mineralnye_Vody, 20, AI.Skill.VETERAN, 302) -- Fox 1 Mig-27
cneterWing:AddSquadron("Red-Center-CAP-3", "1st 23 SQN Center", AIRBASE.Caucasus.Mineralnye_Vody, 20, AI.Skill.VETERAN, 302) -- Fox 1 Mig-23

cneterWing:AddAcceptZone(ZONE:New("Red-Border-Center"))

-- South CAP
local southWing = EASYGCICAP:New("South CAP Operations", AIRBASE.Caucasus.Mozdok, "red", "Read-EWR")

southWing:AddPatrolPointCAP(AIRBASE.Caucasus.Mozdok, ZONE:FindByName("Red-South-Point"):GetCoordinate(),30000,400,100,20)

southWing:AddSquadron("Red-South-CAP", "3th SQN Center", AIRBASE.Caucasus.Mozdok, 20, AI.Skill.VETERAN, 402) -- Mig-29
southWing:AddSquadron("Red-South-CAP-1", "1st 21 SQN Center", AIRBASE.Caucasus.Mozdok, 20, AI.Skill.VETERAN, 402) -- Mig-21
southWing:AddSquadron("Red-South-CAP-2", "2nd F1 SQN Center", AIRBASE.Caucasus.Mozdok, 20, AI.Skill.VETERAN, 402) -- Mirage F-1EE
southWing:AddSquadron("Red-South-CAP-3", "2nd 23 SQN Center", AIRBASE.Caucasus.Mozdok, 20, AI.Skill.VETERAN, 402) -- Mig-23

southWing:AddAcceptZone(ZONE:New("Red-Border-South"))