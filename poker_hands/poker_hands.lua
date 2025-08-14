local get_number_of_cards_of_same_rank = function(hand)
    local selected_rank = (hand and #hand > 0) and hand[1]:get_id() or nil
    local scoring_cards = {}
    for _, card in pairs(hand) do
        if card:get_id() == selected_rank then
            table.insert(scoring_cards, card)
        end
    end
    return scoring_cards
end

local triple_pair = P({
    key = "TriplePair",
    visible = false,
    chips = 190,
    mult = 19,
    l_chips = 60,
    l_mult = 12,
    example = {
        { "S_A", true },
        { "D_A", true },
        { "H_K", true },
        { "S_K", true },
        { "D_Q", true },
        { "H_Q", true },
    },
    evaluate = function(parts, hand)
        if #parts._2 == 3 then
            return { SMODS.merge_lists(parts._2) }
        end
        return {}
    end,
    modify_display_text = function(self, cards, scoring_hand)
        return "Triple Pair"
    end
})

local full_mansion = P({
    key = "FullMansion",
    visible = false,
    chips = 220,
    mult = 22,
    l_chips = 70,
    l_mult = 15,
    example = {
        { "S_A", true },
        { "D_A", true },
        { "H_A", true },
        { "S_K", true },
        { "D_K", true },
        { "H_K", true },
    },
    evaluate = function(parts, hand)
        if #parts._3 == 2 then
            return { SMODS.merge_lists(parts._3) }
        end
        return {}
    end,
    modify_display_text = function(self, cards, scoring_hand)
        return "FullMansion"
    end
})

local god_hand = P({
    key = "GodHand",
    visible = false,
    chips = 250,
    mult = 26,
    l_chips = 80,
    l_mult = 20,
    example = {
        { "S_A", true },
        { "D_A", true },
        { "H_A", true },
        { "S_A", true },
        { "D_A", true },
        { "H_A", true },
    },
    evaluate = function(parts, hand)
        local scoring_cards = get_number_of_cards_of_same_rank(hand)
        if #scoring_cards == 6 then
            return { scoring_cards }
        end
        return {}
    end,
})

return {
    name = "Hands",
    list = { triple_pair, full_mansion, god_hand }
}
