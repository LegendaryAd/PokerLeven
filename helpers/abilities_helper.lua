drain = function(card, target, amount, one_way)
    local amt = amount
    local amt_drained = 0

    if target.sell_cost <= 0 then return end

    target.ability.extra_value = target.ability.extra_value or 0

    local max_drainable = target.sell_cost
    if max_drainable <= 0 then
        return
    end

    if amt >= max_drainable then
        amt_drained = max_drainable
    else
        amt_drained = amt
    end

    target.ability.extra_value = target.ability.extra_value - amt_drained

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
