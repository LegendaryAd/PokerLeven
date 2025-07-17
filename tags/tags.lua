local wild_tag = {
	object_type = "Tag",
	atlas = "Tags01",
	name = "wild_tag",
	order = 27,
	pos = { x = 0, y = 0 },
	config = { type = "store_joker_create" },
	key = "wild_tag",
	min_ante = 0,
    discovered = true,
	loc_vars = function(self, info_queue)
		return { vars = {} }
	end,
	apply = function(self, tag, context)
    if context and context.type == "store_joker_create" then
      local card = nil
      
        local possible_teams = {}
        if G.jokers and G.jokers.cards then
            for _, v in pairs(G.jokers.cards) do
                if v.ability and type(v.ability.extra) == "table" and v.ability.extra.pteam then
                    possible_teams[v.ability.extra.pteam] = true
                end
            end
        end

        local team_list = {}
        for team, _ in pairs(possible_teams) do
            table.insert(team_list, team)
        end

        local selected_team = nil
        if #team_list > 0 then
            selected_team = pseudorandom_element(team_list, pseudoseed("teamselect"))
        end
        if not selected_team then
            selected_team = "Raimon"
        end

      card = create_random_ina_joker("wildtag", "Uncommon", context.area, selected_team)
      create_shop_card_ui(card, 'Joker', context.area)
      card.states.visible = false
      tag:yep('+', G.C.GREEN,function() 
          card:start_materialize()
          card.ability.couponed = true
          card:set_cost()
          return true
      end)
    
      tag.triggered = true
      return card
    end
	end,
}

return{
    name = "Tags",
    list = {wild_tag}
}