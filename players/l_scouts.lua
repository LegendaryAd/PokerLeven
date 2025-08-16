-- Dulce
---@param card Card
local select_random_cards_for_harvest = function(card)
    local count = #Pokerleven.find_player_type_and_position("Wind", "MF")

    if count > 0 and G.deck and G.deck.cards and #G.deck.cards > 0 then
        table.unpack = table.unpack or unpack
        local candidates = { table.unpack(G.deck.cards) }

        for i = 1, count do
            if #candidates == 0 then break end

            local target = pseudorandom_element(candidates, pseudoseed("dulce_harvest_" .. i))
            if target then
                target:set_as_harvestable()

                for j, c in ipairs(candidates) do
                    if c == target then
                        table.remove(candidates, j)
                        break
                    end
                end
            end
        end
    end
end

local Dulce = J({
    name = "Dulce",
    pos = { x = 10, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 3,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = "Wind",
    pposition = "DF",
    pteam = "Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.blind_defeated and not context.blueprint then
            return select_random_cards_for_harvest(card)
        end
    end,
})

-- Ryoma
local Ryoma = {
    name = "Ryoma",
    pos = { x = 9, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = "Mountain",
    pposition = "GK",
    pteam = "Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
}

-- Blazer
local Blazer = J({
    name = "Blazer",
    pos = { x = 1, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Fire,
    pposition = C.GK,
    pteam = "Scout",
    blueprint_compat = true,
    allow_element_application = true,
    add_to_deck = function(self, card, from_debuff)
        card.calculate_joker = function(context)
            apply_element("Fire", "ina_onfire", G.C.RED, card)
        end
        card.remove_from_deck = function(from_debuff)
            restore_types_for_area()
        end
    end
})

-- Weathervane
local Weathervane = J({
    name = "Weathervane",
    pos = { x = 2, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = "Wind",
    pposition = "DF",
    pteam = "Scout",
    blueprint_compat = true,
    allow_element_application = true,
    add_to_deck = function(self, card, from_debuff)
        card.calculate_joker = function(context)
            apply_element("Wind", "ina_onwind", G.C.BLUE, card)
        end
        card.remove_from_deck = function(from_debuff)
            restore_types_for_area()
        end
    end
})

-- Noggin
local Noggin = J({
    name = "Noggin",
    pos = { x = 3, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = "Forest",
    pposition = "MF",
    pteam = "Scout",
    blueprint_compat = true,
    allow_element_application = true,
    add_to_deck = function(self, card, from_debuff)
        card.calculate_joker = function(context)
            apply_element("Forest", "ina_onforest", G.C.PALE_GREEN, card)
        end
        card.remove_from_deck = function(from_debuff)
            restore_types_for_area()
        end
    end
})

-- Montayne
local Montayne = J({
    name = "Montayne",
    pos = { x = 6, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = "Mountain",
    pposition = "FW",
    pteam = "Scout",
    blueprint_compat = true,
    allow_element_application = true,
    add_to_deck = function(self, card, from_debuff)
        card.calculate_joker = function(context)
            apply_element("Mountain", "ina_onmountain", G.C.CHIPS, card)
        end
        card.remove_from_deck = function(from_debuff)
            restore_types_for_area()
        end
    end
})

-- Chester
local Chester = J({
    name = "Chester",
    pos = { x = 4, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = "Forest",
    pposition = "MF",
    pteam = "Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Mach
local Mach = {
    name = "Mach",
    pos = { x = 7, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = "Wind",
    pposition = "FW",
    pteam = "Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
}

-- Miles
local Miles = {
    name = "Miles",
    pos = { x = 8, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = "Wind",
    pposition = "DF",
    pteam = "Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
}

-- George
local George = {
    name = "George",
    pos = { x = 5, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = "Forest",
    pposition = "MF",
    pteam = "Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
}

-- Ace Server
local Ace_Server = J({
    name = "Ace_Server",
    pos = { x = 0, y = 0 },
    config = { extra = { odds = 5, hand_level_up = 1, ammount_needed = 2, rank_played = 14, } },
    loc_vars = function(self, info_queue, center)
        return {
            vars = { center.ability.extra.odds, center.ability.extra.hand_level_up, center.ability.extra.ammount_needed, center.ability.extra.rank_played }
        }
    end,
    rarity = 2,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Wind,
    pposition = C.GK,
    pteam = "Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if Pokerleven.after_scoring_phase(context) and
            card:odds_triggered('AceServer') and
            Pokerleven.has_enough_cards_of_rank(context.scoring_hand, card.ability.extra.rank_played, card.ability.extra.ammount_needed) then
            return Pokerleven.level_up_hand(card.ability.extra.hand_level_up)
        end
    end
})

return {
    name = "Scout",
    list = { Ace_Server, Blazer, Weathervane, Noggin, Montayne, Dulce },
}
