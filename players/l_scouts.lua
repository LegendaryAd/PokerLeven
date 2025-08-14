-- Dulce
local Dulce = {
    name = "Dulce",
    pos = { x = 10, y = 0 },
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
    calculate = function(self, card, context)
        if G.jokers and G.jokers.cards then
            local not_fire = find_player_type("Fire", true)
            if #not_fire > 0 then
                for _, player in ipairs(not_fire) do
                    apply_property_sticker(player, "Fire", "type")
                    card_eval_status_text(player, 'extra', nil, nil, nil, {
                        message = localize("ina_onfire"),
                        colour = G.C.RED
                    })
                end
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if G.jokers and G.jokers.cards then
            for _, player in ipairs(G.jokers.cards) do
                apply_property_sticker(player, player.config.center.ptype, "type")
            end
        end

        if Pokerleven.ina_bench_area and Pokerleven.ina_bench_area.cards then
            for _, player in ipairs(Pokerleven.ina_bench_area.cards) do
                apply_property_sticker(player, player.config.center.ptype, "type")
            end
        end
    end
})

-- Chester
local Chester = {
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
}

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
local Ace_Server = {
    name = "Ace_Server",
    pos = { x = 0, y = 0 },
    config = { extra = { odds = 5, levels = 1 } },
    loc_vars = function(self, info_queue, center)
        return {
            vars = { center.ability.extra.odds, center.ability.extra.levels }
        }
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Wind,
    pposition = C.GK,
    pteam = "Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        return Upgrade_hand(context, 14, 2, card, context.hand_name, 'ina_mano')
    end
}

return {
    name = "Scout",
    list = { Blazer, Ace_Server },
}
