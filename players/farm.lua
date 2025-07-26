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
})


local Hayseed = J({
    name = "Hayseed",
    pos = { x = 11, y = 4 },
    config = {
        extra = {
            current_mult = 0,
            mult_mod = 2
        }
    },
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return { vars = { center.ability.extra.current_mult or 0 } }
    end,
    rarity = 1,
    pools = { ["Farm"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Mountain",
    pposition = "DF",
    pteam = "Farm",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.scoring_hand and context.joker_main
            and card.ability.extra.current_mult > 0 then
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.current_mult } },
                mult_mod = card.ability.extra.current_mult,
                colour = G.C.MULT
            }
        end
        if context.before and context.cardarea == G.jokers and context.scoring_hand
            and next(context.poker_hands["Three of a Kind"]) and #context.scoring_hand == 3 then
            card.ability.extra.current_mult = card.ability.extra.current_mult + card.ability.extra.mult_mod
            return {
                message = localize("k_upgrade_ex"),
                colour = G.C.MULT
            }
        end
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
