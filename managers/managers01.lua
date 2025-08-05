-- Nelly
local Nelly = J({
    name = "Nelly",
    pos = { x = 0, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    special = "Manager",
    cost = 4,
    atlas = "Managers01",
    generate_ui = Pokerleven.generate_info_ui,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Celia
local Celia = J({
    name = "Celia",
    pos = { x = 1, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    special = "Manager",
    cost = 4,
    atlas = "Managers01",
    calculate = function(self, card, context)
        if context.starting_shop then
            jude = get_joker_with_key("j_ina_Jude")
            if jude then
                return {
                    message = ina_evolve(jude, "j_ina_Jude_Raimon")
                }
            end
        end
        --TODO BANQUILLO
    end,
    ina_credits = {
        idea = { "Killer_Patata" }
    }
})

-- Silvia
local Silvia = J({
    name = "Silvia",
    pos = { x = 2, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    special = "Manager",
    cost = 4,
    atlas = "Managers01",
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Aurelia
local Aurelia = J({
    name = "Aurelia",
    pos = { x = 3, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    special = "Manager",
    cost = 4,
    atlas = "Managers01",
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Silvia
local Koudera = J({
    name = "Koudera",
    pos = { x = 6, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    special = "Manager",
    cost = 4,
    atlas = "Managers01",
    calculate = function(self, card, context)
        -- TODO Add logic
    end,
    ina_credits = {
        art = { "KirineMoe" }
    }
})


return {
    name = "Managers",
    list = { Nelly, Celia, Silvia, Aurelia, Koudera }
}
