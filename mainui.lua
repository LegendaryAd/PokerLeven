---@diagnostic disable: undefined-field
Pokerleven.ui = {}
ina_joker_page = 1

local get_upgrade_cards = function(key, card_area)
  local upgrade_cards = {}
  for i = 1, 6 do
    local added_card = SMODS.create_card({
      key = key,
      no_edition = true,
      area = card_area
    })
    if i > 1 then
      for _ = 0, i - 2 do
        increment_technique(added_card)
      end
    end
    table.insert(upgrade_cards, added_card)
  end
  return upgrade_cards
end

local get_form_cards = function(keys, card_area)
  local form_cards = {}
  for _, key in ipairs(keys) do
    local added_card = SMODS.create_card({
      key = key,
      no_edition = true,
      area = card_area
    })
    table.insert(form_cards, added_card)
  end
  return form_cards
end

local get_teams_for_bobby = function(key, card_area)
  local form_cards = {}
  for team_name, team_table in pairs(C.CUSTOM.Bobby_Teams) do
    local added_card = SMODS.create_card({
      key = key,
      no_edition = true,
      area = card_area
    })
    added_card.children.center:set_sprite_pos({ x = team_table.x, y = team_table.y })
    added_card.ability.extra.pteam = team_name
    table.insert(form_cards, added_card)
  end
  return form_cards
end

Pokerleven.ui.create_card_area = function(card_number, area_table)
  local area_card_size = card_number < 8 and card_number or 8
  local card_area = CardArea(
    G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
    area_card_size * G.CARD_W,
    0.95 * G.CARD_H,
    { card_limit = area_card_size, type = 'title', highlight_limit = 0, collection = true })
  table.insert(area_table, card_area)
  return card_area
end

Pokerleven.ui.emplace_collection_in_area = function(cards, card_area)
  for _, card in ipairs(cards) do
    card_area:emplace(card)
  end
end

Pokerleven.ui.create_tab_from_card_area = function(card_area)
  return {
    n = G.UIT.ROOT,
    config = {
      align = "cm",
      padding = 0.05,
      colour = G.C.CLEAR,
    },
    nodes = {
      {
        n = G.UIT.R,
        config = {
          align = "cm",
          r = 0.2,
          padding = 0.5,
          minh = 4.5,
          colour = G.C.BLACK
        },
        nodes = {
          {
            n = G.UIT.O,
            config = {
              object = card_area,
            }
          },
        }
      }
    }
  }
end

Pokerleven.ui.create_tabs_menu = function(tabs, previous_menu)
  G.FUNCS.overlay_menu({
    definition = create_UIBox_generic_options({
      back_colour = G.C.ORANGE,
      back_func = previous_menu or 'exit_overlay_menu',
      contents = {
        {
          n = G.UIT.R,
          nodes = {
            create_tabs({
              snap_to_nav = true,
              colour = G.C.PALE_GREEN,
              tabs = tabs
            }),
          }
        },
      }
    })
  })
end

function create_upgrade_tab_for_joker(key)
  Pokerleven.upgrades_area = {}
  if G.P_CENTERS[key].special ~= 'Manager' then
    return {
      label = localize("ina_training_upgrades"),
      chosen = true,
      tab_definition_function = function(t)
        local card_area = Pokerleven.ui.create_card_area(6, t.area_table)
        local card_upgrade_list = get_upgrade_cards(key, card_area)
        Pokerleven.ui.emplace_collection_in_area(card_upgrade_list, card_area)
        return Pokerleven.ui.create_tab_from_card_area(card_area)
      end,
      tab_definition_function_args = { area_table = Pokerleven.upgrades_area }
    }
  end
end

function create_forms_tab_for_joker(key)
  Pokerleven.forms_area = {}
  local card_center = G.P_CENTERS[key]
  local keys_to_add = get_family_keys(card_center.name)

  if #keys_to_add > 1 or key == 'j_ina_Bobby' then
    return {
      label = localize("ina_forms"),
      chosen = false,
      tab_definition_function = function(t)
        -- +4 to have a little more space
        local card_area
        if key == 'j_ina_Bobby' then
          card_area = Pokerleven.ui.create_card_area(C.CUSTOM.Bobby_Teams_Number, t.area_table)
          card_form_list = get_teams_for_bobby(key, card_area)
        else
          card_area = Pokerleven.ui.create_card_area(#keys_to_add, t.area_table)
          card_form_list = get_form_cards(keys_to_add, card_area)
        end

        Pokerleven.ui.emplace_collection_in_area(card_form_list, card_area)
        return Pokerleven.ui.create_tab_from_card_area(card_area)
      end,
      tab_definition_function_args = { area_table = Pokerleven.forms_area }
    }
  end
end

Pokerleven.ui.create_overlay_for_joker_properties = function(key, previous_menu)
  local tabs = {}

  local upgrade_tab = create_upgrade_tab_for_joker(key)
  local forms_tab = create_forms_tab_for_joker(key)

  table.insert(tabs, upgrade_tab)
  table.insert(tabs, forms_tab)

  if #tabs > 0 then
    Pokerleven.ui.create_tabs_menu(tabs, previous_menu)
  end
end

G.FUNCS.inadex_back = function()
  G.FUNCS.your_collection_jokers()
  G.FUNCS.SMODS_card_collection_page({ cycle_config = { current_option = ina_joker_page } })
  local page = G.OVERLAY_MENU:get_UIE_by_ID('cycle_shoulders').children[1].children[1]
  page.config.ref_table.current_option = ina_joker_page
  page.config.ref_table.current_option_val = page.config.ref_table.options[ina_joker_page]
end

local initialize_previous_menu = function()
  local menu = G.SETTINGS.paused and 'inadex_back' or nil
  if menu and G.OVERLAY_MENU:get_UIE_by_ID('cycle_shoulders') then
    ina_joker_page = G.OVERLAY_MENU:get_UIE_by_ID(
      'cycle_shoulders').children[1].children[1].config.ref_table.current_option
  end
  return menu
end

local controller_queue_R_cursor_press_ref = Controller.queue_R_cursor_press
function Controller:queue_R_cursor_press(x, y)
  controller_queue_R_cursor_press_ref(self, x, y)
  local clicked = self.hovering.target or self.focused.target
  if clicked and type(clicked) == 'table' and clicked.config and type(clicked.config) == 'table' and clicked.config.center and clicked.facing ~= 'back'
      and clicked.config.center.ptype then
    local menu = initialize_previous_menu()
    Pokerleven.ui.create_overlay_for_joker_properties(clicked.config.center_key, menu)
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
          if menu and G.OVERLAY_MENU:get_UIE_by_ID('cycle_shoulders') then
            ina_joker_page = G.OVERLAY_MENU:get_UIE_by_ID(
              'cycle_shoulders').children[1].children[1].config.ref_table.current_option
          end
          G.SETTINGS.paused = true
          Pokerleven.ui.create_overlay_for_joker_properties(clicked.config.center_key, menu)
          self:update_focus()
        end
      end
    end
  end

  return ina_capture_focused_input(self, button, input_type, dt)
end

--#region Config tab

local restart_toggles_left = {
}

local restart_toggles_right = {
}
local no_restart_toggles = {
  { ref_value = "custom_middle_blinds",    label = "ina_settings_custom_middle_blinds" },
  { ref_value = "middle_blinds_abilities", label = "ina_settings_middle_blinds_abilities" }
}

local create_menu_toggles = function(parent, toggles)
  for k, v in ipairs(toggles) do
    parent.nodes[#parent.nodes + 1] = create_toggle({
      label = localize(v.label),
      ref_table = Pokerleven.config,
      ref_value = v.ref_value,
      callback = function(_set_toggle)
        NFS.write(mod_dir .. "/config.lua", STR_PACK(Pokerleven.config))
      end,
    })
    if v.tooltip then
      parent.nodes[#parent.nodes].config.detailed_tooltip = v.tooltip
    end
  end
end

pokerlevenconfig = function()
  local restart_left_settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05, scale = 0.75, colour = G.C.CLEAR, }, nodes = {} }
  create_menu_toggles(restart_left_settings, restart_toggles_left)

  local restart_right_settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05, scale = 0.75, colour = G.C.CLEAR, }, nodes = {} }
  create_menu_toggles(restart_right_settings, restart_toggles_right)

  local no_restart_settings = { n = G.UIT.R, config = { align = "tm", padding = 0.05, scale = 0.75, colour = G.C.CLEAR, }, nodes = {} }
  create_menu_toggles(no_restart_settings, no_restart_toggles)

  local config_nodes =
  {
    {
      n = G.UIT.R,
      config = {
        padding = 0,
        align = "cm"
      },
      nodes = {
        {
          n = G.UIT.T,
          config = {
            text = "No restart required",
            shadow = true,
            scale = 0.75 * 0.8,
            colour = HEX("ED533A")
          }
        }
      },
    },
    no_restart_settings,
    {
      n = G.UIT.R,
      config = {
        padding = 0,
        align = "cm"
      },
      nodes = {
        {
          n = G.UIT.T,
          config = {
            text = "Requires restart",
            shadow = true,
            scale = 0.75 * 0.8,
            colour = HEX("ED533A")
          }
        }
      },
    },
    {
      n = G.UIT.R,
      config = {
        padding = 0,
        align = "tm"
      },
      nodes = { restart_left_settings, restart_right_settings },
    },
  }
  return config_nodes
end

SMODS.current_mod.config_tab = function()
  return {
    n = G.UIT.ROOT,
    config = {
      align = "cm",
      padding = 0.05,
      colour = G.C.CLEAR,
    },
    nodes = pokerlevenconfig()
  }
end

--#endregion
