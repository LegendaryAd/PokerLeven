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
        if context.individual and context.other_card and G.GAME.current_round.hands_played == 0
            and context.cardarea == G.play and context.scoring_hand
            and next(context.poker_hands["Pair"]) and #context.scoring_hand == 2 then
            convert_cards_to(context.other_card, {
                mod_conv = "m_gold"
            }, false, false)
            return {
                message = localize("ina_convert"),
                colour = G.C.XMULT,
                card = context.other_card,
            }
        end
    end

})

local Damian = J({
    name = "Damian",
    pos = { x = 3, y = 5 },
    config = { extra = { chips_mod = 7, current_chips = 0, triggered = false } },
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)

        return { vars = { center.ability.extra.chips_mod, center.ability.extra.current_chips } }
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
        if context.ending_shop then
            card.ability.extra.triggered = true
            local count = #find_player_type("Fire")

            if count > 0 then
                card.ability.extra.current_chips = card.ability.extra.current_chips +
                    card.ability.extra.chips_mod * count
            end
            return {
                message = localize("k_upgrade_ex"),
                colour = G.C.CHIPS,
            }
        end

        if context.scoring_hand and context.cardarea == G.jokers and context.joker_main then
            if card.ability.extra.current_chips > 0 then
                return {
                    message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.current_chips } },
                    colour = G.C.CHIPS,
                    chip_mod = card.ability.extra.current_chips
                }
            end
        end
    end,
})

local Nashmith = J({
    name = "Nashmith",
    pos = { x = 2, y = 5 },
    config = { extra = { chip_mod = 10 } },
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return { vars = { center.ability.extra.chip_mod, 0 } }
    end,
    rarity = 1,
    pools = { ["Kirkwood"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "MF",
    pteam = "Kirkwood",
    blueprint_compat = true,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card then
            if context.other_card:is_suit("Spades") then
                local forest_count = #find_player_type("Forest") or 0
                local extra_chips = card.ability.extra.chip_mod * forest_count

                if extra_chips > 0 then
                    return {
                        message = "+" .. extra_chips .. " Chips",
                        chip_mod = extra_chips,
                        colour = G.C.CHIPS,
                    }
                end
            end
        end
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
