
Config = {}

Config.UpdateFrequency = 3600 
Config.DeleteStats = true 

Config.MmbershipCardPrice = 150

-- Config.Skills = {
--     ["Stamina"] = { 
--         ["Current"] = 20, ["RemoveAmount"] = -0.3, ["Stat"] = "MP0_STAMINA" 
--     },

--     ["Guc"] = {
--         ["Current"] = 10, ["RemoveAmount"] = -0.3, ["Stat"] = "MP0_STRENGTH"
--     },

--     ["Yuzme"] = {
--         ["Current"] = 0, ["RemoveAmount"] = -0.3, ["Stat"] = "MP0_LUNG_CAPACITY"
--     },

--     ["Atis"] = {
--         ["Current"] = 0, ["RemoveAmount"] = -0.1,["Stat"] = "MP0_SHOOTING_ABILITY"
--     },

--     ["Surus"] = {
--         ["Current"] = 0, ["RemoveAmount"] = -0.5, ["Stat"] = "MP0_DRIVING_ABILITY"
--     },

    -- ["Raise front wheel"] = {
    --     ["Current"] = 0, ["RemoveAmount"] = -0.2, ["Stat"] = "MP0_WHEELIE_ABILITY"
    -- }
--}

Config.Locations = {
    [1] = {--pull-ups
        coords = vector3(-1200.02, -1571.18, 4.61), heading = 215.53,
        animation = "prop_human_muscle_chin_ups", skill = "Stamina", SkillAddQuantity = 1,
        Text3D = "Barfiks", viewDistance = 2.5,
    },
    [2] = {--arms
        coords = vector3(-1202.9837, -1565.1718, 4.63115), heading = 212.78,
        animation = "world_human_muscle_free_weights", skill = "Guc", SkillAddQuantity = 1,
        Text3D = "Ağırlık Kaldır", viewDistance = 2.5,
    },
    [3] = {--pushup
        coords = vector3(-1203.3242, -1570.6184, 4.631155), heading = 212.78,
        animation = "world_human_push_ups", skill = "Guc", SkillAddQuantity = 1,
        Text3D = "Şınav", viewDistance = 2.5,
    },
    [4] = {--yoga
        coords = vector3(-1204.7958, -1560.1906, 4.63115), heading = 212.78,
        animation = "world_human_yoga", skill = "Stamina", SkillAddQuantity = 1,
        Text3D = "Yoga", viewDistance = 2.5,
    },
    [5] = {--yoga
        coords = vector3(-1221.04, -1545.01, 4.69), heading = 212.78,
        animation = "world_human_yoga", skill = "Stamina", SkillAddQuantity = 1,
        Text3D = "Yoga", viewDistance = 3.5,
    },
    [6] = {--yoga
        coords = vector3(-1217.09, -1543.43, 4.72), heading = 212.78,
        animation = "world_human_yoga", skill = "Stamina", SkillAddQuantity = 1,
        Text3D = "Yoga", viewDistance = 3.5,
    },
}
