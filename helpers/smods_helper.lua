-- * For using context autocomplete inside jokers
---@param data SMODS.Joker
---@return SMODS.Joker
function J(data)
    return data
end

-- * For using context autocomplete inside blinds
---@param data SMODS.Blind
---@return SMODS.Blind
function B(data)
    return data
end

-- * For using context autocomplete inside vouchers
---@param data SMODS.Voucher
---@return SMODS.Voucher
function V(data)
    return data
end

---@param data SMODS.PokerHand
---@return SMODS.PokerHand
function P(data)
    return data
end

---@param data SMODS.Challenge
---@return SMODS.Challenge
function Ch(data)
    return data
end

---@param data SMODS.Tag
---@return SMODS.Tag
function T(data)
    return data
end

---@param data SMODS.Back
---@return SMODS.Back
function Ba(data)
    return data
end

local old_calculate_individual_effect = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
    local res = old_calculate_individual_effect(effect, scored_card, key, amount, from_edition)

    if (key == 'e_mult' or key == 'emult' or key == 'Emult_mod') and amount ~= 1 then
        if effect.card then juice_card(effect.card) end
        mult = mod_mult(mult ^ amount)
        update_hand_text({ delay = 0 }, { chips = hand_chips, mult = mult })
        if not effect.remove_default_message then
            if from_edition then
                card_eval_status_text(scored_card, 'jokers', nil, percent, nil,
                    { message = "^" .. amount .. " " .. localize("k_mult"), colour = G.C.EDITION, edition = true })
            elseif key ~= 'Emult_mod' then
                if effect.emult_message then
                    card_eval_status_text(scored_card or effect.card or effect.focus, 'extra', nil, percent, nil,
                        effect.emult_message)
                else
                    card_eval_status_text(scored_card or effect.card or effect.focus, 'e_mult', amount, percent)
                end
            end
        end
        return true
    end

    return res
end

for _, v in ipairs({ 'e_mult', 'emult', 'Emult_mod' }) do
    table.insert(SMODS.calculation_keys, v)
end
