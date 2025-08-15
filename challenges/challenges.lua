local glasses_team = {
    object_type = "Challenge",
    key = "glasses_team",
    rules = {
        modifiers = {
            { id = 'joker_slots', value = 5 },
        }
    },
    jokers = {
        { id = "j_ina_Willy", eternal = true },
        { id = "j_ina_Willy", eternal = true },
        { id = "j_ina_Willy", eternal = true },
        { id = "j_ina_Willy", eternal = true },
    },
    restrictions = {
        banned_cards = {
            { id = "j_ina_Cleats" }
        },
        banned_tags = {
        },
        banned_other = {
        },
    },
    deck = {
        type = 'Challenge Deck',
    },
}

local love_pair = {
    object_type = "Challenge",
    key = "love_pair",
    rules = {
        modifiers = {
            { id = 'joker_slots', value = 5 },
        }
    },
    jokers = {
        { id = "j_ina_Damian", eternal = true },
        { id = "j_ina_Blazer", eternal = true },
    },
    restrictions = {
        banned_cards = {
            { id = "j_ina_Cleats" }
        },
        banned_tags = {
        },
        banned_other = {
        },
    },
    deck = {
        type = 'Challenge Deck',
    },
}

local futbol_frontier = {
    object_type = "Challenge",
    key = "futbol_frontier",
    rules = {
        custom = {
            { id = 'ina_futbol_frontier' },
        },
        modifiers = {
        }
    },
    jokers = {
    },
    restrictions = {
        banned_cards = {
            { id = "v_directors_cut" }
        },
        banned_tags = {
            { id = "tag_ina_chain_tag" }
        },
        banned_other = {
        },
    },
    deck = {
        type = 'Challenge Deck',
    },
}

local bosses = { "bl_ina_wild", "bl_ina_brain", "bl_ina_otaku",
    "bl_ina_royal_blind", "bl_ina_shuriken",
    "bl_ina_farm", "bl_ina_kirkwood", "bl_ina_zeus" }

local old_get_new_boss = get_new_boss

local get_next_boss = function()
    local boss = bosses[G.GAME.boss_index]

    G.GAME.boss_index = G.GAME.boss_index + 1
    if G.GAME.boss_index > #bosses then
        old_get_new_boss()
    end
    return boss
end

local reset_next_boss_index = function()
    if not G.GAME.boss_index then
        G.GAME.boss_index = 1
    end
end

function get_new_boss()
    if G.GAME.modifiers.ina_futbol_frontier then
        reset_next_boss_index()

        local boss = get_next_boss()

        return boss
    else
        return old_get_new_boss()
    end
end

return {
    name = "Challenge",
    list = { glasses_team, love_pair, futbol_frontier }
}
