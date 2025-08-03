local game_start_run_ref = Game.start_run
function Game:start_run(args)
    self.ina_manager_area = CardArea(
        0,
        0,
        self.CARD_W * 1.9,
        self.CARD_H * 0.95,
        {
            card_limit = 1,
            type = 'joker',
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

---Returns true if card is a manager
---@param card Card joker to deliberate if it's a manager
Pokerleven.is_manager = function(card)
    return card.ability and
        type(card.ability.extra) == "table" and
        card.ability.extra.special == "Manager"
end


---Adds card to managers area
---@param card table|Card|true card to add to the manager area
Pokerleven.add_to_managers = function(card)
    if card.edition and card.edition.card_limit then
        Pokerleven.ina_manager_area.config.card_limit = Pokerleven.ina_manager_area.config.card_limit +
            card.edition.card_limit
    end

    Pokerleven.ina_manager_area:emplace(card)
    card:add_to_deck()
end

--- Hook for new buttons if is a manager
local card_highlight_ref = Card.highlight
function Card:highlight(is_highlighted)
    if self.area and self.area.config.type == "joker" and Pokerleven.is_manager(self) then
        self.highlighted = is_highlighted
        if self.highlighted then
            self.children.use_button = UIBox {
                definition = Pokerleven.create_sell_and_use_buttons(self, { sell = true }),
                config = {
                    align = "cr",
                    offset = { x = -0.4, y = 0 },
                    parent = self
                }
            }
        elseif self.children.use_button then
            self.children.use_button:remove()
            self.children.use_button = nil
        end
    else
        card_highlight_ref(self, is_highlighted)
    end
end
