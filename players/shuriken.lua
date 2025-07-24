local hood = J({
    name = "Hood",
    pos = { x = 0, y = 4 },
    config = {
        extra = {
            xmult_per_gk = 0.5,
            triggered = false,
            pposition = "GK"
        }
    },
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        local count = #find_player_position("GK")
        return { vars = { count, count * (center.ability.extra.xmult_per_gk or 0) + 1 } }
    end,
    rarity = 2,
    pools = { ["Shuriken"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = "Forest",
    pteam = "Shuriken",
    blueprint_compat = true,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.scoring_hand and context.joker_main then
            local count = #find_player_position("GK")
            local total_xmult = count * card.ability.extra.xmult_per_gk + 1
            card.ability.extra.triggered = true
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { total_xmult } },
                colour = G.C.XMULT,
                Xmult_mod = total_xmult
            }
        end
    end,
})

local hillfort = J({
    name = "Hillfort",
    pos = { x = 1, y = 4 },
    config = { extra = { triggered = false } },
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return { vars = { calculate_avg_sell_cost("Wind") } }
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
        if context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
            card.ability.extra.triggered = true
            return {
                message = localize { type = 'variable', key = 'a_chips', vars = { calculate_avg_sell_cost("Wind") } },
                colour = G.C.CHIPS,
                chip_mod = calculate_avg_sell_cost("Wind")
            }
        end
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
                    message = localize("ina_dribbling"),
                    colour = G.C.DARK_EDITION,
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
        if context.setting_blind then
            local right_joker = get_right_joker(card)
            if right_joker then
                local selected_joker =
                    get_random_joker_key("Cleats", right_joker.config.center.rarity, nil, nil, nil)
                sendDebugMessage('Selected joker: ' .. selected_joker)
                return {
                    message = ina_evolve(right_joker, selected_joker)
                }
            end
        end
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
