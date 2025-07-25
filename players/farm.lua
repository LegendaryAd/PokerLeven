-- Farm Jokers
local greeny = J({
    name = "Greeny",
    pos = { x = 0, y = 4 },
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

local hayseed = J({
    name = "Hayseed",
    pos = { x = 1, y = 4 },
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

local sherman = J({
    name = "Sherman",
    pos = { x = 2, y = 4 },
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

local spray = J({
    name = "Spray",
    pos = { x = 3, y = 4 },
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

local dawson = J({
    name = "Dawson",
    pos = { x = 4, y = 4 },
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

local muffs = J({
    name = "Muffs",
    pos = { x = 5, y = 4 },
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

local hillvalley = J({
    name = "Hillvalley",
    pos = { x = 6, y = 4 },
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
    list = { greeny, hayseed, sherman, spray, dawson, muffs, hillvalley },
}
