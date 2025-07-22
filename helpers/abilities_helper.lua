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
        card_eval_status_text(target, 'extra', nil, nil, nil, { message = localize('ina_val_down'), colour = G.C.RED })
        if not one_way then
            card.ability.extra_value = card.ability.extra_value or 0
            card.ability.extra_value = card.ability.extra_value + amt_drained
            card:set_cost()
            card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_val_up') })
        end
    end
end
