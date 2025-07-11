-- Kevin Dragonfly
local Kevin = {
    name = "Kevin", 
    pos = {x = 0, y = 0},
    config = {extra = {mult = 0, mult_mod = 2}, evo_rqmt = 6},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult, center.ability.extra.mult_mod, center.ability.evo_rqmt}}
    end,
    rarity = 1, 
    cost = 3, 
    atlas = "Jokers01",
    stage = "Zero", 
    ptype = "Forest",
    pposition = "FW",
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand and  G.GAME.current_round.hands_left == 0 then
        if context.before and not context.blueprint then
          card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT
          }
        end
        if context.joker_main then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
          }
        end
      end
      return scaling_evo(self, card, context, "j_ina_Mark", card.ability.extra.mult, self.config.evo_rqmt)
    end,
  }

-- Mark Evans
local Mark = {
    name = "Mark", 
    pos = {x = 1, y = 0},
    config = {extra = {mult = 0, mult_mod = 4, mult_mod2 = 0}, evo_rqmt = 30},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult, center.ability.extra.mult_mod, center.ability.evo_rqmt}}
    end,
    rarity = 1, 
    cost = 3, 
    atlas = "Jokers01",
    stage = "One", 
    ptype = "Mountain",
    pposition = "GK",
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand and  G.GAME.current_round.hands_left == 0 then
        if context.joker_main then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
          }
        end
      end
      return scaling_evo(self, card, context, "j_ina_Nathan", card.ability.extra.mult, self.config.evo_rqmt)
    end,
  }

-- Nathan
local Nathan = {
    name = "Nathan", 
    pos = {x = 2, y = 0},
    config = {extra = {xmult = 3, xmult_mod = 0.25}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.xmult, center.ability.extra.xmult_mod, center.ability.evo_rqmt}}
    end,
    rarity = 1, 
    cost = 3, 
    atlas = "Jokers01",
    stage = "Two", 
    ptype = "Air",
    pposition = "DF",
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand and  G.GAME.current_round.hands_left == 0 then
        if context.before and not context.blueprint then
          card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.XMULT
          }
        end
        if context.joker_main then
          return {
            message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xmult}}, 
            colour = G.C.XMULT,
            xmult_mod = card.ability.extra.xmult
          }
        end
      end
    end,
  }

-- Jack
local Jack = {
    name = "Jack", 
    pos = {x = 3, y = 0},
    config = {extra = {mult = 15}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult}}
    end,
    rarity = 1, 
    cost = 3, 
    atlas = "Jokers01",
    ptype = "Mountain",
    pposition = "DF",
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand and  G.GAME.current_round.hands_left == 0 then
        if context.joker_main then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
          }
        end
      end
    end,
  }

-- Axel Blaze
local Axel = {
    name = "Axel", 
    pos = {x = 4, y = 0},
    config = {extra = {mult = 15}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult}}
    end,
    rarity = 1, 
    cost = 3, 
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "FW",
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand and  G.GAME.current_round.hands_left == 0 then
        if context.joker_main then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
          }
        end
      end
    end,
  }

-- Shadow
local Shadow = {
    name = "Shadow", 
    pos = {x = 5, y = 0},
    config = {extra = {mult = 15}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult}}
    end,
    rarity = 1, 
    cost = 3, 
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "FW",
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand and  G.GAME.current_round.hands_left == 0 then
        if context.joker_main then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
          }
        end
      end
    end,
  }

  -- Willy
local Willy = {
    name = "Willy", 
    pos = {x = 6, y = 0},
    config = {extra = {mult = 15}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult}}
    end,
    rarity = 1, 
    cost = 3, 
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "FW",
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand and  G.GAME.current_round.hands_left == 0 then
        if context.joker_main then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
          }
        end
      end
    end,
  }

  -- Max
local Max = {
    name = "Max", 
    pos = {x = 7, y = 0},
    config = {extra = {mult = 15}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult}}
    end,
    rarity = 1, 
    cost = 3, 
    atlas = "Jokers01",
    ptype = "Air",
    pposition = "FW",
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand and  G.GAME.current_round.hands_left == 0 then
        if context.joker_main then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
          }
        end
      end
    end,
  }

  -- Peabody
local Peabody = {
    name = "Peabody", 
    pos = {x = 8, y = 0},
    config = {extra = {mult = 15}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult}}
    end,
    rarity = 1, 
    cost = 3, 
    atlas = "Jokers01",
    ptype = "Montain",
    pposition = "GK",
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand and  G.GAME.current_round.hands_left == 0 then
        if context.joker_main then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
          }
        end
      end
    end,
  }

return {
  name = "Players",
  list = { Kevin, Mark, Nathan, Jack, Axel, Shadow, Willy, Max, Peabody },
}
