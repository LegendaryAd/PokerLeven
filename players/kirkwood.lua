local Neville = J({
    name = "Neville",
    pos = { x = 1, y = 5 },
    config = { extra = { new_glass_denom = 6 } },
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return { vars = { G.GAME.probabilities.normal, G.GAME.probabilities.new_glass_denom or center.ability.extra.new_glass_denom } }
    end,
    rarity = 1, -- Common
    pools = { ["Kirkwood"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "GK",
    pteam = "Kirkwood",
    blueprint_compat = true,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.probabilities.new_glass_denom = card.ability.extra.new_glass_denom
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.probabilities.new_glass_denom = nil
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
        if context.setting_blind and not context.blueprint then
            local spawn_effect = spawn_random_ina_joker(card, context,
                {
                    ["Common"] = 0.6,
                    ["Uncommon"] = 0.4
                },
                {
                    ["Kirkwood"] = 1,
                }
            )
            spawn_effect.func()
        end
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

local z_triangle = J({
    name = "Z_Triangle",
    pos = { x = 11, y = 6 },
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
    pposition = "FW",
    pteam = "Kirkwood",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- Add logic
    end,
    special = "Technique"
})

return {
    name = "Kirkwood",
    list = { Neville, Night, Marvin, Thomas, Tyler, Damian, Nashmith, z_triangle }
}
