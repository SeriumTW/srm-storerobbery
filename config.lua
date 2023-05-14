Config = {}

-- Minimum number of police required to start a robbery
Config.MinPoliceOnline = 0

-- Robbery locations
Config.RobberyLocations = {
    [1] = {x = 28.2475, y = -1339.1381, z = 29.4970}, -- Add coordinates for the first market
    [2] = {x = -1478.9020, y = -375.4460, z = 39.1634}, -- Add coordinates for the second market
    [3] = {x = -1220.8569, y = -916.0602, z = 11.3263}, -- Add coordinates for the third market
    [4] = {x = 378.2206, y = 333.4324, z = 103.5664}, -- Add coordinates for the fourth market
    [5] = {x = -1829.2047, y = 798.7383, z = 138.1917}, -- Add coordinates for the fifth market
    [6] = {x = -709.7437, y = -904.1607, z = 19.2156},
    [7] = {x = 1126.8210, y = -980.1567, z = 45.4158},
    [8] = {x = 1159.4482, y = -314.0132, z = 69.2051},
    [9] = {x = 378.2085, y = 333.4318, z = 103.5664},
    [10] = {x = -43.4770, y = -1748.3708, z = 29.4210},
    
    -- Add additional locations here
}

-- Rewards obtained by players after the robbery
Config.Rewards = {
    {item = "ssd16tb", min = 1, max = 3, chance = 100},
    -- {item = "goldchain", min = 1, max = 5, chance = 50},
    -- {item = "watch", min = 1, max = 3, chance = 30}
}

-- Robbery cooldown duration in seconds
Config.RobberyCooldown = 1800 -- 30 minutes in seconds
Config.MaxRobberyDistance = 25
-- Robbery duration in seconds
Config.RobberyDuration = 180 -- 2 minutes in seconds