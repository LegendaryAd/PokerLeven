return {
    descriptions = {
        Back = {},
        Blind = {
            -- Blinds pequeños
            bl_ina_benchers = {
                name = "Suplentes",
                text = {}
            },
            bl_ina_baseball_all_stars = {
                name = "Estrellas del Béisbol",
                text = {}
            },
            bl_ina_strange_guys = {
                name = "Chicos Extraños",
                text = {}
            },
            bl_ina_inazuma08 = {
                name = "Inazuma 08",
                text = {}
            },
            bl_ina_inazuma_town = {
                name = "Ciudad Inazuma",
                text = {}
            },
            bl_ina_glasses = {
                name = "Gafas",
                text = {}
            },
            -- Blinds grandes
            bl_ina_ff_regional_a = {
                name = "Selección FF A",
                text = {}
            },
            bl_ina_ff_regional_b = {
                name = "Selección FF B",
                text = {}
            },
            bl_ina_ff_national_a = {
                name = "Selección Nacional A",
                text = {"Un poco más grandes"}
            },
            bl_ina_ff_national_b = {
                name = "Selección Nacional B",
                text = {"Un poco grandes"}
            },
            -- Blinds jefes
            bl_ina_goalkeeper = {
                name = "Portero",
                text = {"Los jugadores {X:fw,C:white}DC{} están debilitados"}
            },
            bl_ina_forward = {
                name = "Delantero",
                text = {"Los jugadores {X:gk,C:white}PT{} están debilitados"}
            },
            bl_ina_defense = {
                name = "Defensa",
                text = {"Los jugadores {X:mf,C:white}MC{} están debilitados"}
            },
            bl_ina_midfielder = {
                name = "Centrocampista",
                text = {"Los jugadores {X:df,C:white}DF{} están debilitados"}
            },
            bl_ina_fire = {
                name = "Jefe Fuego",
                text = {"Los jugadores de tipo {X:forest,C:white}Bosque{} están debilitados"}
            },
            bl_ina_forest = {
                name = "Jefe Bosque",
                text = {"Los jugadores de tipo {X:wind,C:white}Viento{} están debilitados"}
            },
            bl_ina_mountain = {
                name = "Jefe Montaña",
                text = {"Los jugadores de tipo {X:fire,C:white}Fuego{} están debilitados"}
            },
            bl_ina_wind = {
                name = "Jefe Viento",
                text = {"Los jugadores de tipo {X:mountain,C:white}Montaña{} están debilitados"}
            },
            bl_ina_inazuma_og = {
                name = "Inazuma Eleven",
                text = {}
            },
            bl_ina_royal_blind = {
                name = "Academia Royal",
                text = {}
            }
        },
        Strat = {
            c_ina_tech_book = {
                name = "Libro Técnico",
                text = {"Aplica un {C:pink}Tipo{} aleatorio al Joker más a la izquierda{}"}
            },
            c_ina_tactic_pos = {
                name = "Posición Táctica",
                text = {"Aplica una {C:pink}Posición{} aleatoria al Joker más a la izquierda{}"}
            }
        },
        Edition = {},
        Enhanced = {},
        Joker = {
            j_ina_Kevin = {
                name = "Kevin",
                text = {"{C:forest}Tornado Dragón{}", "Vuelve a activar el comodín {X:fw,C:white}DC{}",
                        "que está a su derecha{}"}
            },
            j_ina_Mark = {
                name = "Mark",
                text = {"¡Nunca te rindas!", "{C:mult}+#1#{} Mult en tu última mano",
                        "Aumenta en {C:mult}+#2#{} por cada última mano jugada",
                        "{C:inactive}(Crece con {C:mult}+#1#{C:inactive} / {C:mult}+#3#{C:inactive} Mult)"}
            },
            j_ina_Nathan = {
                name = "Nathan",
                text = {"{C:wind}Entrada Huracán{}",
                        "Cada jugador de {X:raimon,C:white}Raimon{} otorga {X:mult,C:white}X#2#{}"}
            },
            j_ina_Jack = {
                name = "Jack",
                text = {"{C:mountain}El Muro{}", "Por cada comodín {X:df,C:white}DF{} jugado",
                        "la piedra gana {C:chips}+#1#{} fichas permanentemente"}
            },
            j_ina_Axel = {
                name = "Axel",
                text = {"{C:fire}Tornado de Fuego", "{X:mult,C:white}X#1#{} si la mano jugada",
                        "contiene una escalera de {C:red}corazones{}"}
            },
            j_ina_Shadow = {
                name = "Shadow",
                text = {"{C:forest}Tornado Oscuro{}", "{C:mult}+#1#{} Mult",
                        "Gana {C:mult}+#2#{} Mult por cada mano jugada sin", "activar ningún otro comodín"}
            },
            j_ina_Willy = {
                name = "Willy",
                text = {"¡Nunca te rindas!", "{C:mult}+#1#{} Mult en tu última mano",
                        "Aumenta en {C:mult}+#2#{} por cada última mano jugada",
                        "{C:inactive}(Crece con {C:mult}+#1#{C:inactive} / {C:mult}+#3#{C:inactive} Mult)"}
            },
            j_ina_Max = {
                name = "Max",
                text = {"{C:wind}Remate Espiral{}", "{C:chips}+#2#{} fichas",
                        "{C:chips}+#1#{} fichas por cada comodín de {X:wind,C:white}Viento{}"}
            },
            j_ina_Peabody = {
                name = "Peabody",
                text = {"{C:mountain}Mano Celestial{}", "{C:mult}+#1#{} Mult en tu última mano",
                        "Aumenta en {C:mult}+#2#{} por cada última mano jugada"}
            },
            j_ina_Talisman = {
                name = "Talisman",
                text = {"{C:forest}Rapto Divino{}", "Vuelve a activar el comodín {X:occult,C:white}Occult{}",
                        "que está a su derecha{}"}
            },
            j_ina_Wolfy = {
                name = "Wolfy",
                text = {"{C:fire}Luna creciente{}", "{X:mult,C:white}X#1#{}", "Gana {X:mult,C:white}X#2#{} por cada",
                        "carta {C:tarot}La Luna{} usada"}
            },
            j_ina_Blood = {
                name = "Blood",
                text = {"{C:mountain}Niebla Venenosa{}",
                        "{C:attention}Drena{} {C:money}#1#${} de los comodines adyacentes",
                        "{C:chips}+#2#{} fichas por cada {C:money}1${}", "en valor de venta",
                        "{C:inactive}Actualmente{} {C:chips}+#3#{}"}
            },
            j_ina_Grave = {
                name = "Grave",
                text = {"{C:fire}Maldición{}", "{C:green}#1# de #2#{} de probabilidad",
                        "de crear una carta {C:tarot}Muerte{}", "por cada {C:attention}6{} puntos anotados"}
            },
            j_ina_Mask = {
                name = "Mask",
                text = {"{C:wind}Cuchilla Asesina{}", "Sacrifica el comodín a la derecha",
                        "y gana {C:money}#1#${} de valor de venta", "cuando se selecciona una ciega"}
            },
            j_ina_Styx = {
                name = "Styx",
                text = {"{C:forest}Tiro Fantasma{}", "{C:chips}+#1#{} fichas",
                        "{C:chips}+#2#{} fichas por cada carta {C:tarot}Tarot{} usada"}
            },
            j_ina_Franky = {
                name = "Franky",
                text = {"{C:mountain}Mega Terremoto{}", "{C:attention}Carta alta{} otorga {C:mult}+#1#{} Mult"}
            },
            j_ina_Mummy = {
                name = "Mummy",
                text = {"{C:forest}Gravedad{}", "Cada {C:clubs}#3#{} otorga {C:mult}+#1#{} y {C:chips}+#2#{}"}
            },
            j_ina_King = {
                name = "King",
                text = {"{C:fire}Escudo de Fuerza{}", "Si la mano jugada contiene",
                        "un {C:attention}Trío{} de {C:attention}Reyes{}:",
                        "Crea una copia del rey más a la {C:attention}derecha{}"}
            },
            j_ina_Bloom = {
                name = "Bloom",
                text = {"{C:fire}Chut de los 100 toques{}", "{C:mult}+#1#{} Mult",
                        "Gana {C:mult}+#2#{} Mult si la mano jugada", "contiene una {C:attention}escalera{}"}
            },
            j_ina_Drent = {
                name = "Drent",
                text = {"{C:mountain}Terremoto{}", "{C:green}#1# en #2#{} de probabilidad",
                        "de crear una carta {C:tarot}La Torre{}", "después de cada {C:attention}mano{} jugada.",
                        "La probabilidad mejora en 1", "por cada comodín {X:mountain,C:white}Montaña{}"}
            },
            j_ina_Jude = {
                name = "Jude",
                text = {"{C:wind}Espejismo de Balón{}", "{X:mult,C:white}X#1#{}", "Después de cada mano jugada",
                        "gana {X:mult,C:white}X#2#{} cada vez que el comodín",
                        "a su {C:attention}izquierda{} se activa", "en la mano con puntuación"}
            },
            j_ina_Martin = {
                name = "Martin",
                text = {"{C:forest}Barrido Defensivo{}", "Los comodines {C:blue}Comunes{} otorgan {C:mult}+#1#{} Mult",
                        "Los comodines {C:green}Poco Comunes{} otorgan {C:mult}+#2#{} Mult",
                        "Los comodines {C:red}Raros{} otorgan {X:mult,C:white}X#3#{} Mult",
                        "Los comodines {C:purple}Legendarios{} otorgan {X:dark_edition,C:white}^#4#{} Mult"}
            },
            j_ina_Master = {
                name = "Master",
                text = {"{C:wind}Coz{}", "{C:mult}+#1#{} Mult por cada",
                        "comodín de la {X:royal academy,C:white}Acad. Royal{}",
                        "si es el {C:attention}primer{} comodín a la izquierda"}
            },
            j_ina_Samford = {
                name = "Samford",
                text = {"{C:forest}Pingüino Emperador N.º 2{}", "{X:mult,C:white}X#1#{} si tienes al menos",
                        "{C:attention}1{} {X:mf,C:white}MC{} y {C:attention}2{} {X:fw,C:white}DC{} comodines"}
            },
            j_ina_Swing = {
                name = "Swing",
                text = {"{C:wind}Regate Multiple{}", "{C:wind}+#1#{} Fichas por cada",
                        "comodín de la {X:royal academy,C:white}Acad. Royal{} si la",
                        "mano contiene un {C:attention}Trío{}"}
            },
            j_ina_Chicken = {
                name = "Pollo",
                text = {"{C:fire}Huevo Dorado{}", "Las cartas {C:attention}Salvajes{} tienen",
                        "{C:green}#1# de #2#{} de probabilidad", "de ganar {C:money}#3#${} al puntuar"}
            },
            j_ina_Boar = {
                name = "Jabalí",
                text = {"{C:fire}Garra Salvaje{}", "Si juegas una {C:attention}pareja de doses{}",
                        "destrúyela y genera", "una {C:attention}Etiqueta Salvaje{}"}
            },
            j_ina_Chamaleon = {
                name = "Camaleón",
                text = {"{C:wind}Espejismo{}",
                        "Puedes jugar {C:attention}Escaleras de color con {C:attention}4 cartas{}",
                        "Si juegas una 5.ª carta", "y es de otro palo,",
                        "la transforma en una {C:tarot}Carta Salvaje{}"}
            },
            j_ina_Eagle = {
                name = "Águila",
                text = {"{C:wind}Ataque de Cóndor{}", "Gana {C:mult}+#1#{} Mult por cada",
                        "{C:tarot}Carta Salvaje{} que puntúe en una mano", "que contenga una {C:attention}escalera{}",
                        "{C:inactive}Actualmente{} {C:mult}+#2#{}"}
            },
            j_ina_Monkey = {
                name = "Mono",
                text = {"{C:wind}Giro del Mono{}",
                        "Obtén {X:mult,C:white}XMult{} igual al número de {C:tarot}Cartas Salvajes{}",
                        "en el mazo multiplicado por", "los jugadores {X:wild,C:white}Salvajes{} del equipo / 10",
                        "Actualmente {X:mult,C:white}X#1#{}"}
            },
            j_ina_Gorilla = {
                name = "Gorila",
                text = {"{C:mountain}Remate Tarzán{}", "Crea una {C:attention}Etiqueta Salvaje{}",
                        "al derrotar a la Ciega Jefe"}
            },
            j_ina_Cheetah = {
                name = "Guepardo",
                text = {"{C:wind}Superaceleración{}", "Si juegas {C:attention}5 cartas Salvajes que puntúan{}",
                        "vuelve a activarlas una vez", "por cada jugador del elemento {X:select_element,C:white}#1#{}",
                        "El elemento cambia cada ronda"}
            },
            j_ina_Feldt = {
                name = "Feldt",
                text = {"{C:forest}Marcador Temporal{}", "Línea de efecto temporal 1", "Línea de efecto temporal 2"}
            },

            j_ina_Marvel = {
                name = "Marvel",
                text = {"{C:mountain}Escaner defensa", "Si el valor en {C:chips}chips{} de la carta en",
                        "la mano de puntuación tiene {C:attention}exactamente 3 bits en 1{}",
                        "{C:mult}+#1#{} multiplicador al puntuar{}"}
            },

            j_ina_Tell = {
                name = "Tell",
                text = {"{C:forest}Adivino{}", "{X:chips,C:white}XPI{} si tienes",
                        "{C:attention}3 1 4{} en la mano trasera al puntuar"}
            },

            j_ina_Seller = {
                name = "Vendedor",
                text = {"{C:wind}Psicorremate{}", "Tras cada ronda jugada",
                        "gana {C:money}+#2#$ de potencial de venta{}.", "Cuando se venda el Vendedor, aumenta",
                        "el {C:money}valor de venta{} de otros jokers", "por su potencial de venta",
                        "{C:inactive}Actualmente{} {C:money}#1#${}"}
            },

            j_ina_Kind = {
                name = "Amable",
                text = {"{C:forest}Escaner ataque{}", "Si la mano de puntuación es un {C:attention}palíndrome{},",
                        "reactiva la primera y la última carta."}
            },

            j_ina_Turner = {
                name = "Turner",
                text = {"{C:fire}Tornado de fuego{}", "Crea una copia de la {C:attention}primera carta{}",
                        "puntuada en la {C:attention}primera mano{} jugada",
                        "por cada jugador {X:brain,C:white}Cerebro{} en tu equipo",
                        "si la mano jugada contiene un {C:attention}póker{}"}
            },

            j_ina_Under = {
                name = "Subterráneo",
                text = {"{C:forest}Abajo", "Obtiene {C:chips}#1# / log2(#2# + 1){} chips",
                        "por cada {X:gk,C:white}Portero{}{}"}
            },

            -- Otaku
            j_ina_Idol = {
                name = "Idol",
                text = {"{C:mountain}Marcador de montaña{}", "Efecto pendiente línea 1", "Efecto pendiente línea 2"}
            },

            j_ina_Hero = {
                name = "Héroe",
                text = {"{C:fire}Bola falsa{}", "Transforma cada carta puntuada",
                        "{C:attention}figura{} en un {C:attention}4{}"}
            },

            j_ina_Custom = {
                name = "Custom",
                text = {"{C:wind}Marcador personalizado{}", "Efecto pendiente línea 1", "Efecto pendiente línea 2"}
            },

            j_ina_Robot = {
                name = "Robot",
                text = {"{C:wind}Marcador robótico{}", "Efecto pendiente línea 1", "Efecto pendiente línea 2"}
            },

            j_ina_Gamer = {
                name = "Gamer",
                text = {"{C:fire}Marcador gamer{}", "Efecto pendiente línea 1", "Efecto pendiente línea 2"}
            },

            j_ina_Artist = {
                name = "Artista",
                text = {"{C:wind}Jugador de azar{}",
                        "Si la mano jugada contiene un {C:attention}K{} y una {C:attention}Q{},",
                        "convierte todas las cartas puntuadas en {C:attention}Cartas de la Suerte{}"}
            },

            j_ina_Arcade = {
                name = "Arcade",
                text = {"{C:forest}Marcador arcade{}", "Efecto pendiente línea 1", "Efecto pendiente línea 2"}
            },

            -- Inazuma Eleven
            j_ina_Hillman = {
                name = "Hillman",
                text = {"{C:mountain}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Island = {
                name = "Island",
                text = {"{C:forest}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Sweet = {
                name = "Sweet",
                text = {"{C:mountain}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Butler = {
                name = "Butler",
                text = {"{C:forest}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Barista = {
                name = "Barista",
                text = {"{C:wind}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Builder = {
                name = "Builder",
                text = {"{C:fire}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            -- Shuriken
            j_ina_Hood = {
                name = "Hood",
                text = {"{C:forest}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Hillfort = {
                name = "Hillfort",
                text = {"{C:wind}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Code = {
                name = "Code",
                text = {"{C:mountain}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Star = {
                name = "Star",
                text = {"{C:wind}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Cleats = {
                name = "Cleats",
                text = {"{C:wind}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Hattori = {
                name = "Hattori",
                text = {"{C:forest}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Cloack = {
                name = "Cloack",
                text = {"{C:fire}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            -- Farm
            j_ina_Greeny = {
                name = "Greeny",
                text = {"{C:fire}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Hayseed = {
                name = "Hayseed",
                text = {"{C:mountain}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Sherman = {
                name = "Sherman",
                text = {"{C:fire}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Spray = {
                name = "Spray",
                text = {"{C:fire}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Dawson = {
                name = "Dawson",
                text = {"{C:wind}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Muffs = {
                name = "Muffs",
                text = {"{C:forest}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Hillvalley = {
                name = "Hillvalley",
                text = {"{C:mountain}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            -- Kirkwood
            j_ina_Neville = {
                name = "Neville",
                text = {"{C:fire}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Night = {
                name = "Night",
                text = {"{C:fire}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Marvin = {
                name = "Marvin",
                text = {"{C:fire}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Thomas = {
                name = "Thomas",
                text = {"{C:wind}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Tyler = {
                name = "Tyler",
                text = {"{C:mountain}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Damian = {
                name = "Damian",
                text = {"{C:wind}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Nashmith = {
                name = "Nashmith",
                text = {"{C:forest}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            -- Zeus
            j_ina_Poseidon = {
                name = "Poseidon",
                text = {"{C:mountain}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Hephestus = {
                name = "Hephestus",
                text = {"{C:fire}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Apollo = {
                name = "Apollo",
                text = {"{C:forest}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Artemis = {
                name = "Artemis",
                text = {"{C:wind}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Hermes = {
                name = "Hermes",
                text = {"{C:forest}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Demeter = {
                name = "Demeter",
                text = {"{C:fire}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            },

            j_ina_Aphrodite = {
                name = "Aphrodite",
                text = {"{C:forest}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2"}
            }

        },
        Other = {
            Mountain = {
                name = "Tipo",
                text = {"{X:mountain,C:white}Montaña{}"}
            },
            Fire = {
                name = "Tipo",
                text = {"{X:fire,C:white}Fuego{}"}
            },
            GK = {
                name = "Posición",
                text = {"{X:gk,C:white}Portero{}"}
            },
            FW = {
                name = "Posición",
                text = {"{X:fw,C:white}Delantero{}"}
            },
            Forest = {
                name = "Tipo",
                text = {"{X:forest,C:white}Bosque{}"}
            },
            Wind = {
                name = "Tipo",
                text = {"{X:wind,C:white}Viento{}"}
            },
            DF = {
                name = "Posición",
                text = {"{X:df,C:white}Defensa{}"}
            },
            MF = {
                name = "Posición",
                text = {"{X:mf,C:white}Centrocampista{}"}
            },
            p_ina_team_pack_raimon = {
                name = "Pack Raimon",
                text = {"Elige {C:attention}#1#{} entre", "{C:attention}#2#{} jugadores {X:raimon,C:white}Raimon{}"}
            },
            p_ina_team_pack_occult = {
                name = "Pack Ocultos",
                text = {"Elige {C:attention}#1#{} entre", "{C:attention}#2#{} jugadores {X:occult,C:white}Ocultos{}"}
            },
            p_ina_team_pack_royal = {
                name = "Pack Royal",
                text = {"Elige {C:attention}#1#{} entre",
                        "{C:attention}#2#{} jugadores {X:royal academy,C:white}Royal Academy{}"}
            },
            p_ina_team_pack_wild = {
                name = "Pack Salvajes",
                text = {"Elige {C:attention}#1#{} entre", "{C:attention}#2#{} jugadores {X:wild,C:white}Salvajes{}"}
            }
        },
        Planet = {},
        Spectral = {},
        Stake = {},
        Tag = {
            tag_ina_wild_tag = {
                name = "Etiqueta Salvaje",
                text = {"La tienda tiene un {C:attention}jugador gratuito{} {C:uncommon}Poco Común{}",
                        "de uno de tus equipos"}
            }
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
            ina_evolve_level = "¡Nivel subido!",
            ina_evolve_success = "¡Ha crecido!",
            ina_val_down = "¡Drenado!",
            ina_training = "¡Cambio!",
            ina_next_match = "Partido",
            k_team_pack = "Pack de Equipo",
            ina_convert = "¡Convertido!",
            ina_potential_increased = "¡Potencial aumentado!",
            ina_sell_increased = "¡Jokers mejorados!",
            ina_settings_no_custom_middle_blinds = "Sin Ciegas Pequeñas o Grandes personalizadas",
            ina_settings_middle_blinds_abilities = "Las Ciegas Pequeñas y Grandes no tendrán habilidades"
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
            a_powmult = {"^#1# Mult"},
            ina_idea = {"Idea: #1#"},
            ina_art = {"Arte: #1#"}
        },
        v_text = {}
    }
}
