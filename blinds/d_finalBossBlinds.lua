local zeus_caido = {
    object_type = "Blind",
    name = "ina-zeus_caido",
    key = "zeus_caido",
    pos = { x = 0, y = 1 },
    boss = {
        min = 10000,
    },
    discovered = true,
    mult = 2,
    atlas = "finalBossBlinds",
    order = 1,
    boss_colour = HEX("ffa726") ,
    recalc_debuff = function(self, card, from_blind)
    end,
	ina_credits = {
		art = {"Shadorossa"}
	}
}

return {
    name = "Boss Blinds",
    list = {zeus_caido}
}
