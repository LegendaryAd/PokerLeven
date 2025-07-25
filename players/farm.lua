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
