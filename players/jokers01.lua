-- Mark Evans as a little boy
local markevansboy = {
    name = "markevansboy", 
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
    ptype = "Mountain",
    pposition = "GK",
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
      return scaling_evo(self, card, context, "j_ina_markevansschool", card.ability.extra.mult, self.config.evo_rqmt)
    end,
  }

  -- Mark evans in school
  local markevansschool = {
    name = "markevansschool", 
    pos = {x = 1, y = 0},
    config = {extra = {mult = 0, mult_mod = 4, mult_mod2 = 0}, evo_rqmt = 30},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.mult, center.ability.extra.mult_mod, center.ability.evo_rqmt}}
    end,
    rarity = 2, 
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
      return scaling_evo(self, card, context, "j_ina_markevansadult", card.ability.extra.mult, self.config.evo_rqmt)
    end,
  }

    -- Mark evans adult
    local markevansadult = {
      name = "markevansadult", 
      pos = {x = 2, y = 0},
      config = {extra = {xmult = 3, xmult_mod = 0.25}},
      loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {vars = {center.ability.extra.xmult, center.ability.extra.xmult_mod, center.ability.evo_rqmt}}
      end,
      rarity = 3, 
      cost = 3, 
      atlas = "Jokers01",
      stage = "Two", 
      ptype = "Mountain",
      pposition = "GK",
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
              Xmult_mod = card.ability.extra.xmult
            }
          end
        end
      end,
    }

  -- Axel Blaze hooded
  local axelblazehooded = {
    name = "axelblazehooded", 
    pos = {x = 3, y = 0},
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

    -- Axel Blaze School
    local axelblazeschooler = {
      name = "axelblazeschooler", 
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

    -- Axel Blaze Adult
    local axelblazeadult = {
      name = "axelblazeadult", 
      pos = {x = 5, y = 0},
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

  return {name = "Players",
        list = { markevansboy, markevansschool, markevansadult, axelblazehooded, axelblazeschooler, axelblazeadult },
}
