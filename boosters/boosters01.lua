local Raimon = {
	name = "Raimon Pack",
	key = "team_pack_raimon",
	kind = "Team",
	atlas = "Boosters01",
	pos = { x = 0, y = 0 },
	config = { extra = 2, choose = 1, c_keys = {} },
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
	ina_credits = {
		art = { "Shadorossa" }
	}
}

local Occult = {
	name = "Occult",
	key = "team_pack_occult",
	kind = "Team",
	atlas = "Boosters01",
	pos = { x = 2, y = 0 },
	config = { extra = 2, choose = 1, c_keys = {} },
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
	ina_credits = {
		art = { "Shadorossa" }
	}
}

local RoyalAcademy = {
	name = "Royal Academy",
	key = "team_pack_royal",
	kind = "Team",
	atlas = "Boosters01",
	pos = { x = 1, y = 0 },
	config = { extra = 2, choose = 1, c_keys = {} },
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
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "k_team_pack",
	ina_credits = {
		art = { "Shadorossa" }
	}
}

local Wild = {
	name = "Wild",
	key = "team_pack_wild",
	kind = "Team",
	atlas = "Boosters01",
	pos = { x = 3, y = 0 },
	config = { extra = 2, choose = 1, c_keys = {} },
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
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "k_team_pack",
	ina_credits = {
		art = { "Shadorossa" }
	}
}

local Brain = {
	name = "Brain",
	key = "team_pack_brain",
	kind = "Team",
	atlas = "Boosters01",
	pos = { x = 0, y = 1 },
	config = { extra = 2, choose = 1, c_keys = {} },
	cost = 6,
	order = 1,
	weight = function()
		if #find_player_team("Brain") > 0 then
			return 0.35
		else
			return 0
		end
	end,
	draw_hand = true,
	unlocked = true,
	discovered = true,
	create_card = function(self, card, i)
		return create_card("Brain", G.pack_cards, nil, nil, true, true, nil, nil)
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "k_team_pack",
	ina_credits = {
		art = { "Shadorossa" }
	}
}

local Otaku = {
	name = "Otaku",
	key = "team_pack_otaku",
	kind = "Team",
	atlas = "Boosters01",
	pos = { x = 1, y = 1 },
	config = { extra = 2, choose = 1, c_keys = {} },
	cost = 6,
	order = 1,
	weight = function()
		if #find_player_team("Otaku") > 0 then
			return 0.35
		else
			return 0
		end
	end,
	draw_hand = true,
	unlocked = true,
	discovered = true,
	create_card = function(self, card, i)
		return create_card("Otaku", G.pack_cards, nil, nil, true, true, nil, nil)
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "k_team_pack",
	ina_credits = {
		art = { "Shadorossa" }
	}
}

local Inazuma = {
	name = "Inazuma",
	key = "team_pack_inazuma",
	kind = "Team",
	atlas = "Boosters01",
	pos = { x = 2, y = 1 },
	config = { extra = 2, choose = 1, c_keys = {} },
	cost = 4,
	order = 1,
	weight = function()
		if #find_player_team("Inazuma") > 0 then
			return 0.35
		else
			return 0
		end
	end,
	draw_hand = true,
	unlocked = true,
	discovered = true,
	create_card = function(self, card, i)
		return create_card("Inazuma", G.pack_cards, nil, nil, true, true, nil, nil)
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "k_team_pack",
	ina_credits = {
		art = { "Shadorossa" }
	}
}

local Shuriken = {
	name = "Shuriken",
	key = "team_pack_shuriken",
	kind = "Team",
	atlas = "Boosters01",
	pos = { x = 3, y = 1 },
	config = { extra = 2, choose = 1, c_keys = {} },
	cost = 4,
	order = 1,
	weight = function()
		if #find_player_team("Shuriken") > 0 then
			return 0.35
		else
			return 0
		end
	end,
	draw_hand = true,
	unlocked = true,
	discovered = true,
	create_card = function(self, card, i)
		return create_card("Shuriken", G.pack_cards, nil, nil, true, true, nil, nil)
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "k_team_pack",
	ina_credits = {
		art = { "Shadorossa" }
	}
}

local Farm = {
	name = "Farm",
	key = "team_pack_farm",
	kind = "Team",
	atlas = "Boosters01",
	pos = { x = 0, y = 2 },
	config = { extra = 2, choose = 1, c_keys = {} },
	cost = 4,
	order = 1,
	weight = function()
		if #find_player_team("Farm") > 0 then
			return 0.35
		else
			return 0
		end
	end,
	draw_hand = true,
	unlocked = true,
	discovered = true,
	create_card = function(self, card, i)
		return create_card("Farm", G.pack_cards, nil, nil, true, true, nil, nil)
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "k_team_pack",
	ina_credits = {
		art = { "Shadorossa" }
	}
}

local Kirkwood = {
	name = "Kirkwood",
	key = "team_pack_kirkwood",
	kind = "Team",
	atlas = "Boosters01",
	pos = { x = 1, y = 2 },
	config = { extra = 2, choose = 1, c_keys = {} },
	cost = 4,
	order = 1,
	weight = function()
		if #find_player_team("Kirkwood") > 0 then
			return 0.35
		else
			return 0
		end
	end,
	draw_hand = true,
	unlocked = true,
	discovered = true,
	create_card = function(self, card, i)
		return create_card("Kirkwood", G.pack_cards, nil, nil, true, true, nil, nil)
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "k_team_pack",
	ina_credits = {
		art = { "Shadorossa" }
	}
}

local Zeus = {
	name = "Zeus",
	key = "team_pack_zeus",
	kind = "Team",
	atlas = "Boosters01",
	pos = { x = 2, y = 2 },
	config = { extra = 2, choose = 1, c_keys = {} },
	cost = 4,
	order = 1,
	weight = function()
		if #find_player_team("Zeus") > 0 then
			return 0.35
		else
			return 0
		end
	end,
	draw_hand = true,
	unlocked = true,
	discovered = true,
	create_card = function(self, card, i)
		return create_card("Zeus", G.pack_cards, nil, nil, true, true, nil, nil)
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "k_team_pack",
	ina_credits = {
		art = { "Shadorossa" }
	}
}


--- INA PACKS
local Consts = {
	max_quantity = 4,
	strats = 1,
	trainings = 1
}

local CARD_ORDER = {
	default = "Tarot",
	[Consts.max_quantity - 1] = "Strat",
	[Consts.max_quantity] = "Training",
}

local create_card_by_order = function(position_index)
	local card_type = CARD_ORDER[position_index] or CARD_ORDER.default
	return create_card(card_type, G.pack_cards, nil, nil, true, true, nil, nil)
end

local Ina_Pack = {
	name = "Ina Pack",
	key = "item_pack_ina",
	kind = "Item",
	atlas = "Boosters01",
	pos = { x = 3, y = 2 },
	config = { extra = Consts.max_quantity, choose = 1 },
	cost = 4,
	order = 1,
	weight = 1,
	draw_hand = true,
	unlocked = true,
	discovered = true,
	create_card = function(self, card, i)
		return create_card_by_order(i)
	end,
	loc_vars = function(self, info_queue, card)
		local tarots = Consts.max_quantity - Consts.strats - Consts.trainings
		return { vars = { card.config.center.config.choose, tarots, Consts.strats, Consts.trainings } }
	end,
	group_key = "k_ina_item_pack",
}

return {
	name = "Boosters01",
	list = { Raimon, Occult, RoyalAcademy, Wild, Brain, Otaku, Inazuma, Shuriken, Farm, Kirkwood, Zeus,
		Ina_Pack }
}
