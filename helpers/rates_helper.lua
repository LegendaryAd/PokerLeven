local function rarity_label(rarity)
    if rarity == 1 then return localize('k_common')
    elseif rarity == 2 then return localize('k_uncommon')
    elseif rarity == 3 then return localize('k_rare')
    elseif rarity == "ina_top" then return localize('k_ina_top')
    else return localize('k_rare')
    end
end

local function rarity_colour(rarity)
    if rarity == 1 then return G.C.WHITE
    elseif rarity == 2 then return G.C.GREEN
    elseif rarity == 3 then return G.C.BLUE
    elseif rarity == "ina_top" then return HEX("e7b400")
    else return G.C.UI.TEXT_LIGHT
    end
end

local function display_name(v)
    local d = G.localization and G.localization.descriptions and G.localization.descriptions[v.set]
    return d and d[v.key] and d[v.key].name or v.name or v.key
end

Pokerleven.calculate_shop_rates = function()
    local pool = {}
    for _, v in pairs(G.P_CENTERS) do
        if v.set == 'Joker' and v.pteam and v.rarity ~= 4 and not v.aux_ina then
            local ok
            if v.in_pool then
                local s, r = pcall(v.in_pool, v, { source = 'sho' })
                ok = s and r
            else
                ok = player_in_pool(v, { source = 'sho' })
            end
            if ok then
                table.insert(pool, { rarity = v.rarity or 1, weight = v.object_weight or v.weight or 1 })
            end
        end
    end

    local total = 0
    for _, j in ipairs(pool) do total = total + j.weight end

    local groups = {}
    for _, j in ipairs(pool) do
        local k = tostring(j.rarity)
        if not groups[k] then
            groups[k] = { rarity = j.rarity, label = rarity_label(j.rarity), count = 0, weight = 0 }
        end
        groups[k].count = groups[k].count + 1
        groups[k].weight = groups[k].weight + j.weight
    end

    local rarities = {}
    for _, g in pairs(groups) do
        g.percent = total > 0 and (g.weight / total * 100) or 0
        table.insert(rarities, g)
    end
    local order = { ['1'] = 1, ['2'] = 2, ['3'] = 3, ['ina_top'] = 4 }
    table.sort(rarities, function(a, b)
        local ao, bo = order[tostring(a.rarity)] or 99, order[tostring(b.rarity)] or 99
        if ao == bo then return a.weight > b.weight end
        return ao < bo
    end)

    local mod_boosters, base_w, global_w = {}, 0, 0
    if G.P_CENTER_POOLS and G.P_CENTER_POOLS.Booster then
        for _, v in ipairs(G.P_CENTER_POOLS.Booster) do
            local ok = true
            if v.in_pool then
                local s, r = pcall(v.in_pool, v, {})
                ok = s and r
            end
            if ok then
                local w = v.object_weight or v.weight or 1
                global_w = global_w + w
                if v.key and v.key:match('^p_ina_') then
                    table.insert(mod_boosters, { key = v.key, name = display_name(v), weight = w })
                else
                    base_w = base_w + w
                end
            end
        end
    end
    for _, b in ipairs(mod_boosters) do
        b.percent = global_w > 0 and (b.weight / global_w * 100) or 0
    end
    table.sort(mod_boosters, function(a, b) return a.weight > b.weight end)
    if base_w > 0 then
        table.insert(mod_boosters, {
            key = 'base_packs',
            name = localize('ina_rates_base_packs'),
            weight = base_w,
            percent = global_w > 0 and (base_w / global_w * 100) or 0,
        })
    end

    return { total_jokers = #pool, total_weight = total, rarities = rarities, boosters = mod_boosters }
end

local function spacer(h)
    return { n = G.UIT.R, config = { align = "cm", minh = h or 0.2 }, nodes = {} }
end

local function text_row(t, s)
    return {
        n = G.UIT.R, config = { align = "cm", padding = 0 },
        nodes = {
            { n = G.UIT.T, config = { text = t, scale = s or 0.35, colour = G.C.UI.TEXT_LIGHT, shadow = true } }
        }
    }
end

local function cell(text, w, colour, s)
    return {
        n = G.UIT.C, config = { align = 'cm', minw = w, padding = 0.02 },
        nodes = {
            { n = G.UIT.T, config = { text = text, scale = s or 0.34, colour = colour or G.C.UI.TEXT_LIGHT, shadow = true } }
        }
    }
end

local function row(cells, header)
    return {
        n = G.UIT.R, config = { align = 'cm', padding = 0.05, colour = header and { 0.18, 0.22, 0.24, 0.9 } or { 0.1, 0.12, 0.14, 0.65 }, r = 0.08, minw = 11.4 },
        nodes = cells,
    }
end

local function box(rows)
    return {
        n = G.UIT.R, config = { align = 'cm', padding = 0 },
        nodes = {
            { n = G.UIT.C, config = { align = 'cm', padding = 0.12, colour = { 0.08, 0.1, 0.12, 0.82 }, r = 0.12, minw = 11.8 }, nodes = rows }
        }
    }
end

local function sel_btn(btn, label, col)
    return {
        n = G.UIT.R, config = { align = 'cm', padding = 0 },
        nodes = { UIBox_button({ button = btn, label = { label }, minw = 8.2, minh = 1, scale = 0.55, colour = col }) }
    }
end

G.FUNCS.ina_show_rates = function(e)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
        definition = create_UIBox_generic_options({
            back_colour = G.C.BLUE,
            back_func = 'exit_overlay_menu',
            contents = {
                text_row(localize('ina_rates'), 0.55),
                spacer(0.35),
                sel_btn('ina_show_joker_rates', localize('ina_jokers'), G.C.BLUE),
                spacer(0.18),
                sel_btn('ina_show_booster_rates', localize('ina_booster'), G.C.GREEN),
            }
        }),
    }
end

G.FUNCS.ina_show_joker_rates = function(e)
    G.SETTINGS.paused = true
    local rates = Pokerleven.calculate_shop_rates()
    local rows = {}

    table.insert(rows, row({
        cell(localize('ina_rates_rarity'), 4.7, G.C.GOLD, 0.32),
        cell(localize('ina_rates_count'), 1.8, G.C.GOLD, 0.32),
        cell(localize('ina_rates_weight'), 2.2, G.C.GOLD, 0.32),
        cell(localize('ina_rates_chance'), 2.3, G.C.GOLD, 0.32),
    }, true))

    for _, r in ipairs(rates.rarities) do
        table.insert(rows, row({
            cell(r.label, 4.7, rarity_colour(r.rarity)),
            cell(tostring(r.count), 1.8),
            cell(tostring(math.floor(r.weight)), 2.2),
            cell(string.format("%.1f%%", r.percent), 2.3, G.C.WHITE),
        }))
    end

    G.FUNCS.overlay_menu {
        definition = create_UIBox_generic_options({
            back_colour = G.C.BLUE,
            back_func = 'ina_show_rates',
            contents = { text_row(localize('ina_jokers'), 0.55), spacer(0.18), box(rows) }
        }),
    }
end

G.FUNCS.ina_show_booster_rates = function(e)
    G.SETTINGS.paused = true
    local rates = Pokerleven.calculate_shop_rates()
    local rows = {}

    table.insert(rows, row({
        cell('', 2.2),
        cell(localize('ina_booster'), 4.6, G.C.GOLD, 0.32),
        cell(localize('ina_rates_weight'), 2.2, G.C.GOLD, 0.32),
        cell(localize('ina_rates_chance'), 2.3, G.C.GOLD, 0.32),
    }, true))

    for _, b in ipairs(rates.boosters) do
        local pct = string.format("%.1f%%", b.percent)
        local img
        if b.key ~= 'base_packs' then
            local c = G.P_CENTERS[b.key]
            local sp = c and c.atlas and G.ASSET_ATLAS[c.atlas] and Sprite(0, 0, G.CARD_W * 0.35, G.CARD_H * 0.35, G.ASSET_ATLAS[c.atlas], c.pos or { x = 0, y = 0 })
            img = sp and {
                n = G.UIT.C, config = { align = 'cm', minw = 2.2, padding = 0.02 },
                nodes = { { n = G.UIT.O, config = { object = sp } } }
            } or cell('', 2.2)
        else
            img = cell('', 2.2)
        end
        table.insert(rows, row({ img, cell(b.name, 4.6), cell(tostring(b.weight), 2.2), cell(pct, 2.3, G.C.WHITE) }))
    end

    G.FUNCS.overlay_menu {
        definition = create_UIBox_generic_options({
            back_colour = G.C.GREEN,
            back_func = 'ina_show_rates',
            contents = { text_row(localize('ina_booster'), 0.55), spacer(0.18), box(rows) }
        }),
    }
end

local createOptionsRef = create_UIBox_options
function create_UIBox_options()
    local t = createOptionsRef()
    local btn = UIBox_button({ button = 'ina_show_rates', label = { localize('ina_rates') }, minw = 5, scale = 0.6, colour = G.C.BLUE })
    table.insert(t.nodes[1].nodes[1].nodes[1].nodes, btn)
    return t
end
