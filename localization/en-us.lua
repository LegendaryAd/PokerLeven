return {
    descriptions = {
        Back = {},
        Blind = {
            bl_ina_goalkeeper = {
                name = "Goalkeeper",
                text = {
                    "FW Players are debuffed",
                }, 
            },
            bl_ina_forward = {
                name = "Forward",
                text = {
                    "GK Players are debuffed",
                }, 
            },
            bl_ina_defense = {
                name = "Defense",
                text = {
                    "MF Players are debuffed",
                }, 
            },
            bl_ina_midfielder = {
                name = "Midfielder",
                text = {
                    "DF Players are debuffed",
                }, 
            },
            bl_ina_fire = {
                name = "Fire Boss",
                text = {
                    "Forest Players are debuffed",
                }, 
            },
            bl_ina_forest = {
                name = "Forest Boss",
                text = {
                    "Wind Players are debuffed",
                }, 
            },
            bl_ina_mountain = {
                name = "Mountain Boss",
                text = {
                    "Fire Players are debuffed",
                }, 
            },
            bl_ina_wind = {
                name = "Wind Boss",
                text = {
                    "Mountain Players are debuffed",
                }, 
            },
        },
        Strat = {  
            c_ina_tech_book = {
                name = "Tech. Book",
                text = {
                    "Applies a random",
                    "{C:pink}Type{} to leftmost Joker{}",
                },
            },
            c_ina_tactic_pos = {
                name = "Tactic. Pos.",
                text = {
                    "Applies a random",
                    "{C:pink}Position{} to leftmost Joker{}",
                },
            },
        },
        Edition = {},
        Enhanced = {},
        Joker = {
            j_ina_Kevin = {
                name = "Kevin",
                text = {"{C:forest}Dragon Tornado{}",
                        "Retriggers the {X:fw,C:white}FW{} joker",
                        "to his right{}"}
            },
            j_ina_Mark = {
                name = "Mark",
                text = {"Never surrender!", "{C:mult}+#1#{} Mult on your last hand",
                        "Increases by {C:mult}+#2#{} per last hand played",
                        "{C:inactive}(Grows up at {C:mult}+#1#{C:inactive} / {C:mult}+#3#{C:inactive}  Mult)"}
            },
            j_ina_Nathan = {
                name = "Nathan",
                text = {"{C:wind}Flurry Dash{}",
                        "Each {X:raimon,C:white}Raimon{} player gives {X:mult,C:white}X#2#{}"}
            },
            j_ina_Jack = {
                name = "Jack",
                text = {"{C:mountain}The Wall{}",
                        "For each {X:df,C:white}DF{} Joker every played",
                        "stone gains {C:chips}+#1#{} chips permanently"}
            },
            j_ina_Axel = {
                name = "Axel",
                text = {"{C:fire}Fire Tornado",
                        "{X:mult,C:white}X#1#{} if the played hand",
                        "contains a {C:red}heart{} flush"}
            },
            j_ina_Shadow = {
                name = "Shadow",
                text = {"{C:forest}Shadow Tornado{}",
                        "{C:mult}+#1#{} Mult",
                        "Gains {C:mult}+#2#{} Mult for each hand played without",
                        "any other joker being activated"}
            },
            j_ina_Willy = {
                name = "Willy",
                text = {"Never surrender!", "{C:mult}+#1#{} Mult on your last hand",
                        "Increases by {C:mult}+#2#{} per last hand played",
                        "{C:inactive}(Grows up at {C:mult}+#1#{C:inactive} / {C:mult}+#3#{C:inactive}  Mult)"}
            },
            j_ina_Max = {
                name = "Max",
                text = {"{C:wind}Spiral Shot{}",
                        "{C:chips}+#2#{} Chips",
                        "{C:chips}+#1#{} Chips for each {X:wind,C:white}Wind{} joker"}
            },
            j_ina_Peabody = {
                name = "Peabody",
                text = {"{C:mountain}God Hand{}", "{C:mult}+#1#{} Mult on your last hand",
                        "Increases by {C:mult}+#2#{} per last hand played"}
            },
            j_ina_Talisman = {
                name = "Talisman",
                text = {"{C:forest}Teleport Shot{}",
                        "Retriggers the {X:occult,C:white}Occult{} joker",
                        "to his right{}"}
             },
            j_ina_Wolfy = {
                name = "Wolfy",
                text = {"{C:fire}Moonsault{}",
                    "{X:mult,C:white}X#1#{}",
                    "Gains {X:mult,C:white}X#2#{} for each",
                    "{C:tarot}The Moon{} card used"}
            },
            j_ina_Blood = {
                name = "Blood",
                text = {"{C:mountain}Poison Fog{}",
                        "{C:attention}Drains{} {C:money}#1#${} from adjacent jokers",
                        "{C:chips}+#2#{} chips per each {C:money}1${} ",
                        "in sell value",
                        "{C:inactive}Currently{} {C:chips}+#3#{}",
                    }
            },
            j_ina_Grave = {
                name = "Grave",
                text = {"{C:fire}Curse{}", "{C:green}#1# in #2#{} chance",
                        "to create a {C:tarot}Death{} card",
                        "for every {C:attention}6{} scored"}
            },
            j_ina_Mask = {
                name = "Mask",
                text = {"{C:wind}Killer Blade{}", 
                    "Sacrifices the right joker",
                    "and gains {C:money}#1#${} sell value",
                    "when blind is selected"}
            },
            j_ina_Styx = {
                name = "Styx",
                text = {"{C:forest}Ghost Shot{}",
                        "{C:chips}+#1#{} Chips",
                        "{C:chips}+#2#{} Chips for each {C:tarot}tarot{} card used"}
            },
            j_ina_Franky = {
                name = "Franky",
                text = {"{C:mountain}Mega Quake{}", "{C:attention}High card{} gives {C:mult}+#1#{} Mult"}
            },
            j_ina_Mummy = {
                name = "Mummy",
                text = {"{C:forest}Ghost Pull{}", 
                    "Each {C:clubs}#3#{} gives {C:mult}+#1#{} and {C:chips}+#2#{}"}
            },
            j_ina_King = {
                name = "King",
                text = {"{C:fire}Power Shield{}", 
                        "If the played hand contains", 
                        "a {C:attention}Three of a Kind{} of {C:attention}Kings{}:", 
                        "Create a copy of the {C:attention}rightmost{} king"}
            },
            j_ina_Bloom = {
                name = "Bloom",
                text = {"{C:fire}Wrath Shot{}", 
                        "{C:mult}+#1#{} mult", 
                        "Gains {C:mult}+#2#{} mult if played hand",
                        "contains a {C:attention}straight{}"}
            },
            j_ina_Drent = {
                name = "Drent",
                text = {"{C:mountain}Earthquake{}", 
                        "{C:green}#1# in #2#{} chance",
                        "to create a {C:tarot}The Tower{} card",
                        "after every {C:attention}hand{} played.",
                        "Odds improve by 1",
                        "for each {X:mountain,C:white}Mountain{} joker",}
            },
            j_ina_Jude = {
                name = "Jude",
                text = {"{C:wind}Illusion Ball{}", 
                        "{X:mult,C:white}X#1#{}", 
                        "After each hand played",
                        "gains {X:mult,C:white}X#2#{} each time the joker",
                        "to his {C:attention}left{} has triggered",
                        "in the scoring hand"}
            },
            j_ina_Martin = {
                name = "Martin",
                text = {"{C:forest}Killer Slide{}", 
                        "{C:blue}Common{} jokers give {C:mult}+#1#{} mult", 
                        "{C:green}Uncommon{} jokers give {C:mult}+#2#{} mult",
                        "{C:red}Rare{} jokers give {X:mult,C:white}X#3#{} mult",
                        "{C:purple}Legendary{} jokers give {{X:dark_edition,C:white}^#4#{} mult"}
            },
            j_ina_Master = {
                name = "Master",
                text = {"{C:wind}Breakthrough{}", 
                        "{C:mult}+#1#{} mult per", 
                        "{X:royal academy,C:white}R.Academy{} Joker",
                        "if this is the {C:attention}leftmost{} Joker"}
            },
            j_ina_Samford = {
                name = "Samford",
                text = {"{C:forest}Emperor Penguin No. 2{}", 
                        "{X:mult,C:white}X#1#{} if you have at least",
                        "{C:attention}1{} {X:mf,C:white}MF{} and {C:attention}2{} {X:fw,C:white}FW{} jokers"}
            },
            j_ina_Swing = {
                name = "Swing",
                text = {"{C:wind}Clone Faker{}", 
                        "{C:wind}+#1#{} Chips per", 
                        "{X:royal academy,C:white}R.Academy{} Joker if the",
                        "played hand contains {C:attention}Three of a Kind{}"}
            }, 
            j_ina_Chicken = {
                name = "Chicken",
                text = {
                    "{C:fire}Golden Egg{}",
                    "{C:attention}Wild cards{} have",
                    "{C:green}#1# in #2#{} chance",
                    "to earn {C:money}#3#${} when scored"
                }
            },
            j_ina_Boar = {
                name = "Boar",
                text = {
                    "{C:fire}Wild Claw{}",
                    "If you play a {C:attention}Pair of Deuces{}",
                    "destroy them and generate",
                    " a {C:attention}Wild Tag{}"
                }
            },
            j_ina_Chamaleon = {
                name = "Chamaleon",
                text = {
                    "{C:wind}Afterimage{}",
                    "You can play {C:attention}Flushes with {C:attention}4 cards{}",
                    " If you play a 5th card",
                    "and it's not the same suit as the other 4,",
                    "transform it into a {C:tarot}Wild Card{}"
                }
            },
            j_ina_Eagle = {
                name = "Eagle",
                text = {
                    "{C:wind}Condor Dive{}",
                    "Gains {C:mult}+#1# mult{} for each",
                    "{C:tarot}Wild Card{} scoring in a hand",
                    "that contains a {C:attention}Straight{}",
                    "{C:inactive}Currently{} {C:mult}+#2#{}"
                }
            },
            j_ina_Monkey = {
                name = "Monkey",
                text = {
                    "{C:wind}Monkey flip{}",
                    "Gain {X:mult,C:white}XMult{} equal to {C:tarot}Wild Cards{}",
                    "in deck multiplied",
                    "by {X:wild,C:white}Wild{} Players in team / 10",
                    "Currently {X:mult,C:white}X#1#{}"
                }
            },
            j_ina_Gorilla = {
                name = "Gorilla",
                text = {
                    "{C:mountain}Tarzan Kick{}",
                    "Creates a {C:attention}Wild Tag{}",
                    "after defeating the Boss Blind"
                }
            },
            j_ina_Cheetah = {
                name = "Cheetah",
                text = {
                    "{C:wind}Dash Accelerator{}",
                    "If you play {C:attention} 5 scoring Wild cards{}",
                    "retrigger all of them once",
                    "for each player of element {X:select_element,C:white}#1#{}",
                    "Element change each round"
                }
            },
            j_ina_Feldt = {
                name = "Feldt",
                text = {
                    "{C:forest}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Marvel = {
                name = "Marvel",
                text = {
                    "{C:mountain}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Tell = {
                name = "Tell",
                text = {
                    "{C:forest}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Seller = {
                name = "Seller",
                text = {
                    "{C:wind}Phsycho Shot{}",
                    "After each round played",
                    "gain {C:money}+#2#$ sell potential{}.",
                    "When Seller is sold, increase",
                    "{C:money}sell value{} of others jokers",
                    "by his sell potential",
                    "{C:inactive}Currently{} {C:money}#1#${}"
                }
            },

            j_ina_Kind = {
                name = "Kind",
                text = {
                    "{C:forest}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Turner = {
                name = "Turner",
                text = {
                    "{C:fire}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Under = {
                name = "Under",
                text = {
                    "{C:forest}Below",
                    "Scores {C:chips}#1# / log2(#2# + 1){} chips",
                    "for each {X:gk,C:white}GK{}{}"
                }
            },
            -- Otaku
            j_ina_Idol = {
                name = "Idol",
                text = {
                    "{C:mountain}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Hero = {
                name = "Hero",
                text = {
                    "{C:fire}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Custom = {
                name = "Custom",
                text = {
                    "{C:wind}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Robot = {
                name = "Robot",
                text = {
                    "{C:wind}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Gamer = {
                name = "Gamer",
                text = {
                    "{C:fire}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Artist = {
                name = "Artist",
                text = {
                    "{C:wind}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Arcade = {
                name = "Arcade",
                text = {
                    "{C:forest}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            -- Inazuma Eleven
            j_ina_Hillman = {
                name = "Hillman",
                text = {
                    "{C:mountain}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Island = {
                name = "Island",
                text = {
                    "{C:forest}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Sweet = {
                name = "Sweet",
                text = {
                    "{C:mountain}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Butler = {
                name = "Butler",
                text = {
                    "{C:forest}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Barista = {
                name = "Barista",
                text = {
                    "{C:wind}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Builder = {
                name = "Builder",
                text = {
                    "{C:fire}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            -- Shuriken
            j_ina_Hood = {
                name = "Hood",
                text = {
                    "{C:forest}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Hillfort = {
                name = "Hillfort",
                text = {
                    "{C:wind}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Code = {
                name = "Code",
                text = {
                    "{C:mountain}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Star = {
                name = "Star",
                text = {
                    "{C:wind}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Cleats = {
                name = "Cleats",
                text = {
                    "{C:wind}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Hattori = {
                name = "Hattori",
                text = {
                    "{C:forest}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Cloack = {
                name = "Cloack",
                text = {
                    "{C:fire}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            -- Farm
            j_ina_Greeny = {
                name = "Greeny",
                text = {
                    "{C:fire}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Hayseed = {
                name = "Hayseed",
                text = {
                    "{C:mountain}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Sherman = {
                name = "Sherman",
                text = {
                    "{C:fire}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Spray = {
                name = "Spray",
                text = {
                    "{C:fire}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Dawson = {
                name = "Dawson",
                text = {
                    "{C:wind}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Muffs = {
                name = "Muffs",
                text = {
                    "{C:forest}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Hillvalley = {
                name = "Hillvalley",
                text = {
                    "{C:mountain}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            -- Kirkwood
            j_ina_Neville = {
                name = "Neville",
                text = {
                    "{C:fire}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Night = {
                name = "Night",
                text = {
                    "{C:fire}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Marvin = {
                name = "Marvin",
                text = {
                    "{C:fire}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Thomas = {
                name = "Thomas",
                text = {
                    "{C:wind}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Tyler = {
                name = "Tyler",
                text = {
                    "{C:mountain}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Damian = {
                name = "Damian",
                text = {
                    "{C:wind}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Nashmith = {
                name = "Nashmith",
                text = {
                    "{C:forest}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            -- Zeus
            j_ina_Poseidon = {
                name = "Poseidon",
                text = {
                    "{C:mountain}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Hephestus = {
                name = "Hephestus",
                text = {
                    "{C:fire}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Apollo = {
                name = "Apollo",
                text = {
                    "{C:forest}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Artemis = {
                name = "Artemis",
                text = {
                    "{C:wind}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Hermes = {
                name = "Hermes",
                text = {
                    "{C:forest}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Demeter = {
                name = "Demeter",
                text = {
                    "{C:fire}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

            j_ina_Aphrodite = {
                name = "Aphrodite",
                text = {
                    "{C:forest}Placeholder{}",
                    "Placeholder effect line 1",
                    "Placeholder effect line 2"
                }
            },

        },
        Other = {
            Mountain = {
                name = "Type",
                text = {"{X:mountain,C:white}Mountain{}"}
            },
            Fire = {
                name = "Type",
                text = {"{X:fire,C:white}Fire{}"}
            },
            GK = {
                name = "Position",
                text = {"{X:gk,C:white}GK{}"}
            },
            FW = {
                name = "Position",
                text = {"{X:fw,C:white}FW{}"}
            },
            Forest = {
                name = "Type",
                text = {"{X:forest,C:white}Forest{}"}
            },
            Wind = {
                name = "Type",
                text = {"{X:wind,C:white}Wind{}"}
            },
            DF = {
                name = "Position",
                text = {"{X:df,C:white}DF{}"}
            },
            MF = {
                name = "Position",
                text = {"{X:mf,C:white}MF{}"}
            },
            p_ina_team_pack_raimon = {
                name = "Raimon Pack",
                text = {
                    "Choose {C:attention}#1#{} from among",
                    "{C:attention}#2#{} {X:raimon,C:white}Raimon{} players"
                },
            },
            p_ina_team_pack_occult = {
                name = "Occult Pack",
                text = {
                    "Choose {C:attention}#1#{} from among",
                    "{C:attention}#2#{} {X:occult,C:white}Occult{} players"
                },
            },
            p_ina_team_pack_royal = {
                name = "R.Academy Pack",
                text = {
                    "Choose {C:attention}#1#{} from among",
                    "{C:attention}#2#{} {X:royal academy,C:white}R.Academy{} players"
                },
            },
            p_ina_team_pack_wild = {
                name = "Wild Pack",
                text = {
                    "Choose {C:attention}#1#{} from among",
                    "{C:attention}#2#{} {X:wild,C:white}Wild{} players"
                },
            },
        },
        Planet = {},
        Spectral = {},
        Stake = {},
        Tag = {
            tag_ina_wild_tag = {
                name = "Wild Tag",
                text = {
                    "Shop has a {C:attention}free{} {C:uncommon}Uncommon{} player",
                    "from one of your teams",
                }, 
            },
        },
        Tarot = {},
        Voucher = {}
    },
    misc = {
        achievement_descriptions = {},
        achievement_names = {},
        blind_states = {},
        challenge_names = {},
        collabs = {},
        dictionary = {
            ina_evolve_level = "Level Up!",
            ina_evolve_success = "Grown Up!",
            ina_val_down = "Drained!",
            ina_training = "Swap!",
            ina_next_match = "Match",
            k_team_pack = "Team Pack",
            ina_convert = "Converted!",
            ina_potential_increased = "Potential Increased!",
            ina_sell_increased= "Jokers Buffed!"
        },
        high_scores = {},
        labels = {},
        poker_hand_descriptions = {},
        poker_hands = {},
        quips = {},
        ranks = {},
        suits_plural = {},
        suits_singular = {},
        tutorial = {},
        v_dictionary = {
            a_powmult = { "^#1# Mult" },
        },
        v_text = {}
    }
}
