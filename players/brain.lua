-- Feldt
local Feldt = {
    name = "Feldt",
    pos = {x = 6, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 3, -- Rare
    cost = 7,
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "GK", -- Goalkeeper
    pteam = "Brain",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

-- Marvel
local Marvel = {
    name = "Marvel",
    pos = {x = 8, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    cost = 3,
    atlas = "Jokers01",
    ptype = "Mountain",
    pposition = "DF", -- Defense
    pteam = "Brain",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

-- Tell
local Tell = {
    name = "Tell",
    pos = {x = 10, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    cost = 4,
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "MF", -- Midfielder
    pteam = "Brain",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

-- Seller
local Seller = {
    name = "Seller",
    pos = {x = 9, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    cost = 3,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "FW", -- Forward
    pteam = "Brain",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

-- Kind
local Kind = {
    name = "Kind",
    pos = {x = 7, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    cost = 4,
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "MF", -- Midfielder
    pteam = "Brain",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

-- Turner
local Turner = {
    name = "Turner",
    pos = {x = 11, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    cost = 4,
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "FW", -- Forward
    pteam = "Brain",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

-- Under
local Under = {
    name = "Under",
    pos = {x = 12, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    cost = 3,
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "GK", -- Goalkeeper
    pteam = "Brain",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

return {
    name = "Brain",
    list = {Feldt, Marvel, Tell, Seller, Kind, Turner, Under},
}