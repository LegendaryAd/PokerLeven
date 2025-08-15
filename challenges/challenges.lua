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

return {
    name = "Challenge",
    list = { glasses_team, love_pair }
}
