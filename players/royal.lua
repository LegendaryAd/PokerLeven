-- King
local King = {
    name = "King",
    pos = {x = 4, y = 1},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2,
    cost = 5,
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "GK",
    pteam = "Royal Academy",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Implement Power Shield logic
    end,
}

-- Bloom
local Bloom = {
    name = "Bloom",
    pos = {x = 5, y = 1},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    cost = 3,
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "MF",
    pteam = "Royal Academy",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end,
}

-- Drent
local Drent = {
    name = "Drent",
    pos = {x = 6, y = 1},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    cost = 3,
    atlas = "Jokers01",
    ptype = "Mountain",
    pposition = "DF",
    pteam = "Royal Academy",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end,
}

-- Jude
local Jude = {
    name = "Jude",
    pos = {x = 7, y = 1},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 3,
    cost = 7,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "MF",
    pteam = "Royal Academy",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end,
}

-- Martin
local Martin = {
    name = "Martin",
    pos = {x = 8, y = 1},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2,
    cost = 5,
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "DF",
    pteam = "Royal Academy",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end,
}

-- Master
local Master = {
    name = "Master",
    pos = {x = 9, y = 1},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    cost = 3,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "MF",
    pteam = "Royal Academy",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end,
}

-- Samford
local Samford = {
    name = "Samford",
    pos = {x = 10, y = 1},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2,
    cost = 5,
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "FW",
    pteam = "Royal Academy",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end,
}

-- Swing
local Swing = {
    name = "Swing",
    pos = {x = 11, y = 1},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2,
    cost = 5,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "MF",
    pteam = "Royal Academy",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end,
}

return {
    name = "Royal Academy",
    list = {King, Bloom, Drent, Jude, Martin, Master, Samford, Swing},
}
