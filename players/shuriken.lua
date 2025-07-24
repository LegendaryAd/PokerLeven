-- Shuriken Jokers
local hood = J({
    name = "Hood",
    pos = { x = 0, y = 4 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    pools = { ["Shuriken"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "GK",
    pteam = "Shuriken",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- Add logic
    end,

})

local hillfort = J({
    name = "Hillfort",
    pos = { x = 1, y = 4 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Shuriken"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "DF",
    pteam = "Shuriken",
    blueprint_compat = true,
    calculate = function(self, card, context)
        --Add logic
    end,
})

local code = J({
    name = "Code",
    pos = { x = 2, y = 4 },
    config = {},
    rarity = 2, -- Uncommon
    pools = { ["Shuriken"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Mountain",
    pposition = "MF",
    pteam = "Shuriken",
    blueprint_compat = true,
    calculate = function(self, card, context)
        --Add logic
    end,
})

local star = J({
    name = "Star",
    pos = { x = 3, y = 4 },
    config = { extra = { mult_mod = 1, money = 1, suit = "Diamonds", triggered = false } },
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return { vars = { center.ability.extra.money, center.ability.extra.mult_mod } }
    end,
    rarity = 1, -- Common
    pools = { ["Shuriken"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "MF",
    pteam = "Shuriken",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
            if context.scoring_hand then
                card.ability.extra.triggered = true
                return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_mod } },
                    colour = G.C.MULT,
                    mult_mod = card.ability.extra.mult_mod,
                    dollars = card.ability.extra.money,
                    card = card
                }
            end
        end
    end,
})

local cleats = J({
    name = "Cleats",
    pos = { x = 4, y = 4 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Shuriken"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "MF",
    pteam = "Shuriken",
    blueprint_compat = true,
    calculate = function(self, card, context)
        --Add logic
    end,
})

local hattori = J({
    name = "Hattori",
    pos = { x = 5, y = 4 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    pools = { ["Shuriken"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "MF",
    pteam = "Shuriken",
    blueprint_compat = true,
    calculate = function(self, card, context)
        --Add logic
    end,
})

local cloack = J({
    name = "Cloack",
    pos = { x = 6, y = 4 },
    config = {},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 3, -- Rare
    pools = { ["Shuriken"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "FW",
    pteam = "Shuriken",
    blueprint_compat = true,
    calculate = function(self, card, context)
        --Add logic
    end,
})

return {
    name = "Shuriken",
    list = { hood, hillfort, code, star, cleats, hattori, cloack },
}
