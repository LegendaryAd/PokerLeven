local strat = {
  key = "Strat",
  primary_colour = HEX("4F6367"),
  secondary_colour = HEX("9AA4B7"),
  loc_txt =  	{
 		name = 'Strat', -- used on card type badges
 		collection = 'Strat Cards', -- label for the button to access the collection
 	},
  collection_row = {6, 6},
  shop_rate = 4,
  default = "c_ina_strat"
}

return {name = "Inazuma Consumable Types",
        list = {strat}
}