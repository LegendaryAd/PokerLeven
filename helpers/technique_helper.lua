-- Multipliers for  technique upgrades
technique_values = {
    money = .3,
    mult_mod = .2,
    chip_mod = .2,
    Xmult_mod = .2,
    Xchip_mod = .2
}

plus_stickers = { "ina_tech_plus1_sticker", "ina_tech_plus2_sticker", "ina_tech_plus3_sticker", "ina_tech_plus4_sticker",
    "ina_tech_plus5_sticker" }

number_stickers = { "ina_tech_number2_sticker", "ina_tech_number3_sticker", "ina_tech_number4_sticker",
    "ina_tech_numbera_sticker",
    "ina_tech_numbers_sticker", "ina_tech_numberz_sticker", "ina_tech_numberinf_sticker" }

grade_stickers = { "ina_tech_grade2_sticker", "ina_tech_grade3_sticker", "ina_tech_grade4_sticker",
    "ina_tech_grade5_sticker",
    "ina_tech_grade0_sticker" }

new_stickers = { "ina_tech_j_sticker", "ina_tech_q_sticker", "ina_tech_k_sticker", "ina_tech_a_sticker",
    "ina_tech_joker_sticker" }

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
    set_sticker(card)
end

-- Sets the appropriate sticker for the current technique type and level and removes the previous one (if any)
set_sticker = function(card)
    local tech_level = card.ability.extra.tech_level

    local sticker_map = {
        plus = plus_stickers,
        number = number_stickers,
        grade = grade_stickers
    }

    local sticker_list = sticker_map[card.ability.extra.techtype] or new_stickers

    if tech_level > 1 then
        local old_sticker_key = sticker_list[tech_level - 1]
        card.ability[old_sticker_key] = false
    end

    local new_sticker_key = sticker_list[tech_level]
    card.ability[new_sticker_key] = true
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

-- Returns true if the card matches the type and position and its technique level is below the max
can_upgrade_tech_level = function(card, type, position)
    return is_type(card, type) and is_position(card, position) and
        (card.ability.extra.tech_level or 0) < G.GAME.max_tech_level
end
