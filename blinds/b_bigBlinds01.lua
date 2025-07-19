local ff_regional_a = {
    object_type = "Blind",
    name = "ina-ff_regional_a",
    key = "ff_regional_a",
    pos = { x = 0, y = 0 },
    discovered = true,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B") ,
    dollars = 4,
    big = {min = 0},
    boss = {min = 1000}
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
    boss_colour = HEX("B7865B") ,
    dollars = 4,
    big = {min = 0},
    boss = {min = 1000}
}

local ff_national_a = {
    object_type = "Blind",
    name = "ina-ff_national_a-guys",
    key = "ff_national_a",
    pos = { x = 0, y = 2 },
    discovered = true,
    mult = pokerleven_config.middle_blinds_abilities and 1.8 or 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B") ,
    dollars = 4,
    big = {min = 0},
    boss = {min = 1000}
}

local ff_national_b = {
    object_type = "Blind",
    name = "ina-ff_national_b",
    key = "ff_national_b",
    pos = { x = 0, y = 3 },
    discovered = true,
    mult = pokerleven_config.middle_blinds_abilities and 1.7 or 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B") ,
    dollars = 4,
    big = {min = 0},
    boss = {min = 1000}
}

return {
    name = "bigBlinds01",
    list = {ff_regional_a, ff_regional_b, ff_national_a, ff_national_b}
}