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
    calculate = function(self, card, context)
        -- Add logic
    end,
})

local Hayseed = J({
    name = "Hayseed",
    pos = { x = 11, y = 4 },
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

local Sherman = J({
    name = "Sherman",
    pos = { x = 12, y = 4 },
    config = { extra = { current_chips = 0, chip_mod = 2 } },
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return { vars = { center.ability.extra.chip_mod, center.ability.extra.current_chips } }
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
        if context.post_trigger and context.other_card.ability
            and context.other_card.ability.extra.pteam and context.other_card.ability.extra.pteam == "Farm" then
            card.ability.extra.current_chips =
                card.ability.extra.current_chips + card.ability.extra.chip_mod
            return {
                message = localize("k_upgrade_ex"),
                card = card
            }
        end

        if context.scoring_hand and context.cardarea == G.jokers
            and context.joker_main then
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

local Spray = J({
    name = "Spray",
    pos = { x = 8, y = 4 },
    config = { extra = { current_Xmult = 1, max_money = 4, Xmult_mod = 0.25, triggered = false } },
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return { vars = { center.ability.extra.max_money, center.ability.extra.Xmult_mod, center.ability.extra.current_Xmult } }
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
        if context.setting_blind then
            if to_big(G.GAME.dollars) < to_big(card.ability.extra.max_money) then
                card.ability.extra.current_Xmult = card.ability.extra.current_Xmult + card.ability.extra.Xmult_mod
                card.ability.extra.triggered = true
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            end
        end

        if context.cardarea == G.jokers and context.joker_main and context.scoring_hand and card.ability.extra.current_Xmult > 1 then
            card.ability.extra.triggered = true
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.current_Xmult } },
                colour = G.C.XMULT,
                Xmult_mod = card.ability.extra.current_Xmult
            }
        end
    end,
})

local Dawson = J({
    name = "Dawson",
    pos = { x = 9, y = 4 },
    config = { extra = { max_money = 2, triggered = false } },
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return { vars = { center.ability.extra.max_money } }
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
        if context.cardarea == G.jokers and context.joker_main and to_big(G.GAME.dollars) < to_big(card.ability.extra.max_money)
            and #context.full_hand == 1 then
            G.E_MANAGER:add_event(Event({
                delay = 0.5,
                func = function()
                    local copy = copy_card(context.scoring_hand[1], nil, nil, G.playing_card)
                    copy:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, copy)
                    G.deck:emplace(copy)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            copy:start_materialize()
                            return true
                        end
                    }))

                    return true
                end
            }))

            card.ability.extra.triggered = true
            return {
                message = "DAWSON!",
                colour = G.C.XMULT
            }
        end
    end,
})

local Muffs = J({
    name = "Muffs",
    pos = { x = 10, y = 4 },
    config = { extra = { current_mult = 0, mult_mod = 1, triggered = false } },
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        info_queue[#info_queue + 1] = { set = 'Other', key = 'Harvester' }
        return { vars = { center.ability.extra.mult_mod, center.ability.extra.current_mult } }
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
        if context.discard and context.other_card.ability["ina_harvest_sticker"] == true then
            card.ability.extra.current_mult =
                card.ability.extra.current_mult + card.ability.extra.mult_mod
            card.ability.extra.triggered = true
            context.other_card.ability["ina_harvest_sticker"] = false
            return {
                message = localize("ina_harvest"),
                colour = G.C.MULT,
                card = context.other_card
            }
        end
        if context.after and context.cardarea == G.jokers then
            local random_index = math.random(1, #G.hand.cards)
            local selected_card = G.hand.cards[random_index]

            G.E_MANAGER:add_event(Event({
                delay = 0.5,
                func = function()
                    selected_card.ability["ina_harvest_sticker"] = true
                    return true
                end
            }))
            card.ability.extra.triggered = true
            return {
                message = localize("ina_seed"),
                colour = G.C.MULT,
                card = selected_card
            }
        end

        if context.scoring_hand and context.cardarea == G.jokers and context.joker_main
            and card.ability.extra.current_mult > 0 then
            card.ability.extra.triggered = true
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.current_mult } },
                colour = G.C.MULT,
                mult_mod = card.ability.extra.current_mult,
            }
        end
    end,
})

local Hillvalley = J({
    name = "Hillvalley",
    pos = { x = 7, y = 4 },
    config = { extra = { current_chips = 0, triggered = false } },
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return { vars = { center.ability.extra.current_chips } }
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
        if context.after and context.cardarea == G.jokers and not context.blueprint then
            local max_val = nil

            for _, c in ipairs(context.scoring_hand) do
                local id = c:get_id()
                if id == 8 or id == 9 or id == 10 then
                    if not max_val or id > max_val then
                        max_val = id
                    end
                end
            end

            if max_val then
                card.ability.extra.current_chips = card.ability.extra.current_chips + max_val
                card.ability.extra.triggered = true
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS,
                    card = card
                }
            end
        end

        if context.scoring_hand and context.joker_main and card.ability.extra.current_chips > 0 then
            card.ability.extra.triggered = true
            return {
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.current_chips } },
                colour = G.C.CHIPS,
                chip_mod = card.ability.extra.current_chips
            }
        end
    end,
})

return {
    name = "Farm",
    list = { Greeny, Hayseed, Sherman, Spray, Dawson, Muffs, Hillvalley },
}
