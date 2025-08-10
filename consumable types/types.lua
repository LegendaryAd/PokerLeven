local strat = {
  key = "Strat",
  primary_colour = HEX("4F6367"),
  secondary_colour = HEX("9AA4B7"),
  loc_txt = {
    name = 'Strat',             -- used on card type badges
    collection = 'Strat Cards', -- label for the button to access the collection
  },
  collection_row = { 6, 6 },
  shop_rate = 2.5,
  default = "c_ina_tactic_pos"
}

local training = {
  key = "Training",
  primary_colour = HEX("FFD100"),
  secondary_colour = HEX("5A00FF"),
  loc_txt = {
    name = 'Training',             -- used on card type badges
    collection = 'Training Cards', -- label for the button to access the collection
  },
  collection_row = { 8, 8 },
  shop_rate = 0,
  default = "c_ina_upgrade_technique_Wind_FW"
}

return {
  name = "Inazuma Consumable Types",
  list = { strat, training }
}
