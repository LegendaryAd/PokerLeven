local Neville = J({
    name = "Neville",
    pos = { x = 1, y = 5 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Kirkwood"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "GK",
    pteam = "Kirkwood",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- Add logic
    end,
})

local Night = J({
    name = "Night",
    pos = { x = 4, y = 5 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 3, -- Rare
    pools = { ["Kirkwood"] = true },
    cost = 12,
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "DF",
    pteam = "Kirkwood",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- If you have 2 jokers that are DF, put the red seal on your first card
    end,
})

local Marvin = J({
    name = "Marvin",
    pos = { x = 5, y = 5 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    pools = { ["Kirkwood"] = true },
    cost = 10,
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "FW",
    pteam = "Kirkwood",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- Add logic
    end,
})

local Thomas = J({
    name = "Thomas",
    pos = { x = 6, y = 5 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    pools = { ["Kirkwood"] = true },
    cost = 10,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "FW",
    pteam = "Kirkwood",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- Add logic
    end,
})

local Tyler = J({
    name = "Tyler",
    pos = { x = 7, y = 5 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    pools = { ["Kirkwood"] = true },
    cost = 10,
    atlas = "Jokers01",
    ptype = "Mountain",
    pposition = "FW",
    pteam = "Kirkwood",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- Add logic
    end,
})

local Damian = J({
    name = "Damian",
    pos = { x = 3, y = 5 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Kirkwood"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "MF",
    pteam = "Kirkwood",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- Add logic
    end,
})

local Nashmith = J({
    name = "Nashmith",
    pos = { x = 2, y = 5 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Kirkwood"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "MF",
    pteam = "Kirkwood",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- Add logic
    end,
})

return {
    name = "Kirkwood",
    list = { Neville, Night, Marvin, Thomas, Tyler, Damian, Nashmith }
}
