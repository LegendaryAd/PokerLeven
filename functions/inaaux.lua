family ={
}

-- Credits to inarmon
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

is_type = function(card, target_type)
  if card.ability and (card.ability.extra and type(card.ability.extra) == "table" and target_type == card.ability.extra.ptype) then
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
  if next(find_joker("Custom")) and self.ptype == "Wind" then
    return true
  end 
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
  local inateam_list = {"Forest", "Fire", "Wind", "Mountain"}
  local inaposition_list = {"FW", "DF", "MF", "GK"}
  local apply_type = nil

  if sticker_type then
    apply_type = sticker_type
    card.ability[string.lower(apply_type).."_sticker"] = true
  else
    if property == "type" then
      apply_type = pseudorandom_element(inateam_list, pseudoseed("type"))
    elseif property == "position" then
      apply_type = pseudorandom_element(inaposition_list, pseudoseed("position"))
    end
    card.ability[string.lower(apply_type).."_sticker"] = true
  end

  if property == "type" then
    for l, v in pairs(inateam_list) do
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
    if t.set_rank then
      conversion_event_helper(function() SMODS.change_base(cards[i], nil, t.set_rank) end, nil, immediate)
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

-- Creates random card
create_random_ina_joker = function(pseed, inararity, area, inateam)
  local create_args = {set = "Joker", area = inaarea, key = ''}
  create_args.key = get_random_joker_key(pseed, inararity, area, inateam)

  return SMODS.create_card(create_args)
end

get_random_joker_key = function(pseed, inararity, area, inateam, exclude_keys)
  local ina_keys = {}
  local inaarea = area or G.jokers
  local ina_key
  exclude_keys = exclude_keys or {}
  
  if inararity then
    if string.lower(inararity) == "common" then inararity = 1 end
    if string.lower(inararity) == "uncommon" then inararity = 2 end
    if string.lower(inararity) == "rare" then inararity = 3 end
  end
  
  for k, v in pairs(G.P_CENTERS) do
    if v.pteam and not (inararity and v.rarity ~= inararity)
       and not (inateam and inateam ~= v.pteam) and player_in_pool(v) and not v.aux_ina and not exclude_keys[v.key] then
      local no_dup = true
      if G.jokers and G.jokers.cards and not next(find_joker("Showman")) then
        for l, m in pairs(G.jokers.cards) do
          if v.key == m.config.center_key then
            no_dup = false
          end
        end
      end
      if no_dup then
        table.insert(ina_keys, v.key)
      end
    end
  end
  
  if #ina_keys > 0 then
    ina_key = pseudorandom_element(ina_keys, pseudoseed(pseed))
  else
    ina_key = "j_ina_Willy"
  end

  return ina_key
end

-- CREDITS
local base_create_badges = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
    base_create_badges(obj, badges)

    if obj and obj.ina_credits then
        local function calc_scale_fac(text)
            local size = 0.9
            local font = G.LANG.font
            local max_text_width = 2 - 2 * 0.05 - 4 * 0.03 * size - 2 * 0.03
            local calced_text_width = 0
            for _, c in utf8.chars(text) do
                local tx = font.FONT:getWidth(c) * (0.33 * size) * G.TILESCALE * font.FONTSCALE
                    + 2.7 * 1 * G.TILESCALE * font.FONTSCALE
                calced_text_width = calced_text_width + tx / (G.TILESIZE * G.TILESCALE)
            end
            return calced_text_width > max_text_width and max_text_width / calced_text_width or 1
        end

        local strings = { "Pokerleven" }
        
        if obj.ina_credits.idea then
          for i = 1, #obj.ina_credits.idea do
              localized = localize({ type = "variable", key = "ina_idea", vars = { obj.ina_credits.idea[i] } })[1]
              strings[#strings + 1] = localized
          end
        end

        if obj.ina_credits.art then
          for i = 1, #obj.ina_credits.art do
              localized = localize({ type = "variable", key = "ina_art", vars = { obj.ina_credits.art[i] } })[1]
              strings[#strings + 1] = localized
          end
        end

        local scale_fac = {}
        local min_scale_fac = 1
        for i = 1, #strings do
            scale_fac[i] = calc_scale_fac(strings[i])
            min_scale_fac = math.min(min_scale_fac, scale_fac[i])
        end

        local ct = {}
        for i = 1, #strings do
            ct[i] = { string = strings[i] }
        end

        local badge = {
            n = G.UIT.R,
            config = { align = "cm" },
            nodes = {
                {
                    n = G.UIT.R,
                    config = {
                        align = "cm",
                        colour = G.C.RED,
                        r = 0.1,
                        minw = 2 / min_scale_fac,
                        minh = 0.36,
                        emboss = 0.05,
                        padding = 0.03 * 0.9,
                    },
                    nodes = {
                        { n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
                        {
                            n = G.UIT.O,
                            config = {
                                object = DynaText({
                                    string = ct,
                                    colours = { obj.ina_credits.text_colour or G.C.WHITE },
                                    silent = true,
                                    float = true,
                                    shadow = true,
                                    offset_y = -0.03,
                                    spacing = 1,
                                    scale = 0.33 * 0.9,
                                }),
                            },
                        },
                        { n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
                    },
                },
            },
        }

        badges[#badges] = badge
    end
end

-- CUSTOM Small Y Big Blinds
function get_new_small()
    G.GAME.perscribed_small = G.GAME.perscribed_small or {
    }
    if G.GAME.perscribed_small and G.GAME.perscribed_small[G.GAME.round_resets.ante] then 
        local ret_boss = G.GAME.perscribed_small[G.GAME.round_resets.ante] 
        G.GAME.perscribed_small[G.GAME.round_resets.ante] = nil
        return ret_boss
    end
    if G.FORCE_SMALL then return G.FORCE_SMALL end

    local eligible_bosses = {bl_small = true}
    for k, v in pairs(G.P_BLINDS) do
        if not v.small then
            -- don't add
        elseif v.in_pool and type(v.in_pool) == 'function' then
            local res, options = v:in_pool()
            eligible_bosses[k] = res and true or nil
        elseif v.small.min <= math.max(1, G.GAME.round_resets.ante) then
            eligible_bosses[k] = true
        end
    end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end

    for k, v in pairs(eligible_bosses) do
      local mod = G.P_BLINDS[k] and G.P_BLINDS[k].mod
      if pokerleven_config.custom_middle_blinds == false then
        if mod and mod.id == 'Pokerleven' then
          eligible_bosses[k] = nil
        end
      else
        if not mod or mod.id ~= 'Pokerleven' then
          eligible_bosses[k] = nil
        end
      end
    end

    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))
    
    return boss
end

function get_new_big()
    G.GAME.perscribed_big = G.GAME.perscribed_big or {
    }
    if G.GAME.perscribed_big and G.GAME.perscribed_big[G.GAME.round_resets.ante] then 
        local ret_boss = G.GAME.perscribed_big[G.GAME.round_resets.ante] 
        G.GAME.perscribed_big[G.GAME.round_resets.ante] = nil
        return ret_boss
    end
    if G.FORCE_BIG then return G.FORCE_BIG end

    local eligible_bosses = {bl_big = true}
    for k, v in pairs(G.P_BLINDS) do
        if not v.big then
            -- don't add
        elseif v.in_pool and type(v.in_pool) == 'function' then
            local res, options = v:in_pool()
            eligible_bosses[k] = res and true or nil
        elseif v.big.min <= math.max(1, G.GAME.round_resets.ante) then
            eligible_bosses[k] = true
        end
    end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end

    for k, v in pairs(eligible_bosses) do
        local is_mod = G.P_BLINDS[k].mod and G.P_BLINDS[k].mod.id == 'Pokerleven'
        
        if pokerleven_config.custom_middle_blinds == false then
            if is_mod then
                eligible_bosses[k] = nil
            end
        else
            if not is_mod then
                eligible_bosses[k] = nil
            end
        end
    end

    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))
    
    return boss
end

-- CUSTOM PROBABILITIES HOOK
local original_get_probability_vars = SMODS.get_probability_vars
function SMODS.get_probability_vars(trigger_obj, base_numerator, base_denominator, identifier, from_roll)
    local lucky = G.GAME.probabilities.new_lucky or G.GAME.probabilities.normal
    if identifier == "lucky_mult" then
        return G.GAME.probabilities.normal, 5
    elseif identifier == "lucky_money" then
        return lucky, 15
    end
    return original_get_probability_vars(trigger_obj, base_numerator, base_denominator, identifier, from_roll)
end

-- RERROLL BIG BLINDS
reroll_big = function(e) 
  stop_use()
  G.GAME.round_resets.big_rerolled = true
  G.from_boss_tag = nil  -- Por si quieres reutilizar el flag
  G.CONTROLLER.locks.big_reroll = true

  G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = function()
        play_sound('other1')
        G.blind_select_opts.big:set_role({xy_bond = 'Weak'})
        G.blind_select_opts.big.alignment.offset.y = 20
        return true
      end
  }))

  G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0.3,
    func = (function()
      local par = G.blind_select_opts.big.parent
      G.GAME.round_resets.blind_choices.Big = get_new_big()

      G.blind_select_opts.big:remove()
      G.blind_select_opts.big = UIBox{
        T = {par.T.x, 0, 0, 0},
        definition = {
          n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
            UIBox_dyn_container({create_UIBox_blind_choice('Big')}, false, get_blind_main_colour('Big'), mix_colours(G.C.BLACK, get_blind_main_colour('Big'), 0.8))
          }
        },
        config = {
          align = "bmi",
          offset = {x=0, y=G.ROOM.T.y + 9},
          major = par,
          xy_bond = 'Weak'
        }
      }

      par.config.object = G.blind_select_opts.big
      par.config.object:recalculate()
      G.blind_select_opts.big.parent = par
      G.blind_select_opts.big.alignment.offset.y = 0

      G.E_MANAGER:add_event(Event({
        blocking = false,
        trigger = 'after',
        delay = 0.5,
        func = function()
          G.CONTROLLER.locks.big_reroll = nil
          return true
        end
      }))

      save_run()
      for i = 1, #G.GAME.tags do
        if G.GAME.tags[i]:apply_to_run({type = 'new_blind_choice'}) then break end
      end

      return true
    end)
  }))
end
