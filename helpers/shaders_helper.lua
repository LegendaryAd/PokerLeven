SMODS.Shader({ key = 'evolution', path = 'evolution.fs' }):register()

SMODS.DrawStep({
    key = 'evolution',
    order = 71,
    func = function(card, layer)
        if not card.evolution_timer then return end

        card.ARGS.send_to_shader = card.ARGS.send_to_shader or {}
        card.ARGS.send_to_shader[1] = math.min(card.VT.r * 3, 1) + math.sin(G.TIMERS.REAL / 28) + 1 +
            (card.juice and card.juice.r * 20 or 0) + card.tilt_var.amt
        card.ARGS.send_to_shader[2] = G.TIMERS.REAL
        card.ARGS.send_to_shader[3] = card.evolution_timer

        card.children.center:draw_shader('ina_evolution', nil, card.ARGS.send_to_shader)
    end,
    conditions = { vortex = false, facing = 'front' },
})
