-- ENABLE DYNAMIC WEIGHT FOR BOOSTERS
local function get_weight(v)
    if type(v.weight) == "function" then return v.weight() end
    return v.weight or 1
end

function get_pack(_key, _type)
    if not G.GAME.first_shop_buffoon and not G.GAME.banned_keys['p_buffoon_normal_1'] then
        G.GAME.first_shop_buffoon = true
        return G.P_CENTERS['p_buffoon_normal_' .. (math.random(1, 2))]
    end
    local cume, it, center = 0, 0, nil
    for k, v in ipairs(G.P_CENTER_POOLS['Booster']) do
        if (not _type or _type == v.kind) and not G.GAME.banned_keys[v.key] then
            cume = cume + get_weight(v)
        end
    end
    local poll = pseudorandom(pseudoseed((_key or 'pack_generic') .. G.GAME.round_resets.ante)) * cume
    for k, v in ipairs(G.P_CENTER_POOLS['Booster']) do
        if not G.GAME.banned_keys[v.key] then
            if not _type or _type == v.kind then
                it = it + get_weight(v)
            end
            if it >= poll and it - get_weight(v) <= poll then
                center = v; break
            end
        end
    end
    return center
end
