local Raimon = {
    name = "Raimon Pack",
	key = "team_pack_raimon",
	kind = "Team",
	atlas = "Boosters01",
	pos = { x = 0, y = 0 },
	config = { extra = 2, choose = 1, c_keys = {}},
	cost = 6,
	order = 1,
	weight = function()
		if #find_player_team("Raimon") > 0 then
			return 0.35
		else
			return 0
		end
	end,
    draw_hand = true,
    unlocked = true,
    discovered = true,
	create_card = function(self, card, i)
		return create_card("Raimon", G.pack_cards, nil, nil, true, true, nil, nil)
    end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "k_team_pack",
}

local Occult = {
    name = "Occult",
	key = "team_pack_occult",
	kind = "Team",
	atlas = "Boosters01",
	pos = { x = 2, y = 0 },
	config = { extra = 2, choose = 1, c_keys = {}},
	cost = 6,
	order = 1,
	weight = function()
		if #find_player_team("Occult") > 0 then
			return 0.35
		else
			return 0
		end
	end,
    draw_hand = true,
    unlocked = true,
    discovered = true,
	create_card = function(self, card, i)
		return create_card("Occult", G.pack_cards, nil, nil, true, true, nil, nil)
    end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "k_team_pack",
}

local RoyalAcademy = {
    name = "Royal Academy",
	key = "team_pack_royal",
	kind = "Team",
	atlas = "Boosters01",
	pos = { x = 1, y = 0 },
	config = { extra = 2, choose = 1, c_keys = {}},
	cost = 4,
	order = 1,
	weight = function()
		if #find_player_team("Royal Academy") > 0 then
			return 0.35
		else
			return 0
		end
	end,
    draw_hand = true,
    unlocked = true,
    discovered = true,
	create_card = function(self, card, i)
		return create_card("Royal Academy", G.pack_cards, nil, nil, true, true, nil, nil)
    end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra} }
	end,
	group_key = "k_team_pack",
}

local Wild = {
    name = "Wild",
	key = "team_pack_wild",
	kind = "Team",
	atlas = "Boosters01",
	pos = { x = 3, y = 0 },
	config = { extra = 2, choose = 1, c_keys = {}},
	cost = 6,
	order = 1,
	weight = function()
		if #find_player_team("Wild") > 0 then
			return 0.35
		else
			return 0
		end
	end,
    draw_hand = true,
    unlocked = true,
    discovered = true,
	create_card = function(self, card, i)
		return create_card("Wild", G.pack_cards, nil, nil, true, true, nil, nil)
    end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra} }
	end,
	group_key = "k_team_pack",
}

local test5 = {
    name = "Test",
	key = "test5",
	kind = "Test",
	atlas = "Boosters01",
	pos = { x = 0, y = 1 },
	config = { extra = 4, choose = 1, c_keys = {}},
	cost = 4,
	order = 1,
    weight = 0,
    draw_hand = true,
    unlocked = true,
    discovered = true,
	create_card = function(self, card, i)
    end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra - 1, 1 } }
	end,
	group_key = "k_ina_test",
}

local test6 = {
    name = "Test",
	key = "test6",
	kind = "Test",
	atlas = "Boosters01",
	pos = { x = 1, y = 1 },
	config = { extra = 4, choose = 1, c_keys = {}},
	cost = 4,
	order = 1,
    weight = 0,
    draw_hand = true,
    unlocked = true,
    discovered = true,
	create_card = function(self, card, i)
    end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra - 1, 1 } }
	end,
	group_key = "k_ina_test",
}

local test7 = {
    name = "Test",
	key = "test7",
	kind = "Test",
	atlas = "Boosters01",
	pos = { x = 2, y = 1 },
	config = { extra = 4, choose = 1, c_keys = {}},
	cost = 4,
	order = 1,
    weight = 0,
    draw_hand = true,
    unlocked = true,
    discovered = true,
	create_card = function(self, card, i)
    end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra - 1, 1 } }
	end,
	group_key = "k_ina_test",
}

local test8 = {
    name = "Test",
	key = "test8",
	kind = "Test",
	atlas = "Boosters01",
	pos = { x = 3, y = 1 },
	config = { extra = 4, choose = 1, c_keys = {}},
	cost = 4,
	order = 1,
    weight = 0,
    draw_hand = true,
    unlocked = true,
    discovered = true,
	create_card = function(self, card, i)
    end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra - 1, 1 } }
	end,
	group_key = "k_ina_test",
}

local test9 = {
    name = "Test",
	key = "test9",
	kind = "Test",
	atlas = "Boosters01",
	pos = { x = 0, y = 2 },
	config = { extra = 4, choose = 1, c_keys = {}},
	cost = 4,
	order = 1,
    weight = 0,
    draw_hand = true,
    unlocked = true,
    discovered = true,
	create_card = function(self, card, i)
    end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra - 1, 1 } }
	end,
	group_key = "k_ina_test",
}

local test10 = {
    name = "Test",
	key = "test10",
	kind = "Test",
	atlas = "Boosters01",
	pos = { x = 1, y = 2 },
	config = { extra = 4, choose = 1, c_keys = {}},
	cost = 4,
	order = 1,
    weight = 0,
    draw_hand = true,
    unlocked = true,
    discovered = true,
	create_card = function(self, card, i)
    end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra - 1, 1 } }
	end,
	group_key = "k_ina_test",
}

local test11 = {
    name = "Test",
	key = "test11",
	kind = "Test",
	atlas = "Boosters01",
	pos = { x = 2, y = 2 },
	config = { extra = 4, choose = 1, c_keys = {}},
	cost = 4,
	order = 1,
    weight = 0,
    draw_hand = true,
    unlocked = true,
    discovered = true,
	create_card = function(self, card, i)
    end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra - 1, 1 } }
	end,
	group_key = "k_ina_test",
}

return{
    name = "Boosters01",
    list = {Raimon, Occult, RoyalAcademy, Wild, test5, test6, test7, test8, test9, test10, test11}
}