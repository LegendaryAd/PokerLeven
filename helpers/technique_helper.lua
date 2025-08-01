-- Multipliers for  technique upgrades
technique_values = {
    money = .3,
    mult_mod = .2,
    chip_mod = .2,
    Xmult_mod = .2,
    Xchip_mod = .2
}

-- Increments technique level of a joker and applies stat changes based on technique values
increment_technique = function(card)
    if card.ability.extra and type(card.ability.extra) == "table" then
        if card.ability.extra.tech_level then
            card.ability.extra.tech_level = card.ability.extra.tech_level + 1
        else
            card.ability.extra.tech_level = 1
        end
    end
    modify_values(card)
end

-- Applies value updates to a joker based on its center config and technique multipliers
modify_values = function(card)
    for name, _ in pairs(technique_values) do
        local data = card.ability.extra[name]
        if type(data) == "number" then
            local addition = technique_values[name]

            card.ability.extra[name] = data + (card.config.center.config.extra[name] * addition)

            updated_mod = card.ability.extra[name]
            rounded, frac = round_value(card.ability.extra[name], name)
            card.ability.extra[name] = rounded

            if frac then
                set_frac(card, frac, name)
            end
            frac = nil
        end
    end
end


-- Rounds a stat value based adn returns the integer part and fractional part (if applicable)
round_value = function(value, field)
    local rounded = nil
    local frac = nil

    if field == "money" or field == "mult_mod" or field == "chip_mod" then
        rounded, frac = math.modf(value)
    else
        rounded = value
    end
    return rounded, frac
end

-- Stores and manages fractional values for a joker's stat field
-- Converts to full stat point when fraction reaches 1.0+
set_frac = function(card, frac, field)
    local frac_name = field .. "_frac"
    if card.ability[frac_name] then
        card.ability[frac_name] = card.ability[frac_name] + frac
    else
        card.ability[frac_name] = frac
    end
    if card.ability[frac_name] >= 1 then
        local int, frac = math.modf(card.ability[frac_name])
        card.ability.extra[field] = card.ability.extra[field] + int
        card.ability[frac_name] = frac
    end
end
