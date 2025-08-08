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

local full_mansion = P({
    key = "FullMansion",
    visible = true,
    chips = 220,
    mult = 22,
    l_chips = 40,
    l_mult = 4,
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
    visible = true,
    chips = 250,
    mult = 26,
    l_chips = 40,
    l_mult = 4,
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
    list = { full_mansion, god_hand }
}
