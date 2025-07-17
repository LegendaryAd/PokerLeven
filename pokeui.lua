ina_joker_page = 1

--Credits to pokermon for this
create_UIBox_inadex_jokers = function(keys, previous_menu)
  local deck_tables = {}

  G.your_collection = {}
  G.your_collection[1] = CardArea(
    G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
    math.min(4, #keys)*G.CARD_W,
    0.95*G.CARD_H, 
    {card_limit = #keys, type = 'title', highlight_limit = 0, collection = true})
  table.insert(deck_tables, 
  {n=G.UIT.R, config={align = "cm", padding = 0.07, no_fill = true}, nodes={
    {n=G.UIT.O, config={object = G.your_collection[1]}}
  }}
  )
  
  for i = 1, #keys do
    local key = (type(keys[i]) == "table" and keys[i].key) or keys[i]
    local card = Card(G.your_collection[1].T.x + G.your_collection[1].T.w/2, G.your_collection[1].T.y, G.CARD_W, G.CARD_H, nil, G.P_CENTERS[key])
    if type(keys[i]) == "table" then
      card.ability.extra.form = keys[i].form
      G.P_CENTERS[key]:set_sprites(card)
    end
    G.your_collection[1]:emplace(card)
  end

  
  local t =  create_UIBox_generic_options({ back_func = previous_menu or 'exit_overlay_menu', contents = {
        {n=G.UIT.R, config={align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables}, 
    }})
  return t
end

G.FUNCS.inadexui = function(e)
  if G.STAGE == G.STAGES.RUN then
    if G.jokers and G.jokers.highlighted and G.jokers.highlighted[1] then
      local selected = G.jokers.highlighted[1]
      if selected.config.center.stage then
        G.FUNCS.overlay_menu{
          definition = create_UIBox_inadex_jokers(get_family_keys(selected.config.center.name, selected.config.center.ina_custom_prefix, selected)),
        }
      end
    end
  end
end

G.FUNCS.inadex_back = function()
  G.FUNCS.your_collection_jokers()
  G.FUNCS.SMODS_card_collection_page({cycle_config = {current_option = ina_joker_page}})
  local page = G.OVERLAY_MENU:get_UIE_by_ID('cycle_shoulders').children[1].children[1]
  page.config.ref_table.current_option = ina_joker_page
  page.config.ref_table.current_option_val = page.config.ref_table.options[ina_joker_page]
end

-- Functionality for inadex View
SMODS.Keybind({
    key = "openinadex",
    key_pressed = "p",
    action = function(controller)
        G.FUNCS.inadexui()
    end
})

local controller_queue_R_cursor_press_ref = Controller.queue_R_cursor_press
function Controller:queue_R_cursor_press(x, y)
    controller_queue_R_cursor_press_ref(self, x, y)
    local clicked = self.hovering.target or self.focused.target
    if clicked and type(clicked) == 'table' and clicked.config and type(clicked.config) == 'table' and clicked.config.center and clicked.facing ~= 'back' then
      if clicked.config.center.stage then
        local menu = G.SETTINGS.paused and 'inadex_back' or nil
        if menu and G.OVERLAY_MENU:get_UIE_by_ID('cycle_shoulders') then ina_joker_page = G.OVERLAY_MENU:get_UIE_by_ID('cycle_shoulders').children[1].children[1].config.ref_table.current_option end
        G.FUNCS.overlay_menu{
          definition = create_UIBox_inadex_jokers(get_family_keys(clicked.config.center.name, clicked.config.center.ina_custom_prefix, clicked), menu),
        }
      end
    end
end

local ina_capture_focused_input = Controller.capture_focused_input
function Controller:capture_focused_input(button, input_type, dt)
  if self.focused then
    local clicked = self.focused.target
    if input_type == 'press' and button == 'rightstick' then
      if clicked and type(clicked) == 'table' and clicked.config and type(clicked.config) == 'table' and clicked.config.center and clicked.facing ~= 'back' then
        if clicked.config.center.stage then
          local menu = G.SETTINGS.paused and 'inadex_back' or nil
          if menu and G.OVERLAY_MENU:get_UIE_by_ID('cycle_shoulders') then ina_joker_page = G.OVERLAY_MENU:get_UIE_by_ID('cycle_shoulders').children[1].children[1].config.ref_table.current_option end
          G.SETTINGS.paused = true
          G.FUNCS.overlay_menu{
            definition = create_UIBox_inadex_jokers(get_family_keys(clicked.config.center.name, clicked.config.center.ina_custom_prefix, clicked), menu),
          }
          self:update_focus()
        end
      end
    end
  end
  
  return ina_capture_focused_input(self, button, input_type, dt)
end