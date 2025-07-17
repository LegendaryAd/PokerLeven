-- Kevin Dragonfly
local Kevin = {
    name = "Kevin", 
    pos = {x = 0, y = 0},
    config = {extra = {retriggers = 1, triggered = false}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {}}
    end,
    rarity = 2,
    pools = { ["Raimon"] = true },
    cost = 8, 
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "FW",
    pteam = "Raimon",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
          card.ability.extra.triggered = true;
          local index
          for k, v in ipairs(G.jokers.cards) do
              if v == card then
                  index = k
                  break
              end
          end
          if context.other_card == G.jokers.cards[index+1] and is_position(context.other_card,"FW") then
            return {
              message = localize("k_again_ex"),
              repetitions = card.ability.extra.retriggers,
              card = card,
            }
          else
            return nil, true
          end
        end
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
    rarity = 4,
    pools = { ["Raimon"] = true }, 
    cost = 11, 
    atlas = "Jokers01",
    ptype = "Mountain",
    pposition = "GK",
    pteam = "Raimon",
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
    set_sprites = function(self, card, front)
      if card.children and card.children.center and card.children.center.set_visible then
        card.children.center:set_visible(true)
      end
    end,
  }

-- Nathan
local Nathan = {
    name = "Nathan", 
    pos = {x = 2, y = 0},
    config = {extra = {xmult = 1.5, triggered = false}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      local count = #find_player_team("Raimon");
      return {vars = {count, center.ability.extra.xmult}}
    end,
    rarity = 2,
    pools = { ["Raimon"] = true }, 
    cost = 7, 
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "DF",
    pteam = "Raimon",
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.other_joker and is_team(context.other_joker, "Raimon") then
          card.ability.extra.triggered = true;
          G.E_MANAGER:add_event(Event({
            func = function()
              context.other_joker:juice_up(0.5, 0.5)
              return true
            end
          }))
          return {
            message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xmult}}, 
            colour = G.C.XMULT,
            Xmult_mod = card.ability.extra.xmult
          }
      end
    end,
  }

-- Jack
local Jack = {
    name = "Jack", 
    pos = {x = 3, y = 0},
    config = {extra = {chips_mod = 8, triggered = false}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.chips_mod}}
    end,
    rarity = 2,
    pools = { ["Raimon"] = true }, 
    cost = 6, 
    atlas = "Jokers01",
    ptype = "Mountain",
    pposition = "DF",
    pteam = "Raimon",
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play 
        and not context.other_card.debuff and not context.end_of_round
        and SMODS.has_enhancement(context.other_card, 'm_stone') then
          card.ability.extra.triggered = true;

          local count = #find_player_position("DF");
          context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0;
          context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.chips_mod*count;
          return {
              extra = {message = localize('k_upgrade_ex'), colour = G.C.CHIPS},
              colour = G.C.CHIPS,
              card = card
          }
      end
    end,
}

-- Axel Blaze
local Axel = {
    name = "Axel", 
    pos = {x = 4, y = 0},
    config = {extra = {xmult = 3.5, suit = "Hearts", triggered = false}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.xmult}}
    end,
    rarity = 3,
    pools = { ["Raimon"] = true }, 
    cost = 8, 
    atlas = "Jokers01",
    ptype = "Fire",
    pposition = "FW",
    pteam = "Raimon",
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.joker_main and context.scoring_hand then
        local count = 0
          for i = 1, #context.scoring_hand do
              if context.scoring_hand[i]:is_suit(card.ability.extra.suit) then
                count = count + 1
              end
          end
          if count == 5 then
            card.ability.extra.triggered = true
            return {
              message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xmult}},
              colour = G.C.MULT,
              Xmult_mod = card.ability.extra.xmult
            }
          end
      end
    end,
}

-- Shadow
local Shadow = {
    name = "Shadow", 
    pos = {x = 5, y = 0},
    config = {extra = {current_mult = 0, mult_mod = 2}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.current_mult, center.ability.extra.mult_mod}}
    end,
    rarity = 1,
    pools = { ["Raimon"] = true }, 
    cost = 4, 
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "FW",
    pteam = "Raimon",
    blueprint_compat = true,
    calculate = function(self, card, context)

      if context.cardarea == G.jokers and context.scoring_hand and context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.current_mult}}, 
          colour = G.C.MULT,
          mult_mod = card.ability.extra.current_mult
        }
      end

      if context.after and not card.debuff then
        local other_triggered = false
        for _, j in ipairs(G.jokers.cards) do
          if j ~= card and j.ability and j.ability.extra and j.ability.extra.triggered then
            other_triggered = true
            break
          end
        end
        for _, c in ipairs(G.jokers.cards) do
          if c.ability and c.ability.extra then
            c.ability.extra.triggered = false
           end
        end
        if not other_triggered then
          card.ability.extra.current_mult = (card.ability.extra.current_mult or 0) + card.ability.extra.mult_mod
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT
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
    rarity = 2,
    pools = { ["Raimon"] = true }, 
    cost = 3, 
    atlas = "Jokers01",
    ptype = "Forest",
    pposition = "FW",
    pteam = "Raimon",
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
    config = {extra = {chip_mod = 40, triggered = false}},
    loc_vars = function(self, info_queue, center)
      local count = #find_player_type("Wind")
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.chip_mod, count*center.ability.extra.chip_mod}}
    end,
    rarity = 1,
    pools = { ["Raimon"] = true }, 
    cost = 4, 
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "FW",
    pteam = "Raimon",
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand then
        if context.joker_main then
          local count = #find_player_type("Wind");
          card.ability.extra.triggered = true;
          return {
            message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chip_mod*count}}, 
            colour = G.C.CHIPS,
            chip_mod = card.ability.extra.chip_mod*count;
          }
        end
      end
    end,
  } 

-- Peabody
local Peabody = {
    name = "Peabody", 
    pos = {x = 8, y = 0},
    config = {extra = {current_mult = 0, mult_mod = 4, triggered = false}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.current_mult, center.ability.extra.mult_mod}}
    end,
    rarity = 1,
    pools = { ["Raimon"] = true }, 
    cost = 5, 
    atlas = "Jokers01",
    ptype = "Wind",
    pposition = "GK",
    pteam = "Raimon",
    blueprint_compat = true,
    calculate = function(self, card, context)
      if context.cardarea == G.jokers and context.scoring_hand and  G.GAME.current_round.hands_left == 0 then
        if context.before and not context.blueprint then
          card.ability.extra.current_mult = 
            card.ability.extra.current_mult + card.ability.extra.mult_mod;
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT
          }
        end
        if context.joker_main then
          card.ability.extra.triggered = true;
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.current_mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.current_mult
          }
        end
      end
    end
}

return {
  name = "Raimon",
  list = { Kevin, Mark, Nathan, Jack, Axel, Shadow, Willy, Max, Peabody },
}
