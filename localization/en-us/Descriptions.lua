local generate_planet_text = function()
	return {
		"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
		"{C:attention}#2#",
		"{C:mult}+#3#{} Mult and",
		"{C:chips}+#4#{} chips",
	}
end

return {
	descriptions = {
		Back = {
			b_ina_hillman = {
				name = "Hillman",
				text = {
					"{C:pink}#1# Managers{}",
					"After {C:attention}ante #2#{}, generate",
					"{C:pink}#3# Strat{} each round",
					"{C:inactive}Must have space{}"
				}
			},
			b_ina_ray_dark = {
				name = "Ray Dark",
				text = {
					"{C:pink}#1# Managers{}",
					"{C:spectral}Spectral{} cards",
					"can now spawn in shop"
				},
				unlock = {
					"Usa un {C:dark_edition}Néctar de los Dioses{}"
				}
			},
		},
		Strat = {
			c_ina_tech_book = {
				name = "Technique Book",
				text = { "Applies a random {C:pink}Type{}",
					"to the leftmost Joker{}" }
			},
			c_ina_tactic_pos = {
				name = "Tactic Position",
				text = { "Applies a random {C:pink}Position{}",
					"to the leftmost Joker{}" }
			}
		},
		Training = {
			c_ina_upgrade_technique_Forest_GK = {
				name = "Technique Upgrade",
				text = { "Upgrades the technique level of the",
					"selected player if they are",
					"{C:forest}Forest{} type and {X:gk,C:white}GK{} position" }
			},
			c_ina_upgrade_technique_Forest_DF = {
				name = "Technique Upgrade",
				text = { "Upgrades the technique level of the",
					"selected player if they are",
					"{C:forest}Forest{} type and {X:df,C:white}DF{} position" }
			},
			c_ina_upgrade_technique_Forest_MF = {
				name = "Technique Upgrade",
				text = { "Upgrades the technique level of the",
					"selected player if they are",
					"{C:forest}Forest{} type and {X:mf,C:white}MF{} position" }
			},
			c_ina_upgrade_technique_Forest_FW = {
				name = "Technique Upgrade",
				text = { "Upgrades the technique level of the",
					"selected player if they are",
					"{C:forest}Forest{} type and {X:fw,C:white}FW{} position" }
			},
			c_ina_upgrade_technique_Fire_GK = {
				name = "Technique Upgrade",
				text = { "Upgrades the technique level of the",
					"selected player if they are",
					"{C:fire}Fire{} type and {X:gk,C:white}GK{} position" }
			},
			c_ina_upgrade_technique_Fire_DF = {
				name = "Technique Upgrade",
				text = { "Upgrades the technique level of the",
					"selected player if they are",
					"{C:fire}Fire{} type and {X:df,C:white}DF{} position" }
			},
			c_ina_upgrade_technique_Fire_MF = {
				name = "Technique Upgrade",
				text = { "Upgrades the technique level of the",
					"selected player if they are",
					"{C:fire}Fire{} type and {X:mf,C:white}MF{} position" }
			},
			c_ina_upgrade_technique_Fire_FW = {
				name = "Technique Upgrade",
				text = { "Upgrades the technique level of the",
					"selected player if they are",
					"{C:fire}Fire{} type and {X:fw,C:white}FW{} position" }
			},
			c_ina_upgrade_technique_Wind_GK = {
				name = "Technique Upgrade",
				text = { "Upgrades the technique level of the",
					"selected player if they are",
					"{C:wind}Wind{} type and {X:gk,C:white}GK{} position" }
			},
			c_ina_upgrade_technique_Wind_DF = {
				name = "Technique Upgrade",
				text = { "Upgrades the technique level of the",
					"selected player if they are",
					"{C:wind}Wind{} type and {X:df,C:white}DF{} position" }
			},
			c_ina_upgrade_technique_Wind_MF = {
				name = "Technique Upgrade",
				text = { "Upgrades the technique level of the",
					"selected player if they are",
					"{C:wind}Wind{} type and {X:mf,C:white}MF{} position" }
			},
			c_ina_upgrade_technique_Wind_FW = {
				name = "Technique Upgrade",
				text = { "Upgrades the technique level of the",
					"selected player if they are",
					"{C:wind}Wind{} type and {X:fw,C:white}FW{} position" }
			},
			c_ina_upgrade_technique_Mountain_GK = {
				name = "Technique Upgrade",
				text = { "Upgrades the technique level of the",
					"selected player if they are",
					"{C:mountain}Mountain{} type and {X:gk,C:white}GK{} position" }
			},
			c_ina_upgrade_technique_Mountain_DF = {
				name = "Technique Upgrade",
				text = { "Upgrades the technique level of the",
					"selected player if they are",
					"{C:mountain}Mountain{} type and {X:df,C:white}DF{} position" }
			},
			c_ina_upgrade_technique_Mountain_MF = {
				name = "Technique Upgrade",
				text = { "Upgrades the technique level of the",
					"selected player if they are",
					"{C:mountain}Mountain{} type and {X:mf,C:white}MF{} position" }
			},
			c_ina_upgrade_technique_Mountain_FW = {
				name = "Technique Upgrade",
				text = { "Upgrades the technique level of the",
					"selected player if they are",
					"{C:mountain}Mountain{} type and {X:fw,C:white}FW{} position" }
			},
		},
		Edition = {},
		Enhanced = {},
		Other = {
			ina_training_seal = {
				name = "Sello de entrenamiento",
				text = {
					"Creates a {C:training}Training{} card",
					"if scores in the{C:attention}last hand{}",
					"{C:inactive}(Must have space){}",
				},
			},
			card_emult = {
				text = {
					"{C:dark_edition}^#1#{} Mult"
				}
			},
			card_extra_emult = {
				text = {
					"{C:dark_edition}^#1#{} Mult"
				}
			},
			Mountain = {
				name = "Type",
				text = { "{X:mountain,C:white}Mountain{}" }
			},
			Fire = {
				name = "Type",
				text = { "{X:fire,C:white}Fire{}" }
			},
			GK = {
				name = "Position",
				text = { "{X:gk,C:white}GK{}" }
			},
			FW = {
				name = "Position",
				text = { "{X:fw,C:white}FW{}" }
			},
			Forest = {
				name = "Type",
				text = { "{X:forest,C:white}Forest{}" }
			},
			Wind = {
				name = "Type",
				text = { "{X:wind,C:white}Wind{}" }
			},
			DF = {
				name = "Position",
				text = { "{X:df,C:white}DF{}" }
			},
			MF = {
				name = "Position",
				text = { "{X:mf,C:white}MF{}" }
			},
			Harvester = {
				name = "Harvester",
				text = { "Activates when discarding",
					"a {C:attention}Harvestable{} card" }
			},
			Frontal = {
				name = "Frontal",
				text = { "Activates if it is the",
					"leftmost {C:attention}Joker{}" }
			},
			Trillizos = {
				name = "Triplets",
				text = { "If you have {C:attention}Thomas{},",
					"{C:attention}Tyler{} and {C:attention}Marvin{} reactivates",
					"{C:attention}odd{} cards" }
			},
			Right_Footed = {
				name = "Right-Footed",
				text = { "Activates if it is the",
					"rightmost {C:attention}Joker{}" }
			},
			p_ina_growing_pack = {
				name = "Growing Pack",
				text = { "Choose {C:attention}#1#{} between {C:attention}#2#{}", "{C:attention}Jokers{} from your teams" }
			},
			p_ina_advanced_pack = {
				name = "Advanced Pack",
				text = { "Choose {C:attention}#1#{} between {C:attention}#2#{}", "{C:attention}Jokers{} from your teams" }
			},
			p_ina_item_pack_ina = {
				name = "Ina Pack",
				text = { "Choose {C:attention}#1#{} of {C:attention}#2#{} {C:tarot}Tarot{} Cards",
					"#3# {C:strat}Strats{} or #4# {C:training}Trainings{}",
					"compatible with one of your players",
					"to use immediately" }
			},
			p_ina_manager_pack = {
				name = "Manager Pack",
				text = { "Choose {C:attention}#1#{} of {C:attention}#2#{} {C:pink}Managers{}" }
			},
			p_ina_training_pack = {
				name = "Training Pack",
				text = { "Choose {C:attention}#1#{} of {C:attention}#2#{} {C:training}Trainings{}",
					"to use immediately" }
			},
			p_ina_jumbo_training_pack = {
				name = "Jumbo Training Pack",
				text = { "Choose {C:attention}#1#{} of {C:attention}#2#{} {C:training}Trainings{}",
					"to use immediately", "At least one will be",
					"compatible with your {C:attention}Jokers{}" }
			},
			p_ina_mega_training_pack = {
				name = "Mega Training Pack",
				text = { "Choose {C:attention}#1#{} of {C:attention}#2#{} {C:training}Trainings{}",
					"to use immediately", "At least two will be",
					"compatible with your {C:attention}Jokers{}" }
			},
			ina_harvest_sticker = {
				name = "Harvestable",
				text = {
					"This card can be",
					"harvested by jokers"
				},
			},
			ina_tech_plus1_sticker = {
				name = "Technique +1",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_plus2_sticker = {
				name = "Technique +2",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_plus3_sticker = {
				name = "Technique +3",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_plus4_sticker = {
				name = "Technique +4",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_plus5_sticker = {
				name = "Technique +5",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_number2_sticker = {
				name = "Technique number 2",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_number3_sticker = {
				name = "Technique number 3",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_number4_sticker = {
				name = "Technique number 4",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_numbera_sticker = {
				name = "Technique A",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_numbers_sticker = {
				name = "Technique S",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_numberz_sticker = {
				name = "Technique Z",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_numberinf_sticker = {
				name = "Technique infinity",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_grade2_sticker = {
				name = "Technique grade 2",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_grade3_sticker = {
				name = "Technique grade 3",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_grade4_sticker = {
				name = "Technique grade 4",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_grade5_sticker = {
				name = "Technique grade 5",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_grade0_sticker = {
				name = "Technique grade 0",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_j_sticker = {
				name = "Technique J",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_q_sticker = {
				name = "Technique Q",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_k_sticker = {
				name = "Technique K",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_a_sticker = {
				name = "Technique A",
				text = {
					"This joker has",
					"increased stats"
				},
			},
			ina_tech_joker_sticker = {
				name = "Technique Joker",
				text = {
					"This joker has",
					"increased stats"
				},
			},
		},
		Planet = {
			c_ina_make = {
				name = "Make",
				text = generate_planet_text()
			},
			c_ina_haumer = {
				name = "Haumer",
				text = generate_planet_text()
			},
			c_ina_orcus = {
				name = "Orcus",
				text = generate_planet_text()
			}
		},
		Spectral = {
			c_ina_black_room = {
				name = "Black Room",
				text = { "Raises the {C:training}technique level{}",
					"of a card regardless of",
					"its type or position" }
			},
			c_ina_divine_water = {
				name = "Divine Water",
				text = { "Upgrades {C:training}technique level{}",
					"of one joker {C:dark_edition,E:1}to the max{}",
					"but sets a {C:dark_edition}perishable{} sticker" }
			},
			c_ina_centella = {
				name = "Centella Center",
				text = { "Raises the {C:training}technique level{}",
					"of all your {C:attention}starters{}" }
			}
		},
		Stake = {},
		Tag = {
			tag_ina_wild_tag = {
				name = "Wild Tag",
				text = { { "The shop has a free {C:attention}player{}",
					"{C:uncommon}Uncommon{} from one of your teams" },
					{ "It has an incremented chance",
						"to generate a {C:dark_edition}negative{} joker" } }
			},
			tag_ina_chain_tag = {
				name = "Chain Tag",
				text = { "Changes the {C:attention}Big Blind{}, If you are on",
					"a big blind, changes the {C:attention}Boss Blind{}" }
			},
			tag_ina_bench_tag = {
				name = "Bench Tag",
				text = { "Grants a free {C:pink}Manager Pack{}" }
			},
			tag_ina_technique_tag = {
				name = "Technique Tag",
				text = { "Grants a free {C:training}Mega Training Pack{}" }
			}
		},
		Tarot = {},
		Voucher = {
			v_ina_ex_law = {
				name = "Ex Law",
				text = {
					"For each player you have",
					"from the team you are",
					"facing, reduces",
					"required {C:chips}chips{} by {C:attention}#1#%{}"
				},
			},
			v_ina_ex_law_2 = {
				name = "Ex Law",
				text = {
					"For each player you have",
					"from the team you are",
					"facing, reduces",
					"required {C:chips}chips{} by {C:attention}#1#%{}"
				},
				unlock = {
					"{C:mult}Defeat{} a team",
					"with {C:attention}at least{} one player",
					"that belongs to that team"
				}
			},
			v_ina_training = {
				name = "Training",
				text = {
					"{C:attention}+1{} to max technique level"
				},
			},
			v_ina_training_2 = {
				name = "Super Training",
				text = {
					"{C:attention}+1{} to max technique level"
				},
				unlock = {
					"Raise a player's technique",
					"to {C:training}ASZ/+4/A/G5{}"
				}
			},
		}
	},
	misc = {}
}
