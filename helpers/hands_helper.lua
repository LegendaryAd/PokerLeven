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

-- Función genérica para Upgradear manos por requisitos de cartas.
Upgrade_hand = function(context, card_id, required_count, card, target_hand, message_key)
    if context.after and context.cardarea == G.jokers then
        local rankCount = 0
        for i, c in ipairs(context.scoring_hand) do
            if c:get_id() == card_id then
                rankCount = rankCount + 1
            end
        end
        if rankCount >= required_count then
            return {
                level_up = card.ability.extra.levels,
                level_up_hand = target_hand,
                message = localize(message_key)
            }
        end
    end
end
