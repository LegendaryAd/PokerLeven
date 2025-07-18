local goalkeeper = {
    object_type = "Blind",
    name = "ina-goalkeeper",
    key = "goalkeeper",
    pos = { x = 0, y = 5 },
    boss = {
        min = 3,
        max = 10,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("ffa726") ,
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled
            and card.config.center.pposition == "GK" then
            return true
        end
        return false
    end,
}

local forward = {
    object_type = "Blind",
    name = "ina-forward",
    key = "forward",
    pos = { x = 0, y = 2 },
    boss = {
        min = 3,
        max = 10,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("ef5350") ,
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled
            and card.config.center.pposition == "GK" then
            return true
        end
        return false
    end,
}

local defense = {
    object_type = "Blind",
    name = "ina-defense",
    key = "defense",
    pos = { x = 0, y = 4 },
    boss = {
        min = 3,
        max = 10,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("66bb6a")  ,
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled
            and card.config.center.pposition == "MF" then
            return true
        end
        return false
    end,
}

local midfielder = {
    object_type = "Blind",
    name = "ina-midfielder",
    key = "midfielder",
    pos = { x = 0, y = 3 },
    boss = {
        min = 3,
        max = 10,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("4fc3f7") ,
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled
            and card.config.center.pposition == "DF" then
            return true
        end
        return false
    end,
}

local fire = {
    object_type = "Blind",
    name = "ina-fire",
    key = "fire",
    pos = { x = 0, y = 6 },
    boss = {
        min = 3,
        max = 10,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("d32f2f")  ,
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled
            and card.config.center.ptype == "Fire" then
            return true
        end
        return false
    end,
}

local mountain = {
    object_type = "Blind",
    name = "ina-mountain",
    key = "mountain",
    pos = { x = 0, y = 9 },
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
}

local wind = {
    object_type = "Blind",
    name = "ina-wind",
    key = "wind",
    pos = { x = 0, y = 7 },
    boss = {
        min = 3,
        max = 10,
    },
    discovered = true,
    mult = 2,
    atlas = "bossBlinds",
    order = 1,
    boss_colour = HEX("81d4fa") ,
    recalc_debuff = function(self, card, from_blind)
        if (card.area == G.jokers) and not G.GAME.blind.disabled
            and card.config.center.ptype == "Wind" then
            return true
        end
        return false
    end,
}

local forest = {
    object_type = "Blind",
    name = "ina-forest",
    key = "forest",
    pos = { x = 0, y = 8 },
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
}

return {
    name = "Boss Blinds",
    list = {goalkeeper, forward, defense, midfielder, fire, mountain, wind, forest}
}
