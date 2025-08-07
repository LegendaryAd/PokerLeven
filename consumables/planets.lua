local get_vars = function(hand_text, hand_key)
    return {
        vars = {
            hand_text,
            G.GAME.hands[hand_key].level,
            G.GAME.hands[hand_key].l_mult,
            G.GAME.hands[hand_key].l_chips,
            colours = {
                (
                    to_big(G.GAME.hands[hand_key].level) == to_big(1) and G.C.UI.TEXT_DARK
                    or G.C.HAND_LEVELS[to_number(math.min(7, G.GAME.hands[hand_key].level))]
                ),
            },
        }
    }
end

local Make = {
    key = 'make',
    set = 'Planet',
    atlas = 'Consumables',
    discovered = true,
    config = { hand_type = 'ina_FullMansion', softlock = true },
    pos = { x = 7, y = 1 },
    generate_ui = 0,
    loc_vars = function(self, info_queue, center)
        return {
            get_vars('Full Mansion', 'ina_FullMansion')
        }
    end,
}

local godhand = {
    key = 'godhand',
    set = 'Planet',
    atlas = 'Consumables',
    discovered = true,
    config = { hand_type = 'ina_GodHand', softlock = true },
    pos = { x = 7, y = 1 },
    generate_ui = 0,
    loc_vars = function(self, info_queue, center)
        return {
            get_vars('Mano Celestial', 'ina_GodHand')
        }
    end,
}

return {
    name = "Planets",
    list = { Make, }
}
