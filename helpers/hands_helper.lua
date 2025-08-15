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
    if #hand > 5 or #hand < (5 - (chamaleon and 1 or 0)) then
        return ret
    else
        for j = 1, #suits do
            local t = {}
            local suit = suits[j]
            local flush_count = 0
            for i = 1, #hand do
                if hand[i]:is_suit(suit, nil, true) then
                    flush_count = flush_count + 1; t[#t + 1] = hand[i]
                end
            end
            if flush_count >= (5 - (chamaleon and 1 or 0)) then
                table.insert(ret, t)
                return ret
            end
        end
        return {}
    end
end

-- Función para contar cartas con un ID específico en una mano.
count_cards_by_id = function(scoring_hand, card_id)
    local count = 0
    for _, c in ipairs(scoring_hand) do
        if c:get_id() == card_id then
            count = count + 1
        end
    end
    return count
end

-- Función para asegurar que se cumplen los requisitos de mano establecidos según count_cards_by_id
meets_upgrade_requirements = function(scoring_hand, card_id, required_count)
    local actual_count = count_cards_by_id(scoring_hand, card_id)
    return actual_count >= required_count
end

-- Función para crear una mejora de mano.
create_hand_upgrade = function(card, target_hand, message_key)
    return {
        level_up = card.ability.extra.levels,
        level_up_hand = target_hand,
        message = localize(message_key)
    }
end
