local ff_regional_a = {
    object_type = "Blind",
    name = "ina-ff_regional_a",
    key = "ff_regional_a",
    pos = { x = 0, y = 0 },
    discovered = true,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 9 }, -- 0
}

local ff_regional_b = {
    object_type = "Blind",
    name = "ina-ff_regional_b",
    key = "ff_regional_b",
    pos = { x = 0, y = 1 },
    discovered = true,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 9 }, -- 0
}

local ff_national_a = {
    object_type = "Blind",
    name = "ina-ff_national_a-guys",
    key = "ff_national_a",
    pos = { x = 0, y = 2 },
    discovered = true,
    mult = 1.55,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 2 },
}

local ff_national_b = {
    object_type = "Blind",
    name = "ina-ff_national_b",
    key = "ff_national_b",
    pos = { x = 0, y = 3 },
    discovered = true,
    mult = 1.55,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 2 },
}

local umbrella = {
    object_type = "Blind",
    name = "ina-umbrella",
    key = "umbrella",
    pos = { x = 0, y = 4 },
    discovered = true,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 0 },
    set_blind = function(self)
        G.GAME.blind.hands_sub = -1
        ease_hands_played(1)
        G.GAME.blind.discards_sub = 1
        ease_discard(-1)
    end,
}

local inazuma_kids = {
    object_type = "Blind",
    name = "ina-inazuma_kids",
    key = "inazuma_kids",
    pos = { x = 0, y = 5 },
    discovered = true,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 10000 },
}

local sallys = {
    object_type = "Blind",
    name = "ina-sallys",
    key = "sallys",
    pos = { x = 0, y = 6 },
    discovered = true,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 10000 },
}

local occult = B({
    object_type = "Blind",
    name = "Occult",
    key = "occult",
    pos = { x = 0, y = 7 },
    discovered = true,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 9 }, -- 0
})

local raimonOB = {
    object_type = "Blind",
    name = "ina-raimonOB",
    key = "raimonOB",
    pos = { x = 0, y = 8 },
    discovered = true,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 9 }, -- 0
}

local shun = {
    object_type = "Blind",
    name = "ina-shun",
    key = "shun",
    pos = { x = 0, y = 9 },
    discovered = true,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 9 }, -- 0
}

local empress = {
    object_type = "Blind",
    name = "ina-empress",
    key = "empress",
    pos = { x = 0, y = 10 },
    discovered = true,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 9 }, -- 0
}

return {
    name = "bigBlinds01",
    list = { ff_regional_a, ff_regional_b, ff_national_a, ff_national_b,
        umbrella, inazuma_kids, sallys,
        occult, raimonOB, shun, empress }
}
