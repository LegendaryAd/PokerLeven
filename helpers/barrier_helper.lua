local game_start_run_ref_buttons = Game.start_run
function Game:start_run(args)
    game_start_run_ref_buttons(self, args)

    local atlas = G.ASSET_ATLAS["ina_resources"]

    local sprite = Sprite(0, 0, 0.6, 0.6, atlas, { x = 0, y = 0 })

    G.GAME.ina_show_barriers = false
    G.GAME.barriers = 0
    self.resources_info = UIBox {
        definition = {
            n = G.UIT.ROOT,
            config = {
                align = "cm",
                padding = 0.2,
                colour = G.C.CLEAR,
                shadow = true
            },
            nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        align = "cm",
                        colour = { 0.15, 0.15, 0.15, 0.5 },
                        r = 0.1,
                        minw = 2,
                        padding = 0.05,
                        outline = 1,
                        outline_colour = G.C.BLACK,
                        hover = true,
                        tooltip = { title = localize("ina_resource_barriers") },
                        func = "ina_show_barriers",
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = {
                                align = "cm",
                            },
                            nodes = {
                                {
                                    n = G.UIT.O,
                                    config = {
                                        object = sprite,
                                        scale = 0.5
                                    }
                                },
                                {
                                    n = G.UIT.B,
                                    config = {
                                        w = 0.1,
                                        h = 0.15,
                                    }
                                },
                                {
                                    n = G.UIT.T,
                                    config = {
                                        ref_table = G.GAME, ref_value = 'barriers',
                                        scale = 0.5,
                                        colour = G.C.UI.TEXT_LIGHT,
                                    }
                                }
                            }
                        }
                    }
                }
            }
        },
        config = {
            align = "cm",
            offset = { x = 2.45, y = 0 },
            major = G.deck,
            bond = 'Weak',
        }
    }
    self.HUD:recalculate()
end

---Shows barriers
G.FUNCS.ina_show_barriers = function(e)
    if G.GAME.barriers and G.GAME.barriers > 0 then
        G.GAME.ina_show_barriers = true
    end
    if G.GAME.ina_show_barriers then
        e.states.visible = true
    else
        e.states.visible = false
    end
end
