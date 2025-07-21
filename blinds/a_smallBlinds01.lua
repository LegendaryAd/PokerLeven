local benchers = {
    object_type = "SmallBlind",
    key = "benchers",
    pos = { x = 0, y = 0 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8"),
    dollars = 3,
    small = { min = 0 },
}

local baseball = {
    object_type = "SmallBlind",
    key = "baseball_all_stars",
    pos = { x = 0, y = 1 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8"),
    dollars = 3,
    small = { min = 2 },
}

local strange = {
    object_type = "SmallBlind",
    key = "strange_guys",
    pos = { x = 0, y = 2 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8"),
    dollars = 3,
    small = { min = 2 },
}

local inazuma08 = {
    object_type = "SmallBlind",
    key = "inazuma08",
    pos = { x = 0, y = 3 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8"),
    dollars = 3,
    small = { min = 2 },
}

local inazuma_town = {
    object_type = "SmallBlind",
    key = "inazuma_town",
    pos = { x = 0, y = 4 },
    discovered = true,
    mult = 1,
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8"),
    dollars = 3,
    small = { min = 2 },
}

local glasses = {
    object_type = "SmallBlind",
    key = "glasses",
    pos = { x = 0, y = 5 },
    discovered = true,
    mult = 1.25,
    config = { extra = { retriggers = 1, times_triggered = 0 } },
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8"),
    dollars = 3,
    small = { min = 3 },
    set_blind = function(self)
        self.config.extra.times_triggered = 0
    end,
    calculate = function(self, blind, context)
        if context.repetition and context.cardarea == G.play and context.other_card then
            if SMODS.has_enhancement(context.other_card, "m_glass")
                and self.config.extra.times_triggered < 2 then
                self.config.extra.times_triggered = self.config.extra.times_triggered + 1
                return {
                    message = localize('k_again_ex'),
                    repetitions = self.config.extra.retriggers,
                    card = context.other_card
                }
            end
        end
    end
}

return {
    name = "SmallBlinds01",
    list = { benchers, baseball, strange, inazuma08, inazuma_town, glasses }
}
