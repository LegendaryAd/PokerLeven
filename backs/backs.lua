local hillman = Ba({
    name = "hillman",
    key = "hillman",
    order = 17,
    unlocked = true,
    discovered = true,
    config = { managers = 2, ante = 4, strats_created = 1 },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                self.config.managers,
                self.config.ante,
                self.config.strats_created
            }
        }
    end,
    pos = { x = 1, y = 0 },
    atlas = "decks",
    apply = function(self, back)
        Pokerleven.ina_manager_area.config.card_limit = self.config.managers
        G.GAME.modifiers.ina_hillman_deck_ante = 4
    end
})

local original_ease_round = ease_round
function ease_round(mod)
    if G.GAME.modifiers.ina_hillman_deck_ante and
        G.GAME.round_resets.ante >= G.GAME.modifiers.ina_hillman_deck_ante
        and Pokerleven.has_enough_consumables_space() then
        local strat = create_card('Strat', G.consumeables, nil, nil, false, false, nil, nil)
        Pokerleven.add_card_to_consumables(strat)
    end
    original_ease_round(mod)
end

local ray_dark = Ba({
    name = "Ray Dark",
    key = "ray_dark",
    order = 17,
    unlocked = false,
    discovered = true,
    config = { managers = 0, ante = 4 },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                self.config.managers,
                self.config.ante
            }
        }
    end,
    pos = { x = 2, y = 0 },
    atlas = "decks",
    apply = function(self, back)
        Pokerleven.ina_manager_area.config.card_limit = self.config.managers
    end
})

return {
    name = "Decks",
    list = { hillman, ray_dark }
}
