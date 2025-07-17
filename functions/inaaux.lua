family ={
}

-- Credits to Pokermon
find_player_type = function(target_type)
  local found = {}
  if G.jokers and G.jokers.cards then
    for k, v in pairs(G.jokers.cards) do
      if v.ability and ((v.ability.extra and type(v.ability.extra) == "table"
        and target_type == v.ability.extra.ptype) or v.ability[string.lower(target_type).."_sticker"]) then
        table.insert(found, v)
      end
    end
  end
  return found
end

find_player_position = function(target_type)
  local found = {}
  if G.jokers and G.jokers.cards then
    for k, v in pairs(G.jokers.cards) do
      if v.ability and ((v.ability.extra and type(v.ability.extra) == "table"
        and target_type == v.ability.extra.pposition) or v.ability[string.lower(target_type).."_sticker"]) then
        table.insert(found, v)
      end
    end
  end
  return found
end

find_player_team = function(target_type)
  local found = {}
  if G.jokers and G.jokers.cards then
    for k, v in pairs(G.jokers.cards) do
      if v.ability and ((v.ability.extra and type(v.ability.extra) == "table"
        and target_type == v.ability.extra.pteam) or v.ability[string.lower(target_type).."_sticker"]) then
        table.insert(found, v)
      end
    end
  end
  return found
end

is_team = function(card, target_team)
  if card.ability and (card.ability.extra and type(card.ability.extra) == "table" and target_team == card.ability.extra.pteam) then
    return true
  else
    return false
  end
end

is_position = function(card, target_position)
  if card.ability and (card.ability.extra and type(card.ability.extra) == "table" and target_position == card.ability.extra.pposition) then
    return true
  else
    return false
  end
end

get_adjacent_jokers = function(card)
  local jokers = {}
  if #G.jokers.cards > 1 then
    local pos = 0
    for i = 1, #G.jokers.cards do
      if G.jokers.cards[i] == card then
        pos = i
        break
      end
    end
    if pos > 1 and G.jokers.cards[pos-1] then 
      table.insert(jokers, G.jokers.cards[pos-1])
    end
    if pos < #G.jokers.cards and G.jokers.cards[pos+1] then 
      table.insert(jokers, G.jokers.cards[pos+1])
    end
  end
  return jokers
end

drain = function(card, target, amount, one_way)
  local amt = amount
  local amt_drained = 0
  if target.sell_cost == 1 then return end
  target.ability.extra_value = target.ability.extra_value or 0
  if target.sell_cost <= amt then
    amt_drained = amt_drained + target.sell_cost - 1
    target.ability.extra_value = target.ability.extra_value - amt_drained
  else
     target.ability.extra_value = target.ability.extra_value - amt
     amt_drained = amt
  end
  
  if amt_drained > 0 then
    target:set_cost()
    card_eval_status_text(target, 'extra', nil, nil, nil, {message = localize('ina_val_down'), colour = G.C.RED})
    if not one_way then
      card.ability.extra_value = card.ability.extra_value or 0
      card.ability.extra_value = card.ability.extra_value + amt_drained
      card:set_cost()
      card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_val_up')})
    end    
  end
end

ina_set_badges = function(self, card, badges)
  local pteam = get_team(card)
  local text_colour = G.C.WHITE
  if pteam then
    local lower_pteam = string.lower(pteam)
    badges[#badges+1] = create_badge(pteam, G.ARGS.LOC_COLOURS[lower_pteam], text_colour, 1.2 )
  end
end

get_team = function(card)
  if card.ability then
    if type(card.ability.extra) == "table" and card.ability.extra.pteam then
      return card.ability.extra.pteam
    end
  end
  return nil
end

type_tooltip = function(self, info_queue, center)
    local percent
    if center.ability.extra and type(center.ability.extra) == "table" and center.ability.extra.ptype then
        info_queue[#info_queue+1] = {set = 'Other', key = center.ability.extra.ptype}
    end
    if center.ability.extra and type(center.ability.extra) == "table" and center.ability.extra.pposition then
        info_queue[#info_queue+1] = {set = 'Other', key = center.ability.extra.pposition}
    end

    if (center.ability and center.ability.extra and type(center.ability.extra) == "table" and ((center.ability.extra.energy_count or 0) + (center.ability.extra.c_energy_count or 0) > 0)) then
        info_queue[#info_queue+1] = {set = 'Other', key = "energy", vars = {(center.ability.extra.energy_count or 0) + (center.ability.extra.c_energy_count or 0), energy_max + (G.GAME.energy_plus or 0)}}
    elseif (center.ability and ((center.ability.energy_count or 0) + (center.ability.c_energy_count or 0) > 0)) then
        info_queue[#info_queue+1] = {set = 'Other', key = "energy", vars = {(center.ability.energy_count or 0) + (center.ability.c_energy_count or 0), energy_max + (G.GAME.energy_plus or 0)}}
    end
end

copy_scaled_values = function(card)
    local values = {mult = 0, chips = 0, Xmult = 0, money = 0}
    if card.ability and card.ability.extra and type(card.ability.extra) == "table" then
      for l, v in pairs(values) do
        if card.ability.extra[l] and (card.ability.extra[l.."_mod"] or card.ability.extra[string.sub(l, 1, -2).."_mod"]) then
          values[l] = card.ability.extra[l]
        end
      end
    end
    return values
  end

ina_evolve = function(card, to_key, immediate)
    if immediate then
      ina_backend_evolve(card, to_key)
    else
      G.E_MANAGER:add_event(Event({
        func = function()
          if card.evolution_timer or G.P_CENTERS[to_key] == card.config.center then return true end
          card.evolution_timer = 0
          G.E_MANAGER:add_event(Event({
              trigger = 'ease',
              ref_table = card,
              ref_value = 'evolution_timer',
              ease_to = 1.5,
              delay = 2.0,
              func = (function(t) return t end)
          }))
          G.E_MANAGER:add_event(Event({
            func = function()
              ina_backend_evolve(card, to_key)
              return true
            end
          }))
          G.E_MANAGER:add_event(Event({
              trigger = 'ease',
              ref_table = card,
              ref_value = 'evolution_timer',
              ease_to = 2.25,
              delay = 1.0,
              func = (function(t) return t end)
          }))
          G.E_MANAGER:add_event(Event({
            func = function()
              card.evolution_timer = nil
              play_sound('tarot1')
              card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize("ina_evolve_success"), colour = G.C.FILTER, instant = true})
              return true
            end
          }))
          return true
        end
      }))
    end
end

ina_backend_evolve = function(card, to_key)
    local new_card = G.P_CENTERS[to_key]
    if card.config.center == new_card then return end
  
    local old_key = card.config.center.key
  
    if card.ability.perishable and card.ability.perish_tally > 0 then
      card.ability.perish_tally = G.GAME.perishable_rounds
    end
  
    local names_to_keep = {"targets", "rank", "id", "cards_scored", "upgrade", "mult", "mult_mod"}
    local values_to_keep = copy_scaled_values(card)
    if type(card.ability.extra) == "table" then
      for _, k in pairs(names_to_keep) do
        values_to_keep[k] = card.ability.extra[k]
      end
    end

    card.children.center = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS[new_card.atlas], new_card.pos)
    card.children.center.states.hover = card.states.hover
    card.children.center.states.click = card.states.click
    card.children.center.states.drag = card.states.drag
    card.children.center.states.collide.can = false
    card.children.center:set_role({major = card, role_type = 'Glued', draw_major = card})
    card:set_ability(new_card, true)
    card:set_cost()

    if type(card.ability.extra) == "table" then
        for k,v in pairs(values_to_keep) do
          if card.ability.extra[k] then
            if type(card.ability.extra[k]) ~= "number" or (type(v) == "number" and v > card.ability.extra[k]) then
              card.ability.extra[k] = v
            end
          end
        end
      end
  
    if new_card.soul_pos then
      card.children.floating_sprite = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS[new_card.atlas], new_card.soul_pos)
      card.children.floating_sprite.role.draw_major = card
      card.children.floating_sprite.states.hover.can = false
      card.children.floating_sprite.states.click.can = false
    elseif card.children.floating_sprite then
      card.children.floating_sprite:remove()
      card.children.floating_sprite = nil
    end
  
    if not card.edition then
      card:juice_up()
      play_sound('generic1')
    else
      card:juice_up(1, 0.5)
      if card.edition.foil then play_sound('foil1', 1.2, 0.4) end
      if card.edition.holo then play_sound('holo1', 1.2*1.58, 0.4) end
      if card.edition.polychrome then play_sound('polychrome1', 1.2, 0.7) end
      if card.edition.negative then play_sound('negative', 1.5, 0.4) end
    end
  
    local to_fix = {}
    for k,_ in pairs(G.GAME.used_jokers) do
      if not next(SMODS.find_card(k, true)) then
        table.insert(to_fix, k)
      end
    end
    for _,k in pairs(to_fix) do
      G.GAME.used_jokers[k] = nil
    end
end

can_evolve = function(self, card, context, forced_key, ignore_step, allow_level)
    if not G.P_CENTERS[forced_key] then return false end
    if not allow_level then return false end
    if ((not context.repetition and not context.individual and context.end_of_round) or ignore_step) and not context.blueprint and not card.gone then
      return true
    else
      return false
    end
 end
  
level_evo = function(self, card, context, forced_key)
      if not card.ability.extra.rounds then return end
      if card.debuff then return end
      if can_evolve(self, card, context, forced_key, nil, true) then
        if card.ability.extra.rounds > 0 then
          card.ability.extra.rounds = card.ability.extra.rounds - 1
        end
        if card.ability.extra.rounds <= 0 then
          return {
            message = ina_evolve(card, forced_key)
          }
        elseif card.ability.extra.rounds > 0 then
          card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize("ina_evolve_level")})
        end
      elseif can_evolve(self, card, context, forced_key, nil, true) then
        if card.ability.extra.rounds > 0 then
          card.ability.extra.rounds = card.ability.extra.rounds - 1
          card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize("ina_evolve_level")})
        end
      end
      if can_evolve(self, card, context, forced_key, nil, true) and card.ability.extra.rounds <= 1 and not card.ability.extra.juiced then
        card.ability.extra.juiced = true
        local eval = function(card) return card.ability.extra.rounds and card.ability.extra.rounds <= 1 and not card.REMOVED end
        juice_card_until(card, eval, true)
      end
end

scaling_evo = function (self, card, context, forced_key, current, target)
    if can_evolve(self, card, context, forced_key) and current >= target then
      return {
        message = ina_evolve(card, forced_key)
      }
    end
    if can_evolve(self, card, context, forced_key, true) and current >= target then
      if not card.ability.extra.juiced then
        card.ability.extra.juiced = true
        local eval = function(card) return current >= target and not card.REMOVED and not G.RESET_JIGGLES end
        juice_card_until(card, eval, true)
      end
    end
  end
  


get_family_keys = function(cardname, custom_prefix, card)
    local keys = {}
    local line = nil
    local extra = nil
    custom_prefix = custom_prefix and 'j_'..custom_prefix..'_' or 'j_ina_'
    for k, v in pairs(family) do
      for x, y in pairs(v) do
        if y == cardname or (type(y) == "table" and y.key == cardname) then line = v; break end
      end
    end
    if line then
      for i = 1, #line do
        if type(line[i]) == "table" then
          local new_table = {}
          new_table.key = custom_prefix..line[i].key
          for k, v in pairs(line[i]) do
            if k ~= 'key' then
              new_table[k] = v
            end
          end
          table.insert(keys, new_table)
        else
          table.insert(keys, custom_prefix..line[i])
        end
      end
    else
      table.insert(keys, custom_prefix..cardname)
    end
    if extra and #extra > 0 then
      for i = 2, #extra do
        if type(extra[i]) == "table" then
          local extra_table = {}
          extra_table.key = custom_prefix..extra[i].key
          for k, v in pairs(extra[i]) do
            if k ~= 'key' then
              extra_table[k] = v
            end
          end
          table.insert(keys, extra_table)
        else
          table.insert(keys, custom_prefix..extra[i])
        end
      end
    end
    return keys
  end

player_in_pool = function (self)
  local name
  if not self.name and self.ability.name then
    name = self.ability.name
  else
    name = self.name or "Mark"
  end
  if next(find_joker(name)) then
    return false
  else
    return true
  end
end

apply_type_sticker = function(card, sticker_type, property)
  local inatype_list = {"Forest", "Fire", "Wind", "Mountain"}
  local inaposition_list = {"FW", "DF", "MF", "GK"}
  local apply_type = nil

  if sticker_type then
    apply_type = sticker_type
    card.ability[string.lower(apply_type).."_sticker"] = true
  else
    if property == "type" then
      apply_type = pseudorandom_element(inatype_list, pseudoseed("type"))
    elseif property == "position" then
      apply_type = pseudorandom_element(inaposition_list, pseudoseed("position"))
    end
    card.ability[string.lower(apply_type).."_sticker"] = true
  end

  if property == "type" then
    for l, v in pairs(inatype_list) do
      if string.lower(v) ~= string.lower(apply_type) then
        card.ability[string.lower(v).."_sticker"] = false
      end
    end
  end

  if property == "position" then
    for l, v in pairs(inaposition_list) do
      if string.lower(v) ~= string.lower(apply_type) then
        card.ability[string.lower(v).."_sticker"] = false
      end
    end
  end

  if property == "type" then 
    if card.ability and card.ability.extra and type(card.ability.extra) == "table" and card.ability.extra.ptype then
      card.ability.extra.ptype = apply_type 
    end
  end

  if property == "position" then 
    if card.ability and card.ability.extra and type(card.ability.extra) == "table" and card.ability.extra.pposition then
      card.ability.extra.pposition = apply_type 
    end
  end
end


-- ENABLE DYNAMIC WEIGHT FOR BOOSTERS
local function get_weight(v)
  if type(v.weight) == "function" then return v.weight() end
  return v.weight or 1
end

function get_pack(_key, _type)
  if not G.GAME.first_shop_buffoon and not G.GAME.banned_keys['p_buffoon_normal_1'] then
    G.GAME.first_shop_buffoon = true
    return G.P_CENTERS['p_buffoon_normal_'..(math.random(1, 2))]
  end
  local cume, it, center = 0, 0, nil
  for k, v in ipairs(G.P_CENTER_POOLS['Booster']) do
    if (not _type or _type == v.kind) and not G.GAME.banned_keys[v.key] then
      cume = cume + get_weight(v)
    end
  end
  local poll = pseudorandom(pseudoseed((_key or 'pack_generic')..G.GAME.round_resets.ante)) * cume
  for k, v in ipairs(G.P_CENTER_POOLS['Booster']) do
    if not G.GAME.banned_keys[v.key] then 
      if not _type or _type == v.kind then
        it = it + get_weight(v)
      end
      if it >= poll and it - get_weight(v) <= poll then center = v; break end
    end
  end
  return center
end

-- Custom flushes
function get_flush(hand)
  local ret = {}
  local chamaleon = next(find_joker('Chamaleon'))
  local suits = {
    "Spades",
    "Hearts",
    "Clubs",
    "Diamonds"
  }
  if #hand > 5 or #hand < (5 - (chamaleon and 1 or 0)) then return ret else
    for j = 1, #suits do
      local t = {}
      local suit = suits[j]
      local flush_count = 0
      for i=1, #hand do
        if hand[i]:is_suit(suit, nil, true) then flush_count = flush_count + 1;  t[#t+1] = hand[i] end 
      end
      if flush_count >= (5 - (chamaleon and 1 or 0)) then
        table.insert(ret, t)
        return ret
      end
    end
    return {}
  end
end

-- Convert cards
conversion_event_helper = function(func, delay, immediate)
  if immediate then
    func()
  else
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = delay or 0.1,
      func = function()
        func()
        return true
      end
    }))
  end
end

convert_cards_to = function(cards, t, noflip, immediate)
  if not cards then return end
  if cards and cards.is and cards:is(Card) then cards = {cards} end
  if not t.seal and not noflip then
    for i = 1, #cards do
      conversion_event_helper(function() cards[i]:flip(); cards[i]:juice_up(0.3, 0.3) end)
    end
    delay(0.2)
  end
  for i = 1, #cards do
    if t.mod_conv then
      conversion_event_helper(function() cards[i]:set_ability(G.P_CENTERS[t.mod_conv]) end, nil, immediate)
    end
    if t.edition then
      conversion_event_helper(function() cards[i]:set_edition(t.edition, true) end, nil, immediate)
    end
    if t.suit_conv then
      conversion_event_helper(function() cards[i]:change_suit(t.suit_conv) end, nil, immediate)
    end
    if t.seal then
      conversion_event_helper(function() cards[i]:set_seal(t.seal, nil, true) end, nil, immediate)
    end
    if t.random then
      vary_rank(cards[i], nil, nil, immediate)
    end
    if t.up or t.down then
      vary_rank(cards[i], not t.up, nil, immediate)
    end
    if t.bonus_chips then
      local bonus_add = function()
        cards[i].ability.perma_bonus = cards[i].ability.perma_bonus or 0
        cards[i].ability.perma_bonus = cards[i].ability.perma_bonus + t.bonus_chips
      end
      conversion_event_helper(bonus_add, nil, immediate)
    end
  end
  if not t.seal and not noflip then
    for i = 1, #cards do
      conversion_event_helper(function() cards[i]:flip(); cards[i]:juice_up(0.3, 0.3) end, 0.2)
    end
  end
  if not noflip then delay(0.3) end
  if noflip then
    for i = 1, #cards do
      conversion_event_helper(function() cards[i]:juice_up(0.3, 0.3) end, 0.2)
    end
  end
  if cards == G.hand.highlighted then
    conversion_event_helper(function() G.hand:unhighlight_all() end)
  end
end

vary_rank = function(card, decrease, seed, immediate)
  -- if it doesn't have a rank/suit within SMODS, don't do anything
  if not card.base or not card.base.value or not card.base.suit or not SMODS.Ranks[card.base.value] then return end

  local next_rank = nil
  if decrease == nil then
    -- randomize rank (decrease is nil)
    local poss_ranks = {}
    for _, v in pairs(G.P_CARDS) do
      if v.suit == card.base.suit then
        table.insert(poss_ranks, v.value)
      end
    end
    if #poss_ranks > 0 then
      next_rank = pseudorandom_element(poss_ranks, pseudoseed(seed or 'random_rank'))
    end
  elseif decrease then
    -- only need to do this due to prev being a bad table (should be fixed in the next update)
    local poss_ranks = {}
    for _, v in pairs(SMODS.Ranks[card.base.value].prev) do
      if SMODS.Ranks[v] and type(SMODS.Ranks[v].next) == "table" then
        for _, _r in pairs(SMODS.Ranks[v].next) do
          if _r == card.base.value then
            table.insert(poss_ranks, v)
            break
          end
        end
      end
    end
    if #poss_ranks > 0 then
      next_rank = pseudorandom_element(poss_ranks, pseudoseed(seed or 'decrease_rank'))
    end

    -- once prev table is fixed can use this:
    --[[
    if #SMODS.Ranks[card.base.value].prev > 0 then
      next_rank = pseudorandom_element(SMODS.Ranks[card.base.value].prev, pseudoseed(seed or 'decrease_rank'))
    end
    --]]
  else
    if #SMODS.Ranks[card.base.value].next > 0 then
      next_rank = pseudorandom_element(SMODS.Ranks[card.base.value].next, pseudoseed(seed or 'increase_rank'))
    end
  end

  if immediate then
    SMODS.change_base(card, nil, next_rank)
  else
    G.E_MANAGER:add_event(Event({
      func = function()
        SMODS.change_base(card, nil, next_rank)
        return true
      end
    }))
  end
end