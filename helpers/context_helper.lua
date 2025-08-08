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

---Returns true if the joker is the leftmost one
---@param card Card
---@return boolean
Pokerleven.is_leftmost_joker = function(card)
    return G.jokers.cards[1] == card
end

---Returns true if the joker is the rightmost one
---@param card Card
---@return boolean
Pokerleven.is_rightmost_joker = function(card)
    return G.jokers.cards[#G.jokers.cards] == card
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
---@param card Card
---@return boolean
Pokerleven.has_enough_barriers = function(card)
    return G.GAME.current_round.barriers >= card.ability.extra.barriers
end

--- Returns true if consumables limit > current consumables
---@return boolean
Pokerleven.has_enough_consumables_space = function()
    return G.consumeables.config.card_limit > G.consumeables.config.card_count
end
