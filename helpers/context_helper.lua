---Returns true if it's the turn of the self joker
---@param context table|CalcContext
---@return boolean?
Pokerleven.is_joker_turn = function(context)
    return context.scoring_hand and context.cardarea == G.jokers and
        context.joker_main
end

------Returns true if it's the turn of the self joker and the last hand
---@param context table|CalcContext
---@return boolean?
Pokerleven.is_joker_last_hand = function(context)
    return Pokerleven.is_joker_turn(context) and G.GAME.current_round.hands_left == 0
end

---Returns true if its the joker turn at the end of the round
---@param context table|CalcContext
---@return boolean?
Pokerleven.is_joker_end_of_round = function(context)
    return context.end_of_round and context.main_eval
end

---Returns true if the joker is the leftmost one
---@return boolean
Card.is_leftmost_joker = function(self)
    return G.jokers.cards[1] == self
end


---Returns true if the joker is the rightmost one
---@return boolean
Card.is_rightmost_joker = function(self)
    return G.jokers.cards[#G.jokers.cards] == self
end

---Emplaces joker and adds it to deck
---@param card Card
Pokerleven.add_card_to_jokers = function(card)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            G.jokers:emplace(card)
            card:add_to_deck()
            return true
        end
    }))
end

---Emplaces consumable and adds it to deck
---@param card Card
Pokerleven.add_card_to_consumables = function(card)
    if card then
        card:add_to_deck()
        G.consumeables:emplace(card)
    end
end

--- Returns true if current barriers > card.ability.extra.barriers
---@return boolean
Card.has_enough_barriers = function(self)
    return G.GAME.current_round.barriers >= self.ability.extra.barriers
end

--- Returns true if consumables limit > current consumables
---@return boolean
Pokerleven.has_enough_consumables_space = function()
    return G.consumeables.config.card_limit > G.consumeables.config.card_count
end

---Returns true if all cards played are face
---@return boolean
Pokerleven.are_all_face = function()
    for _, card in ipairs(G.play.cards) do
        if not card:is_face() then
            return false
        end
    end
    return true
end

---Returns a single card scoring or nil if it is not
---@param context table|CalcContext
---@return Card|nil
Pokerleven.card_scoring = function(context)
    if context.individual and context.cardarea == G.play and context.other_card and context.scoring_hand then
        return context.other_card
    end
    return nil
end

---Returns true if card is uneven
---@return boolean
Card.is_uneven = function(self)
    if not self:is_face() and self:get_id() % 2 ~= 0 then
        return true
    end
    return false
end
