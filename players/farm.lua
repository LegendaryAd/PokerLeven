-- Farm Jokers
local Greeny = J({
    name = "Greeny",
    pos = { x = 0, y = 5 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Farm"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "GK",
    pteam = "Farm",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- Add logic
    end,
})

local Hayseed = J({
    name = "Hayseed",
    pos = { x = 11, y = 4 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Farm"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Mountain",
    pposition = "DF",
    pteam = "Farm",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- Add logic
    end,
})

local Sherman = J({
    name = "Sherman",
    pos = { x = 12, y = 4 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Farm"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "DF",
    pteam = "Farm",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- Add logic
    end,
})

local Spray = J({
    name = "Spray",
    pos = { x = 8, y = 4 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    pools = { ["Farm"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "MF",
    pteam = "Farm",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- Add logic
    end,
})

local Dawson = J({
    name = "Dawson",
    pos = { x = 9, y = 4 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    pools = { ["Farm"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "MF",
    pteam = "Farm",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- Add logic
    end,
})

local Muffs = J({
    name = "Muffs",
    pos = { x = 10, y = 4 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    pools = { ["Farm"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "FW",
    pteam = "Farm",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- Add logic
    end,
})

local Hillvalley = J({
    name = "Hillvalley",
    pos = { x = 7, y = 4 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Farm"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Mountain",
    pposition = "DF",
    pteam = "Farm",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- Add logic
    end,
})

return {
    name = "Farm",
    list = { Greeny, Hayseed, Sherman, Spray, Dawson, Muffs, Hillvalley },
}
