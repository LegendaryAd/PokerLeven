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
    config = { extra = { triggered = false } },
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)

        function calculate_avg_sell_cost()
            local sumSellCost = 0
            for _, v in pairs(G.jokers.cards) do
                if v.ability.extra.ptype then
                    sumSellCost = sumSellCost + v.sell_cost
                end
            end

            return sumSellCost / #find_player_type("Wind")
        end

        return { vars = { calculate_avg_sell_cost() } }
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
                message = localize { type = 'variable', key = 'a_chips', vars = { calculate_avg_sell_cost() } },
                colour = G.C.CHIPS,
                chip_mod = calculate_avg_sell_cost()
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
