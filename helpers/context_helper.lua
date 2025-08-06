Pokerleven.is_joker_turn = function(context)
    return context.scoring_hand and context.cardarea == G.jokers and
        context.joker_main
end

Pokerleven.is_joker_last_hand = function(context)
    return Pokerleven.is_joker_turn(context) and G.GAME.current_round.hands_left == 0
end
