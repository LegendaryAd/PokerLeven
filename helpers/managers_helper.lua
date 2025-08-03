-- local game_start_run_ref = Game.start_run
-- function Game:start_run(args)
--     self.ina_manager_area = CardArea(
--         0,
--         0,
--         self.CARD_W * 1.9,
--         self.CARD_H * 0.95,
--         {
--             card_limit = 1,
--             type = 'managers',
--             highlight_limit = 1,
--         }
--     )

--     Pokerleven.ina_manager_area = self.ina_manager_area

--     game_start_run_ref(self, args)

--     self.ina_manager_area.T.x = G.consumeables.T.x + 2.3
--     self.ina_manager_area.T.y = G.consumeables.T.y + 3
-- end

local game_start_run_ref = Game.start_run
function Game:start_run(args)
    self.ina_manager_area = CardArea(
        0,
        0,
        self.CARD_W * 1.9,
        self.CARD_H * 0.95,
        {
            card_limit = 1,
            type = 'extra_deck',
            highlight_limit = 1,
        }
    )
    Pokerleven.ina_manager_area = G.ina_manager_area

    game_start_run_ref(self, args)

    Pokerleven.ina_manager_uibox = UIBox {
        definition = Pokerleven.create_UIBox_manager_area(),
        config = {
            align = 'cmi',
            offset = { x = 2.3, y = 3.5 },
            major = self.consumeables,
            bond = 'Weak'
        } }
end

Pokerleven.create_UIBox_manager_area = function()
    return {
        n = G.UIT.ROOT,
        config = { align = 'cm', r = 0.1, colour = G.C.CLEAR, padding = 0.2 },
        nodes = {
            {
                n = G.UIT.O,
                config = {
                    object = Pokerleven.ina_manager_area,
                    draw_layer = 1
                }
            },
        }
    }
end
