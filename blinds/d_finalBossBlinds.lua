local zeus_caido = B({
    object_type = "Blind",
    name = "ina-zeus_caido",
    key = "zeus_caido",
    pos = { x = 0, y = 1 },
    boss = {
        showdown = true,
    },
    config = { extra_percent = 0.15 },
    discovered = true,
    mult = 2,
    atlas = "finalBossBlinds",
    order = 1,
    boss_colour = HEX("ffa726"),
    collection_loc_vars = function(self)
        return {
            vars = {
                self.config.extra_percent * 100
            },
            key = self.key
        }
    end,
    loc_vars = function(self)
        return {
            vars = {
                self.config.extra_percent * 100
            },
            key = self.key
        }
    end,
    ina_credits = {
        art = { "Shadorossa" }
    },
    drawn_to_hand = function(self)
        G.GAME.blind.chips = G.GAME.blind.chips + G.GAME.blind.chips * self.config.extra_percent
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        play_sound('gong', 0.76, 1.2)
    end,
    in_pool = function(self)
        if G.GAME.round_resets.ante >= 16 then
            return true
        end
        return false
    end
})

return {
    name = "Boss Blinds",
    list = { zeus_caido }
}
