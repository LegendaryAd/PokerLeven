local benchers = {
    object_type = "Blind",
    name = "ina-benchers",
    key = "benchers",
    pos = { x = 0, y = 0 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    order = 1,
    boss_colour = HEX("5EC2E8") ,
    dollars = 2,
    small = {min = 0},
    boss = {min = 1000}
}

local baseball = {
    object_type = "Blind",
    name = "ina-baseball",
    key = "baseball_all_stars",
    pos = { x = 0, y = 1 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    order = 1,
    boss_colour = HEX("5EC2E8") ,
    dollars = 2,
    small = {min = 0},
    boss = {min = 1000}
}

local strange = {
    object_type = "Blind",
    name = "ina-strange-guys",
    key = "strange_guys",
    pos = { x = 0, y = 2 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    order = 1,
    boss_colour = HEX("5EC2E8") ,
    dollars = 2,
    small = {min = 0},
    boss = {min = 1000}
}

local inazuma08 = {
    object_type = "Blind",
    name = "ina-inazuma08",
    key = "inazuma08",
    pos = { x = 0, y = 3 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    order = 1,
    boss_colour = HEX("5EC2E8") ,
    dollars = 2,
    small = {min = 0},
    boss = {min = 1000}
}

local inazuma_town = {
    object_type = "Blind",
    name = "ina-inazuma-town",
    key = "inazuma_town",
    pos = { x = 0, y = 4 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    order = 1,
    boss_colour = HEX("5EC2E8") ,
    dollars = 2,
    small = {min = 0},
    boss = {min = 1000}
}

local glasses = {
    object_type = "Blind",
    name = "ina-glasses",
    key = "glasses",
    pos = { x = 0, y = 5 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    order = 1,
    boss_colour = HEX("5EC2E8") ,
    dollars = 2,
    small = {min = 0},
    boss = {min = 1000}
}

return {
    name = "SmallBlinds01",
    list = {benchers, baseball, strange, inazuma08, inazuma_town, glasses}
}