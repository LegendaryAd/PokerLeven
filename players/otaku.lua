-- Otaku
local Idol = {
    name = "Idol",
    pos = {x = 2, y = 3},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    cost = 3,
    atlas = "Jokers01",
    ptype = "Mountain",
    pposition = "GK",
    pteam = "Otaku",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

local Hero = {
    name = "Hero",
    pos = {x = 3, y = 3},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    cost = 3,
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "MF",
    pteam = "Otaku",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

local Custom = {
    name = "Custom",
    pos = {x = 4, y = 3},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    cost = 3,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "FW",
    pteam = "Otaku",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

local Robot = {
    name = "Robot",
    pos = {x = 5, y = 3},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    cost = 4,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "MF",
    pteam = "Otaku",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

local Gamer = {
    name = "Gamer",
    pos = {x = 6, y = 3},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    cost = 4,
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "FW",
    pteam = "Otaku",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

local Artist = {
    name = "Artist",
    pos = {x = 0, y = 3},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 3, -- Rare
    cost = 7,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "FW",
    pteam = "Otaku",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

local Arcade = {
    name = "Arcade",
    pos = {x = 1, y = 3},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    cost = 4,
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "FW",
    pteam = "Otaku",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

return{
    name="Otaku",
    list ={Idol, Hero, Custom, Robot, Gamer, Artist, Arcade}
}