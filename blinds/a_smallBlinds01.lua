local benchers = {
    object_type = "SmallBlind",
    key = "benchers",
    pos = { x = 0, y = 0 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8") ,
    dollars = 2,
    small = {min = 0},
}

local baseball = {
    object_type = "SmallBlind",
    key = "baseball_all_stars",
    pos = { x = 0, y = 1 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8") ,
    dollars = 2,
    small = {min = 0},
}

local strange = {
    object_type = "SmallBlind",
    key = "strange_guys",
    pos = { x = 0, y = 2 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8") ,
    dollars = 2,
    small = {min = 0},
}

local inazuma08 = {
    object_type = "SmallBlind",
    key = "inazuma08",
    pos = { x = 0, y = 3 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8") ,
    dollars = 2,
    small = {min = 0},
}

local inazuma_town = {
    object_type = "SmallBlind",
    key = "inazuma_town",
    pos = { x = 0, y = 4 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8") ,
    dollars = 2,
    small = {min = 0},
}

local glasses = {
    object_type = "SmallBlind",
    key = "glasses",
    pos = { x = 0, y = 5 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8") ,
    dollars = 2,
    small = {min = 0},
}

return {
    name = "SmallBlinds01",
    list = {benchers, baseball, strange, inazuma08, inazuma_town, glasses}
}