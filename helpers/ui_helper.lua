ina_set_badges = function(self, card, badges)
    local pteam = get_team(card)
    local text_colour = G.C.WHITE
    if pteam then
        local lower_pteam = string.lower(pteam)
        badges[#badges + 1] = create_badge(pteam, G.ARGS.LOC_COLOURS[lower_pteam], text_colour, 1.2)
    end
end

type_tooltip = function(self, info_queue, center)
    local percent
    if center.ability.extra and type(center.ability.extra) == "table" and center.ability.extra.ptype then
        info_queue[#info_queue + 1] = { set = 'Other', key = center.ability.extra.ptype }
    end
    if center.ability.extra and type(center.ability.extra) == "table" and center.ability.extra.pposition then
        info_queue[#info_queue + 1] = { set = 'Other', key = center.ability.extra.pposition }
    end
end

apply_property_sticker = function(card, sticker_type, property)
    local inateam_list = { "Forest", "Fire", "Wind", "Mountain" }
    local inaposition_list = { "FW", "DF", "MF", "GK" }
    local apply_type = nil

    if sticker_type then
        apply_type = sticker_type
        card.ability[string.lower(apply_type) .. "_sticker"] = true
    else
        if property == "type" then
            apply_type = pseudorandom_element(inateam_list, pseudoseed("type"))
        elseif property == "position" then
            apply_type = pseudorandom_element(inaposition_list, pseudoseed("position"))
        end
        card.ability[string.lower(apply_type) .. "_sticker"] = true
    end

    if property == "type" then
        for _, v in pairs(inateam_list) do
            if string.lower(v) ~= string.lower(apply_type) then
                card.ability[string.lower(v) .. "_sticker"] = false
            end
        end
    end

    if property == "position" then
        for l, v in pairs(inaposition_list) do
            if string.lower(v) ~= string.lower(apply_type) then
                card.ability[string.lower(v) .. "_sticker"] = false
            end
        end
    end

    if property == "type" then
        if card.ability and card.ability.extra and type(card.ability.extra) == "table" and card.ability.extra.ptype then
            card.ability.extra.ptype = apply_type
        end
    end

    if property == "position" then
        if card.ability and card.ability.extra and type(card.ability.extra) == "table" and card.ability.extra.pposition then
            card.ability.extra.pposition = apply_type
        end
    end
end

-- CREDITS
local base_create_badges = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
    base_create_badges(obj, badges)

    if obj and obj.ina_credits then
        local function calc_scale_fac(text)
            local size = 0.9
            local font = G.LANG.font
            local max_text_width = 2 - 2 * 0.05 - 4 * 0.03 * size - 2 * 0.03
            local calced_text_width = 0
            for _, c in utf8.chars(text) do
                ---@diagnostic disable-next-line: undefined-field
                local tx = font.FONT:getWidth(c) * (0.33 * size) * G.TILESCALE * font.FONTSCALE
                    ---@diagnostic disable-next-line: undefined-field
                    + 2.7 * 1 * G.TILESCALE * font.FONTSCALE
                calced_text_width = calced_text_width + tx / (G.TILESIZE * G.TILESCALE)
            end
            return calced_text_width > max_text_width and max_text_width / calced_text_width or 1
        end

        local strings = { "Pokerleven" }

        if obj.ina_credits.idea then
            for i = 1, #obj.ina_credits.idea do
                localized = localize({ type = "variable", key = "ina_idea", vars = { obj.ina_credits.idea[i] } })[1]
                strings[#strings + 1] = localized
            end
        end

        if obj.ina_credits.art then
            for i = 1, #obj.ina_credits.art do
                localized = localize({ type = "variable", key = "ina_art", vars = { obj.ina_credits.art[i] } })[1]
                strings[#strings + 1] = localized
            end
        end

        local scale_fac = {}
        local min_scale_fac = 1
        for i = 1, #strings do
            scale_fac[i] = calc_scale_fac(strings[i])
            min_scale_fac = math.min(min_scale_fac, scale_fac[i])
        end

        local ct = {}
        for i = 1, #strings do
            ct[i] = { string = strings[i] }
        end

        local badge = {
            n = G.UIT.R,
            config = { align = "cm" },
            nodes = {
                {
                    n = G.UIT.R,
                    config = {
                        align = "cm",
                        colour = G.C.RED,
                        r = 0.1,
                        minw = 2 / min_scale_fac,
                        minh = 0.36,
                        emboss = 0.05,
                        padding = 0.03 * 0.9,
                    },
                    nodes = {
                        { n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
                        {
                            n = G.UIT.O,
                            config = {
                                object = DynaText({
                                    string = ct,
                                    colours = { obj.ina_credits.text_colour or G.C.WHITE },
                                    silent = true,
                                    float = true,
                                    shadow = true,
                                    offset_y = -0.03,
                                    spacing = 1,
                                    scale = 0.33 * 0.9,
                                }),
                            },
                        },
                        { n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
                    },
                },
            },
        }

        badges[#badges] = badge
    end
end

---Creates the UI for jokers in collection
---@return UINode node UI for jokers in collection
create_UIBox_your_collection_jokers = function()
    local filtered_jokers = {}
    for _, joker in ipairs(G.P_CENTER_POOLS.Joker) do
        if not joker.special then
            table.insert(filtered_jokers, joker)
        end
    end
    return SMODS.card_collection_UIBox(filtered_jokers, { 5, 5, 5 }, {
        no_materialize = true,
        modify_card = function(card, center) card.sticker = get_joker_win_sticker(center) end,
        h_mod = 0.95,
    })
end

--#region Technique UI

---Creates the UI for techniques in collection
---@return UINode node UI for techniques in collection
create_UIBox_your_collection_techniques = function()
    local filtered_jokers = {}
    for _, joker in ipairs(G.P_CENTER_POOLS.Joker) do
        if joker.special then
            table.insert(filtered_jokers, joker)
        end
    end
    return SMODS.card_collection_UIBox(filtered_jokers, { 5, 5, 5 }, {
        no_materialize = true,
        modify_card = function(card, center) card.sticker = get_joker_win_sticker(center) end,
        h_mod = 0.95,
    })
end

G.FUNCS.your_collection_techniques = function(e)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
        definition = create_UIBox_your_collection_techniques(),
    }
end

local original_buildAdditionsTab = buildAdditionsTab
function buildAdditionsTab(mod)
    local tab = original_buildAdditionsTab(mod)
    if not tab then return nil end

    local techniques_pool = {}
    for _, joker in ipairs(G.P_CENTER_POOLS.Joker) do
        if joker.special then
            table.insert(techniques_pool, joker)
        end
    end

    if #techniques_pool > 0 then
        local tally = modsCollectionTally(techniques_pool)
        if tally.of > 0 then
            local techniques_node = UIBox_button({
                button = 'your_collection_techniques',
                label = { localize('ina_special_technique') },
                count = tally,
                minw = 5,
                minh = 1.2,
                scale = 0.6,
                id = 'your_collection_techniques'
            })

            local tab_nodes = tab.tab_definition_function().nodes
            if tab_nodes and tab_nodes[1] and tab_nodes[1].nodes and tab_nodes[1].nodes[1] and tab_nodes[1].nodes[1].nodes then
                table.insert(tab_nodes[1].nodes[1].nodes, 2, techniques_node)
            end
        end
    end

    return tab
end

--#endregion

-- -- TODO BUTTON TO FUSE CARDS, MAYBE ITS BETTER TO HAVE A GENERAL BUTTON. WE NEED TO THINK ABOUT WHAT IT WILL COST
-- -- TODO CHANGE THIS TO A FUSE_HELPER
-- local use_and_sell_buttonsref = G.UIDEF.use_and_sell_buttons
-- function G.UIDEF.use_and_sell_buttons(card)
--     local retval = use_and_sell_buttonsref(card)

--     local fuse =
--     {
--         n = G.UIT.C,
--         config = { align = "cr" },
--         nodes = {
--             {
--                 n = G.UIT.C,
--                 config = { ref_table = card, align = "cr", padding = 0.1, r = 0.08, minw = 1.25, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'sell_card', func = 'can_fuse_card' },
--                 nodes = {
--                     { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
--                     {
--                         n = G.UIT.C,
--                         config = { align = "cm" },
--                         nodes = {
--                             {
--                                 n = G.UIT.R,
--                                 config = { align = "cm", maxw = 1.25 },
--                                 nodes = {
--                                     { n = G.UIT.T, config = { text = "Fusionar", colour = G.C.UI.TEXT_LIGHT, scale = 0.4, shadow = true } }
--                                 }
--                             }
--                         }
--                     }
--                 }
--             },
--         }
--     }
--     retval.nodes[1].nodes[2].nodes = retval.nodes[1].nodes[2].nodes or {}
--     table.insert(retval.nodes[1].nodes[2].nodes, fuse)
--     return retval
-- end

-- G.FUNCS.can_fuse_card = function(e)
--     e.config.colour = G.C.DARK_EDITION
--     e.config.button = 'sell_card'
-- end
