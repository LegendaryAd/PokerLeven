local item_list = {}

local tech_book = {
  name = "tech_book",
  key = "tech_book",
  set = "Strat",
  loc_vars = function(self, info_queue, center)
  end,
  pos = { x = 0, y = 0 },
  atlas = "Consumables",
  cost = 5,
  unlocked = true,
  discovered = true,
  can_use = function(self, card)
    return #G.jokers.cards > 0
  end,
  use = function(self, card, area, copier)
    local choice = nil
    if G.jokers.highlighted and #G.jokers.highlighted == 1 then
      choice = G.jokers.highlighted[1]
    elseif G.jokers.cards and #G.jokers.cards > 0 then
      choice = G.jokers.cards[1]
    else
      return
    end
    apply_property_sticker(choice, nil, "type")
    card_eval_status_text(choice, 'extra', nil, nil, nil,
      { message = localize("ina_training"), colour = G.C.SECONDARY_SET.Spectral })
  end,
  in_pool = function(self)
    return true
  end
}

local tactic_pos = {
  name = "tactic_pos",
  key = "tactic_pos",
  set = "Strat",
  loc_vars = function(self, info_queue, center)
  end,
  pos = { x = 1, y = 0 },
  atlas = "Consumables",
  cost = 5,
  unlocked = true,
  discovered = true,
  can_use = function(self, card)
    return #G.jokers.cards > 0
  end,
  use = function(self, card, area, copier)
    local choice = nil
    if G.jokers.highlighted and #G.jokers.highlighted == 1 then
      choice = G.jokers.highlighted[1]
    elseif G.jokers.cards and #G.jokers.cards > 0 then
      choice = G.jokers.cards[1]
    else
      return
    end
    apply_property_sticker(choice, nil, "position")
    card_eval_status_text(choice, 'extra', nil, nil, nil,
      { message = localize("ina_training"), colour = G.C.SECONDARY_SET.Spectral })
  end,
  in_pool = function(self)
    return true
  end
}

local increase_technique = {
  name = "increase_technique",
  key = "increase_technique",
  set = "Strat",
  loc_vars = function(self, info_queue, center)
  end,
  pos = { x = 1, y = 0 },
  atlas = "Consumables",
  cost = 3,
  unlocked = true,
  discovered = true,
  can_use = function(self, card)
    return #G.jokers.cards > 0
  end,
  use = function(self, card, area, copier)
    local choice = nil
    if G.jokers.highlighted and #G.jokers.highlighted == 1 then
      choice = G.jokers.highlighted[1]
    elseif G.jokers.cards and #G.jokers.cards > 0 then
      choice = G.jokers.cards[1]
    else
      return
    end
    increment_technique(choice)
    choice.ability["ina_tech_level3_sticker"] = true
    card_eval_status_text(choice, 'extra', nil, nil, nil,
      { message = localize("ina_technique_upgrade"), colour = G.C.SECONDARY_SET.Spectral })
  end,
  in_pool = function(self)
    return true
  end
}

return {
  name = "Strats",
  list = { tech_book, tactic_pos, increase_technique }
}
