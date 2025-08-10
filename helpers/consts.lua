C = {}

C.ALL_TYPES = { "Wind", "Fire", "Forest", "Mountain" }
C.Wind = C.ALL_TYPES[1]
C.Fire = C.ALL_TYPES[2]
C.Forest = C.ALL_TYPES[3]
C.Mountain = C.ALL_TYPES[4]

C.ALL_POSITIONS = { "FW", "MF", "DF", "GK" }
C.FW = C.ALL_POSITIONS[1]
C.MF = C.ALL_POSITIONS[2]
C.DF = C.ALL_POSITIONS[3]
C.GK = C.ALL_POSITIONS[4]

C.TRAINING = "Training"
C.STRAT = "Strat"

C.INA_UPGRADE_TECHNIQUE_KEY = "c_ina_upgrade_technique_"

C.UPGRADES = { "plus", "number", "grade" }
C.UPGRADES.Plus = C.UPGRADES[1]
C.UPGRADES.Number = C.UPGRADES[2]
C.UPGRADES.Grade = C.UPGRADES[3]

--- For specific jokers
C.CUSTOM = {}
C.CUSTOM.Bobby_Teams = {
    ["Royal Academy"]  = { x = 3, y = 14 },
    ["Occult"]         = { x = 7, y = 14 },
    ["Wild"]           = { x = 8, y = 14 },
    ["Brain"]          = { x = 9, y = 14 },
    ["Otaku"]          = { x = 10, y = 14 },
    ["Inazuma Eleven"] = { x = 11, y = 14 },
    ["Shuriken"]       = { x = 12, y = 14 },
    ["Farm"]           = { x = 0, y = 15 },
    ["Kirkwood"]       = { x = 1, y = 15 },
    ["Zeus"]           = { x = 2, y = 15 }
}

local team_number = 0
for _ in pairs(C.CUSTOM.Bobby_Teams) do
    team_number = team_number + 1
end
C.CUSTOM.Bobby_Teams_Number = team_number
