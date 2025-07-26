local goalkeeper = {
    object_type = "Blind",
    name = "ina-goalkeeper",
    key = "goalkeeper",
    pos = { x = 0, y = 3 },
    boss = {
        min = 3,
        max = 10,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("ffa726"),
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled
            and card.config.center.pposition == "GK" then
            return true
        end
        return false
    end,
    ina_credits = {
        art = { "Shadorossa" }
    }
}

local forward = {
    object_type = "Blind",
    name = "ina-forward",
    key = "forward",
    pos = { x = 0, y = 0 },
    boss = {
        min = 3,
        max = 10,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("ef5350"),
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled
            and card.config.center.pposition == "GK" then
            return true
        end
        return false
    end,
    ina_credits = {
        art = { "Shadorossa" }
    }
}

local defense = {
    object_type = "Blind",
    name = "ina-defense",
    key = "defense",
    pos = { x = 0, y = 2 },
    boss = {
        min = 3,
        max = 10,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("66bb6a"),
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled
            and card.config.center.pposition == "MF" then
            return true
        end
        return false
    end,
    ina_credits = {
        art = { "Shadorossa" }
    }
}

local midfielder = {
    object_type = "Blind",
    name = "ina-midfielder",
    key = "midfielder",
    pos = { x = 0, y = 1 },
    boss = {
        min = 3,
        max = 10,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("4fc3f7"),
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled
            and card.config.center.pposition == "DF" then
            return true
        end
        return false
    end,
    ina_credits = {
        art = { "Shadorossa" }
    }
}

local fire = {
    object_type = "Blind",
    name = "ina-fire",
    key = "fire",
    pos = { x = 0, y = 4 },
    boss = {
        min = 3,
        max = 10,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("d32f2f"),
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled
            and card.config.center.ptype == "Fire" then
            return true
        end
        return false
    end,
    ina_credits = {
        art = { "Shadorossa" }
    }
}

local mountain = {
    object_type = "Blind",
    name = "ina-mountain",
    key = "mountain",
    pos = { x = 0, y = 7 },
    boss = {
        min = 3,
        max = 10,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("f57c00"),
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled
            and card.config.center.ptype == "Mountain" then
            return true
        end
        return false
    end,
    ina_credits = {
        art = { "Shadorossa" }
    }
}

local wind = {
    object_type = "Blind",
    name = "ina-wind",
    key = "wind",
    pos = { x = 0, y = 5 },
    boss = {
        min = 3,
        max = 10,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("81d4fa"),
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled
            and card.config.center.ptype == "Wind" then
            return true
        end
        return false
    end,
    ina_credits = {
        art = { "Shadorossa" }
    }
}

local forest = {
    object_type = "Blind",
    name = "ina-forest",
    key = "forest",
    pos = { x = 0, y = 6 },
    boss = {
        min = 3,
        max = 10,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("2e7d32"),
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled
            and card.config.center.ptype == "Forest" then
            return true
        end
        return false
    end,
    ina_credits = {
        art = { "Shadorossa" }
    }
}

local inazuma_og = {
    object_type = "Blind",
    name = "ina-inazuma-og",
    key = "inazuma_og",
    pos = { x = 0, y = 8 },
    boss = {
        min = 10000,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("2e7d32"),
}

local royal_blind = {
    object_type = "Blind",
    name = "ina-royal_blind",
    key = "royal_blind",
    pos = { x = 0, y = 9 },
    boss = {
        min = 10000,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("2e7d32"),
}

local wild = {
    object_type = "Blind",
    name = "ina-wild",
    key = "wild",
    pos = { x = 0, y = 10 },
    boss = {
        min = 10000,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("797B49"),
}

local brain = {
    object_type = "Blind",
    name = "ina-brain",
    key = "brain",
    pos = { x = 0, y = 11 },
    boss = {
        min = 10000,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("888888"),
}

local otaku = {
    object_type = "Blind",
    name = "ina-otaku",
    key = "otaku",
    pos = { x = 0, y = 12 },
    boss = {
        min = 10000,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("A754C4"),
}

local shuriken = {
    object_type = "Blind",
    name = "ina-shuriken",
    key = "shuriken",
    pos = { x = 0, y = 13 },
    boss = {
        min = 10000,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("4B0082"),
}

local farm = {
    object_type = "Blind",
    name = "ina-farm",
    key = "farm",
    pos = { x = 0, y = 14 },
    boss = {
        min = 10000,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("7AC943"),
}

local kirkwood = {
    object_type = "Blind",
    name = "ina-kirkwood",
    key = "kirkwood",
    pos = { x = 0, y = 15 },
    boss = {
        min = 10000,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("2e7d32"),
}

local zeus = {
    object_type = "Blind",
    name = "ina-zeus",
    key = "zeus",
    pos = { x = 0, y = 0 },
    boss = {
        min = 10000,
    },
    discovered = true,
    mult = 2,
    atlas = "finalBossBlinds",
    order = 1,
    boss_colour = HEX("2e7d32"),
}

return {
    name = "Boss Blinds",
    list = { goalkeeper, forward, defense,
        midfielder, fire, mountain, wind,
        forest, inazuma_og, royal_blind, wild,
        brain, otaku, shuriken, farm,
        kirkwood, zeus }
}
