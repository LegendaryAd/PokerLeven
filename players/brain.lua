-- Feldt
local Feldt = {
    name = "Feldt",
    pos = {x = 6, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 3, -- Rare
    cost = 7,
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "GK", -- Goalkeeper
    pteam = "Brain",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

-- Marvel
local Marvel = {
    name = "Marvel",
    pos = {x = 8, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    cost = 3,
    atlas = "Jokers01",
    ptype = "Mountain",
    pposition = "DF", -- Defense
    pteam = "Brain",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

-- Tell
local Tell = {
    name = "Tell",
    pos = {x = 10, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    cost = 4,
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "MF", -- Midfielder
    pteam = "Brain",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

-- Seller
local Seller = {
    name = "Seller",
    pos = {x = 9, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    cost = 3,
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "FW", -- Forward
    pteam = "Brain",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

-- Kind
local Kind = {
    name = "Kind",
    pos = {x = 7, y = 2},
    config = {extra = {triggered = false}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    cost = 4,
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "MF", -- Midfielder
    pteam = "Brain",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            local ids = {}
            for i = 1, 5 do
                local card_i = context.scoring_hand[i]
                if card_i then
                    table.insert(ids, card_i:get_id())
                end
            end

            local function is_sequence_palindrome(tbl)
                local len = #tbl
                for i = 1, math.floor(len / 2) do
                    if tostring(tbl[i]) ~= tostring(tbl[len - i + 1]) then
                        return false
                    end
                end
                return len > 1
            end

            if is_sequence_palindrome(ids) then
                card.ability.extra.triggered = true
                local retriggerCount = 1
                if context.other_card == context.scoring_hand[1] or context.other_card == context.scoring_hand[#context.scoring_hand] then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = retriggerCount,
                        card = context.other_card
                    }
                end
            end
        end
    end
}

-- Turner
local Turner = {
    name = "Turner",
    pos = {x = 11, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Uncommon
    cost = 4,
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "FW", -- Forward
    pteam = "Brain",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

-- Under
local Under = {
    name = "Under",
    pos = {x = 12, y = 2},
    config = {extra = {}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    cost = 3,
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "GK", -- Goalkeeper
    pteam = "Brain",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO: Placeholder
    end
}

return {
    name = "Brain",
    list = {Feldt, Marvel, Tell, Seller, Kind, Turner, Under},
}