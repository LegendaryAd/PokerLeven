find_player_type = function(target_type)
    local found = {}
    if G.jokers and G.jokers.cards then
        for k, v in pairs(G.jokers.cards) do
            if v.ability and ((v.ability.extra and type(v.ability.extra) == "table"
                    and target_type == v.ability.extra.ptype) or v.ability[string.lower(target_type) .. "_sticker"]) then
                table.insert(found, v)
            end
        end
    end
    return found
end

find_player_position = function(target_type)
    local found = {}
    if G.jokers and G.jokers.cards then
        for k, v in pairs(G.jokers.cards) do
            if v.ability and ((v.ability.extra and type(v.ability.extra) == "table"
                    and target_type == v.ability.extra.pposition) or v.ability[string.lower(target_type) .. "_sticker"]) then
                table.insert(found, v)
            end
        end
    end
    return found
end

--- Returns players of target type and position
---@param target_type string the type of the player
---@param target_position string the position of the player
---@return table
Pokerleven.find_player_type_and_position = function(target_type, target_position)
    local found = {}
    if G.jokers and G.jokers.cards then
        for _, v in pairs(G.jokers.cards) do
            if v.ability and v.ability.extra and type(v.ability.extra) == "table" then
                if v.ability.extra.ptype == target_type and v.ability.extra.pposition == target_position then
                    table.insert(found, v)
                end
            end
        end
    end
    return found
end

find_player_team = function(target_type)
    local found = {}
    if G.jokers and G.jokers.cards then
        for k, v in pairs(G.jokers.cards) do
            if v.ability and ((v.ability.extra and type(v.ability.extra) == "table"
                    and target_type == v.ability.extra.pteam) or v.ability[string.lower(target_type) .. "_sticker"]) then
                table.insert(found, v)
            end
        end
    end
    return found
end

is_team = function(card, target_team)
    if card.ability and (card.ability.extra and type(card.ability.extra) == "table" and target_team == card.ability.extra.pteam) then
        return true
    else
        return false
    end
end

is_position = function(card, target_position)
    if card.ability and (card.ability.extra and type(card.ability.extra) == "table" and target_position == card.ability.extra.pposition) then
        return true
    else
        return false
    end
end

is_type = function(card, target_type)
    if card.ability and (card.ability.extra and type(card.ability.extra) == "table" and target_type == card.ability.extra.ptype) then
        return true
    else
        return false
    end
end

get_team = function(card)
    if card.ability then
        if type(card.ability.extra) == "table" and card.ability.extra.pteam then
            return card.ability.extra.pteam
        end
    end
    return nil
end

player_in_pool = function(self)
    if next(find_joker("Custom")) and self.ptype == "Wind" then
        return true
    end
    local name
    if not self.name and self.ability.name then
        name = self.ability.name
    else
        name = self.name or "Mark"
    end
    if next(find_joker(name)) or self.special then
        return false
    else
        return true
    end
end

get_adjacent_jokers = function(card)
    local jokers = {}
    if #G.jokers.cards > 1 then
        local pos = 0
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                pos = i
                break
            end
        end
        if pos > 1 and G.jokers.cards[pos - 1] then
            table.insert(jokers, G.jokers.cards[pos - 1])
        end
        if pos < #G.jokers.cards and G.jokers.cards[pos + 1] then
            table.insert(jokers, G.jokers.cards[pos + 1])
        end
    end
    return jokers
end

-- Creates random card
create_random_ina_joker = function(pseed, inararity, area, inateam, enable_dupes)
    local create_args = { set = "Joker", area = nil, key = '' }
    create_args.key = get_random_joker_key(pseed, inararity, area, inateam, nil, enable_dupes or nil)

    return SMODS.create_card(create_args)
end

get_random_joker_key = function(pseed, inararity, area, inateam, exclude_keys, enable_dupes)
    local ina_keys = {}
    local inaarea = area or G.jokers
    local ina_key
    exclude_keys = exclude_keys or {}

    if inararity and type(inararity) == "string" then
        if string.lower(inararity) == "common" then inararity = 1 end
        if string.lower(inararity) == "uncommon" then inararity = 2 end
        if string.lower(inararity) == "rare" then inararity = 3 end
    end

    for _, v in pairs(G.P_CENTERS) do
        if v.pteam and not (inararity and v.rarity ~= inararity)
            and not (inateam and inateam ~= v.pteam)
            and player_in_pool(v)
            and not v.aux_ina
            and not exclude_keys[v.key] then
            local no_dup = true
            if not enable_dupes and G.jokers and G.jokers.cards and not next(find_joker("Showman")) then
                for _, m in pairs(G.jokers.cards) do
                    if v.key == m.config.center_key then
                        no_dup = false
                        break
                    end
                end
            end

            if no_dup then
                table.insert(ina_keys, v.key)
            end
        end
    end

    if #ina_keys == 0 and enable_dupes then
        for _, v in pairs(G.P_CENTERS) do
            if v.pteam and not (inararity and v.rarity ~= inararity)
                and not (inateam and inateam ~= v.pteam)
                and player_in_pool(v)
                and not v.aux_ina
                and not exclude_keys[v.key] then
                table.insert(ina_keys, v.key)
            end
        end
    end

    if #ina_keys > 0 then
        ina_key = pseudorandom_element(ina_keys, pseudoseed(pseed))
    else
        ina_key = "j_ina_Willy"
    end

    return ina_key
end

--- Spawns a random Ina Joker with custom rarity/team tables.
---@param card table The card triggering the effect
---@param context table The current game context
---@param rarity_table table<string, number> A table of rarities and their corresponding chance
---@param team_table table<string, number> A table of team names and their corresponding chance
---@return table Effect table with a `.func` function to be executed to spawn the joker
function spawn_random_ina_joker(card, context, rarity_table, team_table)
    local function roll_from_table(t, seed)
        local roll = pseudorandom(seed)
        local cumulative = 0
        for key, chance in pairs(t) do
            cumulative = cumulative + chance
            if roll < cumulative then return key end
        end

        local last_key = nil
        for k in pairs(t) do last_key = k end
        return last_key
    end

    return {
        func = function()
            local created_joker = false
            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                created_joker = true
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1

                local rarity = roll_from_table(rarity_table, 'ina_rarity')
                local team = roll_from_table(team_table, 'ina_team')

                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        G.GAME.joker_buffer = 0
                        print("Rarity:", rarity)
                        print("Team:", team)
                        local _card = create_random_ina_joker('sweet', rarity, G.jokers, team, true)
                        _card:add_to_deck()
                        G.jokers:emplace(_card)
                        return true
                    end
                }))
            end

            if created_joker then
                card.ability.extra.triggered = true
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {
                    message = localize('k_plus_joker'),
                    colour = G.C.BLUE
                })
            end

            return true
        end
    }
end

--- Returns the average sell value of a group of type jokers
---@param ptype string The reference type
---@return number|nil avg_sell_value Average sell value of the group of jokers. Nil for collection
calculate_avg_sell_cost = function(ptype)
    local sumSellCost = 0
    if G.jokers then
        for _, v in pairs(G.jokers.cards) do
            if ptype == nil then
                sumSellCost = sumSellCost + v.sell_cost
            else
                if v.ability.extra.ptype == ptype then
                    sumSellCost = sumSellCost + v.sell_cost
                end
            end
        end

        if ptype == nil then
            return sumSellCost / #G.jokers.cards
        else
            return sumSellCost / #find_player_type(ptype)
        end
    end

    return nil
end

--- Returns the joker to the right of the given joker in the active jokers row.
---@param main_card SMODS.Joker The reference joker.
---@return SMODS.Joker|nil Right_Joker Joker immediately to the right, or nil if not found or at the end.
function get_right_joker(main_card)
    sendDebugMessage("Looking for main_card in G.jokers.cards")
    for k, v in ipairs(G.jokers.cards) do
        if v == main_card then
            sendDebugMessage("Index: " .. k .. " Card: " .. tostring(v))
            return G.jokers.cards[k + 1]
        end
    end
    sendDebugMessage("main_card: " .. tostring(main_card))
    return nil
end
