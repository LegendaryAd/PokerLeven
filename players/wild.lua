-- Chicken
local Chicken = {
    name = "Chicken",
    pos = {x = 0, y = 2},
    config = {extra = {money = 4, odds = 2, triggered = false}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds, center.ability.extra.money}}
    end,
    rarity = 3, -- Rare
    pools = { ["Wild"] = true }, 
    cost = 7,
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "MF", -- Midfielder
    pteam = "Wild",
    blueprint_compat = true,
calculate = function(self, card, context)
    if context.individual and not context.end_of_round and context.cardarea == G.play and context.scoring_hand then
      if SMODS.has_enhancement(context.other_card, 'm_wild') then
        if pseudorandom('chicken') < G.GAME.probabilities.normal/card.ability.extra.odds then
            card.ability.extra.triggered = true
            return {
                dollars = card.ability.extra.money,
                card = card
            }
        end
      end
    end
  end,
}

-- Boar
local Boar = {
    name = "Boar",
    pos = {x = 12, y = 1},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Wild"] = true }, 
    cost = 3,
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "GK", -- Goalkeeper
    pteam = "Wild",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

-- Chamaleon
local Chamaleon = {
    name = "Chamaleon",
    pos = {x = 1, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    pools = { ["Wild"] = true }, 
    cost = 4,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "MF", -- Midfielder
    pteam = "Wild",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

-- Eagle
local Eagle = {
    name = "Eagle",
    pos = {x = 2, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Wild"] = true }, 
    cost = 3,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "MF", -- Midfielder
    pteam = "Wild",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

-- Monkey
local Monkey = {
    name = "Monkey",
    pos = {x = 3, y = 2},
    config = {extra = {wild_count = 0, triggered = false}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        local wild_players = #find_player_team('Wild')
        return {vars = {1 + ((wild_players * center.ability.extra.wild_count) / 10)}}
    end,
    rarity = 2, -- Uncommon
    pools = { ["Wild"] = true }, 
    cost = 4,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "MF", -- Midfielder
    pteam = "Wild",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if G.STAGE == G.STAGES.RUN then
            card.ability.extra.wild_count = 0
            for k, v in pairs(G.playing_cards) do
                if SMODS.has_enhancement(v, 'm_wild') then 
                    card.ability.extra.wild_count = card.ability.extra.wild_count + 1 
                end
            end
        end

        if context.cardarea == G.jokers and context.scoring_hand then
            if context.joker_main then
                local wild_players = #find_player_team('Wild')
                card.ability.extra.triggered = true
                return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {1 + ((wild_players * card.ability.extra.wild_count) / 10)}}, 
                    colour = G.C.MULT,
                    Xmult_mod =  1 + ((wild_players * card.ability.extra.wild_count) / 10)
                }
            end
        end
    end
}

-- Gorilla
local Gorilla = {
    name = "Gorilla",
    pos = {x = 5, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Wild"] = true }, 
    cost = 3,
    atlas = "Jokers01",
    ptype = "Mountain",
    pposition = "FW", -- Forward
    pteam = "Wild",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

-- Cheetah
local Cheetah = {
    name = "Cheetah",
    pos = {x = 4, y = 2},
    config = {extra = {current_element = "Wind", possible_elements = {"Wind", "Fire", "Forest", "Mountain"}, triggered = false}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        G.ARGS.LOC_COLOURS["select_element"] = G.ARGS.LOC_COLOURS[string.lower(center.ability.extra.current_element)] or HEX("FFFFFF")
        return {vars = {center.ability.extra.current_element}}
    end,
    rarity = 2, -- Uncommon
    pools = { ["Wild"] = true }, 
    cost = 4,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "FW", -- Forward
    pteam = "Wild",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
                card.ability.extra.current_element = pseudorandom_element(card.ability.extra.possible_elements, pseudoseed("elements"))
                return {
                    message = localize("ina_training"),
                    colour = G.C.RED,
                    card = card,
                }
        end
        if context.repetition and context.cardarea == G.play then
            local wildCount = 0
            for i, c in ipairs(context.scoring_hand) do
                if SMODS.has_enhancement(c, 'm_wild') then
                    wildCount = wildCount + 1
                end
            end
            if wildCount == 5 and not context.end_of_round and not context.before and not context.after 
            and not context.other_card.debuff then
                local retriggerCount = #find_player_type(card.ability.extra.current_element)
                card.ability.extra.triggered = true
                return {
                    message = localize('k_again_ex'),
                    repetitions = retriggerCount,
                    card = card
                }
            end
        end
    end
}

return {
    name = "Wild",
    list = {Chicken, Boar, Chamaleon, Eagle, Monkey, Gorilla, Cheetah},
}
