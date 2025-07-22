-- CUSTOM Small And Big Blinds
function get_new_small()
    G.GAME.perscribed_small = G.GAME.perscribed_small or {
    }
    if G.GAME.perscribed_small and G.GAME.perscribed_small[G.GAME.round_resets.ante] then
        local ret_boss = G.GAME.perscribed_small[G.GAME.round_resets.ante]
        G.GAME.perscribed_small[G.GAME.round_resets.ante] = nil
        return ret_boss
    end
    if G.FORCE_SMALL then return G.FORCE_SMALL end

    local eligible_bosses = { bl_small = true }
    for k, v in pairs(G.P_BLINDS) do
        if not v.small then
            -- don't add
        elseif v.in_pool and type(v.in_pool) == 'function' then
            local res, options = v:in_pool()
            eligible_bosses[k] = res and true or nil
        elseif v.small.min <= math.max(1, G.GAME.round_resets.ante) then
            eligible_bosses[k] = true
        end
    end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end

    for k, v in pairs(eligible_bosses) do
        local mod = G.P_BLINDS[k] and G.P_BLINDS[k].mod
        if pokerleven_config.custom_middle_blinds == false then
            if mod and mod.id == 'Pokerleven' then
                eligible_bosses[k] = nil
            end
        else
            if not mod or mod.id ~= 'Pokerleven' then
                eligible_bosses[k] = nil
            end
        end
    end

    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))

    return boss
end

function get_new_big()
    G.GAME.perscribed_big = G.GAME.perscribed_big or {
    }
    if G.GAME.perscribed_big and G.GAME.perscribed_big[G.GAME.round_resets.ante] then
        local ret_boss = G.GAME.perscribed_big[G.GAME.round_resets.ante]
        G.GAME.perscribed_big[G.GAME.round_resets.ante] = nil
        return ret_boss
    end
    if G.FORCE_BIG then return G.FORCE_BIG end

    local eligible_bosses = { bl_big = true }
    for k, v in pairs(G.P_BLINDS) do
        if not v.big then
            -- don't add
        elseif v.in_pool and type(v.in_pool) == 'function' then
            local res, options = v:in_pool()
            eligible_bosses[k] = res and true or nil
        elseif v.big.min <= math.max(1, G.GAME.round_resets.ante) then
            eligible_bosses[k] = true
        end
    end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end

    for k, v in pairs(eligible_bosses) do
        local is_mod = G.P_BLINDS[k].mod and G.P_BLINDS[k].mod.id == 'Pokerleven'

        if pokerleven_config.custom_middle_blinds == false then
            if is_mod then
                eligible_bosses[k] = nil
            end
        else
            if not is_mod then
                eligible_bosses[k] = nil
            end
        end
    end

    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))

    return boss
end

-- RERROLL BIG BLINDS
reroll_big = function(e)
    stop_use()
    G.GAME.round_resets.big_rerolled = true
    G.from_boss_tag = nil -- Por si quieres reutilizar el flag
    G.CONTROLLER.locks.big_reroll = true

    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            play_sound('other1')
            G.blind_select_opts.big:set_role({ xy_bond = 'Weak' })
            G.blind_select_opts.big.alignment.offset.y = 20
            return true
        end
    }))

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.3,
        func = (function()
            local par = G.blind_select_opts.big.parent
            G.GAME.round_resets.blind_choices.Big = get_new_big()

            G.blind_select_opts.big:remove()
            G.blind_select_opts.big = UIBox {
                T = { par.T.x, 0, 0, 0 },
                definition = {
                    n = G.UIT.ROOT, config = { align = "cm", colour = G.C.CLEAR }, nodes = {
                    UIBox_dyn_container({ create_UIBox_blind_choice('Big') }, false, get_blind_main_colour('Big'), mix_colours(G.C.BLACK, get_blind_main_colour('Big'), 0.8))
                }
                },
                config = {
                    align = "bmi",
                    offset = { x = 0, y = G.ROOM.T.y + 9 },
                    major = par,
                    xy_bond = 'Weak'
                }
            }

            par.config.object = G.blind_select_opts.big
            par.config.object:recalculate()
            G.blind_select_opts.big.parent = par
            G.blind_select_opts.big.alignment.offset.y = 0

            G.E_MANAGER:add_event(Event({
                blocking = false,
                trigger = 'after',
                delay = 0.5,
                func = function()
                    G.CONTROLLER.locks.big_reroll = nil
                    return true
                end
            }))

            save_run()
            for i = 1, #G.GAME.tags do
                if G.GAME.tags[i]:apply_to_run({ type = 'new_blind_choice' }) then break end
            end

            return true
        end)
    }))
end
