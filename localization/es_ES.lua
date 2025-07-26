return {
    descriptions = {
        Back = {},
        Blind = {
            -- Blinds pequeños
            bl_ina_benchers = {
                name = "ChupaBanquillos",
                text = { "Sam, al banquillo",
                    "(No hace nada)" }
            },
            bl_ina_baseball_all_stars = {
                name = "Grandes Bateadores",
                text = { "Gana con 4 manos" }
            },
            bl_ina_strange_guys = {
                name = "Sospechosos",
                text = { "La primera carta jugada",
                    "de la primera mano se",
                    "convierte en otra aleatoria" }
            },
            bl_ina_inazuma08 = {
                name = "Inazuma 08",
                text = { "Gana 8$!!" }
            },
            bl_ina_inazuma_town = {
                name = "Ciudad Inazuma",
                text = { "Si has jugado más",
                    "de #1# tipos de mano",
                    "-#2# descarte" }
            },
            bl_ina_glasses = {
                name = "Gafitas",
                text = { "Reactiva las primeras dos cartas",
                    "de cristal que puntuen" }
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
                text = { "Un poco más grandes" }
            },
            bl_ina_ff_national_b = {
                name = "Selección Nacional B",
                text = { "Un poco grandes" }
            },
            bl_ina_umbrella = {
                name = "Umbrella",
                text = {}
            },
            bl_ina_inazuma_kids = {
                name = "Inazuma Kids",
                text = {}
            },
            bl_ina_sallys = {
                name = "Sallys",
                text = {}
            },
            bl_ina_occult = {
                name = "Occult",
                text = {}
            },
            bl_ina_raimonOB = {
                name = "Raimon OB",
                text = {}
            },
            bl_ina_shun = {
                name = "Shun",
                text = {}
            },
            bl_ina_empress = {
                name = "Empress",
                text = {}
            },
            -- Blinds jefes
            bl_ina_goalkeeper = {
                name = "GK",
                text = { "Los jugadores {X:fw,C:white}GK{} están debilitados" }
            },
            bl_ina_forward = {
                name = "FW",
                text = { "Los jugadores {X:gk,C:white}FW{} están debilitados" }
            },
            bl_ina_defense = {
                name = "DF",
                text = { "Los jugadores {X:mf,C:white}DF{} están debilitados" }
            },
            bl_ina_midfielder = {
                name = "MF",
                text = { "Los jugadores {X:df,C:white}MF{} están debilitados" }
            },
            bl_ina_fire = {
                name = "Jefe de Fuego",
                text = { "Los jugadores de tipo {X:fire,C:white}Fuego{} están debilitados" }
            },
            bl_ina_forest = {
                name = "Jefe de Bosque",
                text = { "Los jugadores de tipo {X:forest,C:white}Bosque{} están debilitados" }
            },
            bl_ina_mountain = {
                name = "Jefe de Montaña",
                text = { "Los jugadores de tipo {X:Mountain,C:white}Montaña{} están debilitados" }
            },
            bl_ina_wind = {
                name = "Jefe de Viento",
                text = { "Los jugadores de tipo {X:Wind,C:white}Viento{} están debilitados" }
            },
            bl_ina_inazuma_og = {
                name = "Inazuma Eleven",
                text = {}
            },
            bl_ina_royal_blind = {
                name = "Royal Academy",
                text = {}
            },
            bl_ina_wild = {
                name = "Wild",
                text = {}
            },
            bl_ina_brain = {
                name = "Brain",
                text = {}
            },
            bl_ina_otaku = {
                name = "Otaku",
                text = {}
            },
            bl_ina_shuriken = {
                name = "Shuriken",
                text = {}
            },
            bl_ina_farm = {
                name = "Farm",
                text = {}
            },
            bl_ina_kirkwood = {
                name = "Kirkwood",
                text = {}
            },
            bl_ina_zeus = {
                name = "Zeus",
                text = {}
            },

            -- Final Boss Blinds
            bl_ina_zeus_caido = {
                name = "Ultra Zeus",
                text = {}
            }
        },
        Strat = {
            c_ina_tech_book = {
                name = "Libro Técnico",
                text = { "Aplica un {C:pink}Tipo{} aleatorio",
                    "al Joker más a la izquierda{}" }
            },
            c_ina_tactic_pos = {
                name = "Posición Táctica",
                text = { "Aplica una {C:pink}Posición{} aleatoria",
                    "al Joker más a la izquierda{}" }
            }
        },
        Edition = {},
        Enhanced = {},
        Joker = {
            j_ina_Kevin = {
                name = "Kevin",
                text = { "{C:forest}Tornado Dragón{}", "Vuelve a activar el comodín {X:fw,C:white}FW{}",
                    "que está a su derecha{}" }
            },
            j_ina_Mark = {
                name = "Mark",
                text = { "¡Nunca te rindas!", "{C:mult}+#1#{} Mult en tu última mano",
                    "Aumenta en {C:mult}+#2#{} por cada última mano jugada",
                    "{C:inactive}(Crece con {C:mult}+#1#{C:inactive} / {C:mult}+#3#{C:inactive} Mult)" }
            },
            j_ina_Nathan = {
                name = "Nathan",
                text = { "{C:wind}Entrada Huracán{}",
                    "Cada jugador de {X:raimon,C:white}Raimon{} otorga {X:mult,C:white}X#2#{}" }
            },
            j_ina_Jack = {
                name = "Jack",
                text = { "{C:mountain}El Muro{}", "Por cada comodín {X:df,C:white}DF{}",
                    "{C:attention}Las Piedras{} ganan",
                    "{C:chips}+#1#{} fichas permanentemente" }
            },
            j_ina_Axel = {
                name = "Axel",
                text = { "{C:fire}Tornado de Fuego", "{X:mult,C:white}X#1#{} si la mano jugada",
                    "contiene una escalera de {C:red}corazones{}" }
            },
            j_ina_Shadow = {
                name = "Shadow",
                text = { "{C:forest}Tornado Oscuro{}", "{C:mult}+#1#{} Mult",
                    "Gana {C:mult}+#2#{} Mult por cada mano jugada sin", "activar ningún otro comodín" }
            },
            j_ina_Willy = {
                name = "Willy",
                text = { "¡Nunca te rindas!", "{C:mult}+#1#{} Mult en tu última mano",
                    "Aumenta en {C:mult}+#2#{} por cada última mano jugada",
                    "{C:inactive}(Crece con {C:mult}+#1#{C:inactive} / {C:mult}+#3#{C:inactive} Mult)" }
            },
            j_ina_Max = {
                name = "Max",
                text = { "{C:wind}Remate Espiral{}", "{C:chips}+#2#{} fichas",
                    "{C:chips}+#1#{} fichas por cada comodín de {X:wind,C:white}Viento{}" }
            },
            j_ina_Peabody = {
                name = "Peabody",
                text = { "{C:mountain}Mano Celestial{}", "{C:mult}+#1#{} Mult en tu última mano",
                    "Aumenta en {C:mult}+#2#{} por cada última mano jugada" }
            },
            j_ina_Jude_Raimon = {
                name = "Jude",
                text = { "{C:wind}Espejismo de Balón{}", "{X:mult,C:white}X#1#{}", "Después de cada mano jugada",
                    "gana {X:mult,C:white}X#2#{} cada vez que el comodín",
                    "a su {C:attention}izquierda{} se activa", "en la mano con puntuación" }
            },
            -- Occult
            j_ina_Talisman = {
                name = "Talisman",
                text = { "{C:forest}Rapto Divino{}", "Vuelve a activar el comodín {X:occult,C:white}Occult{}",
                    "que está a su derecha{}" }
            },
            j_ina_Wolfy = {
                name = "Wolfy",
                text = { "{C:fire}Luna creciente{}", "{X:mult,C:white}X#1#{}", "Gana {X:mult,C:white}X#2#{} por cada",
                    "carta {C:tarot}La Luna{} usada" }
            },
            j_ina_Blood = {
                name = "Blood",
                text = { "{C:mountain}Niebla Venenosa{}",
                    "{C:attention}Drena{} {C:money}#1#${} de los comodines adyacentes",
                    "{C:chips}+#2#{} fichas por cada {C:money}1${}", "en valor de venta",
                    "{C:inactive}Actualmente{} {C:chips}+#3#{}" }
            },
            j_ina_Grave = {
                name = "Grave",
                text = { "{C:fire}Maldición{}", "{C:green}#1# de #2#{} de probabilidad",
                    "de crear una carta {C:tarot}Muerte{}", "por cada {C:attention}6{} puntos anotados" }
            },
            j_ina_Mask = {
                name = "Mask",
                text = { "{C:wind}Cuchilla Asesina{}", "Sacrifica el comodín a la derecha",
                    "y gana {C:money}#1#${} de valor de venta", "cuando se selecciona una ciega" }
            },
            j_ina_Styx = {
                name = "Styx",
                text = { "{C:forest}Tiro Fantasma{}", "{C:chips}+#1#{} fichas",
                    "{C:chips}+#2#{} fichas por cada carta {C:tarot}Tarot{} usada" }
            },
            j_ina_Franky = {
                name = "Franky",
                text = { "{C:mountain}Mega Terremoto{}", "{C:attention}Carta alta{} otorga {C:mult}+#1#{} Mult" }
            },
            j_ina_Mummy = {
                name = "Mummy",
                text = { "{C:forest}Gravedad{}", "Cada {C:clubs}#3#{} otorga {C:mult}+#1#{} Mult y {C:chips}+#2#{} Chips" }
            },
            j_ina_King = {
                name = "King",
                text = { "{C:fire}Escudo de Fuerza{}", "Si la mano jugada contiene",
                    "un {C:attention}Trío{} de {C:attention}Reyes{}:",
                    "Crea una copia del rey más a la {C:attention}derecha{}" }
            },
            j_ina_Bloom = {
                name = "Bloom",
                text = { "{C:fire}Chut de los 100 toques{}", "{C:mult}+#1#{} Mult",
                    "Gana {C:mult}+#2#{} Mult si la mano jugada", "contiene una {C:attention}escalera{}" }
            },
            j_ina_Drent = {
                name = "Drent",
                text = { "{C:mountain}Terremoto{}", "{C:green}#1# en #2#{} de probabilidad",
                    "de crear una carta {C:tarot}La Torre{}", "después de cada {C:attention}mano{} jugada.",
                    "La probabilidad mejora en 1", "por cada comodín {X:mountain,C:white}Montaña{}" }
            },
            j_ina_Jude = {
                name = "Jude",
                text = { "{C:wind}Espejismo de Balón{}", "{X:mult,C:white}X#1#{}", "Después de cada mano jugada",
                    "gana {X:mult,C:white}X#2#{} cada vez que el comodín",
                    "a su {C:attention}izquierda{} se activa", "en la mano con puntuación" }
            },
            j_ina_Martin = {
                name = "Martin",
                text = { "{C:forest}Barrido Defensivo{}", "Los comodines {C:blue}Comunes{} otorgan {C:mult}+#1#{} Mult",
                    "Los comodines {C:green}Poco Comunes{} otorgan {C:mult}+#2#{} Mult",
                    "Los comodines {C:red}Raros{} otorgan {X:mult,C:white}X#3#{} Mult",
                    "Los comodines {C:purple}Legendarios{} otorgan {X:dark_edition,C:white}^#4#{} Mult" }
            },
            j_ina_Master = {
                name = "Master",
                text = { "{C:wind}Coz{}", "{C:mult}+#1#{} Mult por cada",
                    "comodín de la {X:royal academy,C:white}Acad. Royal{}",
                    "si es el {C:attention}primer{} comodín a la izquierda" }
            },
            j_ina_Samford = {
                name = "Samford",
                text = { "{C:forest}Pingüino Emperador N.º 2{}", "{X:mult,C:white}X#1#{} si tienes al menos",
                    "{C:attention}1{} {X:mf,C:white}MF{} y {C:attention}2{} {X:fw,C:white}FW{} comodines" }
            },
            j_ina_Swing = {
                name = "Swing",
                text = { "{C:wind}Regate Multiple{}", "{C:wind}+#1#{} Fichas por cada",
                    "comodín de la {X:royal academy,C:white}Acad. Royal{} si la",
                    "mano contiene un {C:attention}Trío{}" }
            },
            j_ina_Chicken = {
                name = "Chicken",
                text = { "{C:fire}Huevo Dorado{}", "Las cartas {C:attention}Versatiles{} tienen",
                    "{C:green}#1# de #2#{} de probabilidad", "de ganar {C:money}#3#${} al puntuar" }
            },
            j_ina_Boar = {
                name = "Boar",
                text = { "{C:fire}Garra Salvaje{}", "Si juegas una {C:attention}pareja de doses{}",
                    "destrúyela y genera", "una {C:attention}Etiqueta Wild{}" }
            },
            j_ina_Chamaleon = {
                name = "Chamaleon",
                text = { "{C:wind}Espejismo{}",
                    "Puedes jugar {C:attention}Color{} con 4 cartas",
                    "Si juegas una 5ta carta", "y es de otro palo,",
                    "la transforma en una {C:tarot}Carta Versatil{}" }
            },
            j_ina_Eagle = {
                name = "Eagle",
                text = { "{C:wind}Ataque de Cóndor{}", "Gana {C:mult}+#1#{} Mult por cada",
                    "{C:tarot}Carta Versatil{} que puntúe en una mano", "que contenga una {C:attention}escalera{}",
                    "{C:inactive}Actualmente{} {C:mult}+#2#{}" }
            },
            j_ina_Monkey = {
                name = "Monkey",
                text = { "{C:wind}Giro del Mono{}",
                    "Obtén {X:mult,C:white}XMult{} igual al",
                    "número de {C:tarot}Cartas Versatiles{}",
                    "en el mazo multiplicado por", "los jugadores {X:wild,C:white}Wild{} del equipo / 10",
                    "Actualmente {X:mult,C:white}X#1#{}" }
            },
            j_ina_Gorilla = {
                name = "Gorilla",
                text = { "{C:mountain}Remate Tarzán{}", "Crea una {C:attention}Etiqueta Wild{}",
                    "al derrotar a la Ciega Jefe" }
            },
            j_ina_Cheetah = {
                name = "Cheetah",
                text = { "{C:wind}Superaceleración{}", "Si juegas {C:attention}5 cartas versatiles que puntúan{}",
                    "vuelve a activarlas una vez", "por cada jugador del elemento {X:select_element,C:white}#1#{}",
                    "El elemento cambia cada ronda" }
            },
            j_ina_Feldt = {
                name = "Feldt",
                text = { "{C:forest}Marcador Temporal{}", "Línea de efecto temporal 1", "Línea de efecto temporal 2" }
            },

            j_ina_Marvel = {
                name = "Marvel",
                text = { "{C:mountain}Escaner Defensa", "Si el valor en {C:chips}chips{}",
                    "de la carta que puntua",
                    "tiene {C:attention}exactamente 3 bits en 1{}",
                    "{C:mult}+#1#{} mult{}" }
            },

            j_ina_Tell = {
                name = "Tell",
                text = { "{C:forest}Adivino{}", "{X:chips,C:white}XPI{} si tienes",
                    "{C:attention}3 1 4{} en la mano trasera al puntuar" }
            },

            j_ina_Seller = {
                name = "Seller",
                text = { "{C:wind}Psicorremate{}", "Tras cada ronda jugada",
                    "gana {C:money}+#2#$ de potencial de venta{}.", "Cuando se venda Seller, aumenta",
                    "el {C:money}valor de venta{} de otros jokers", "por su potencial de venta",
                    "{C:inactive}Actualmente{} {C:money}#1#${}" }
            },

            j_ina_Kind = {
                name = "Kind",
                text = { "{C:forest}Escaner ataque{}", "Si la mano de puntuación es un {C:attention}palíndromo{},",
                    "reactiva la primera y la última carta." }
            },

            j_ina_Turner = {
                name = "Turner",
                text = { "{C:fire}Tornado de fuego{}", "Crea una copia de la {C:attention}primera carta{}",
                    "puntuada en la {C:attention}primera mano{} jugada",
                    "por cada jugador {X:brain,C:white}Brain{} en tu equipo",
                    "si la mano jugada contiene un {C:attention}póker{}" }
            },

            j_ina_Under = {
                name = "Under",
                text = { "{C:forest}Calculo Dificil", "Obtiene {C:chips}#1# / log2(#2# + 1){} chips",
                    "por cada {X:gk,C:white}GK{}{}" }
            },

            -- Otaku
            j_ina_Idol = {
                name = "Idol",
                text = { "{C:mountain}Deslizamiento de Portería{}",
                    "Reactiva {C:attention}4s{}",
                    "{C:green}#1# de cada #2#{} veces" }
            },

            j_ina_Hero = {
                name = "Hero",
                text = { "{C:fire}Bola falsa{}", "Transforma cada carta puntuada",
                    "{C:attention}figura{} en un {C:attention}4{}" }
            },

            j_ina_Custom = {
                name = "Custom",
                text = { "{C:wind}Ciclón{}", "Los jokers de {X:wind,C:white}Viento{}", "pueden aparecer múltiples veces" }
            },

            j_ina_Robot = {
                name = "Robot",
                text = { "{C:wind}Confusión{}", "Vuelve a activar las {C:attention}Lucky Cards{}",
                    "puntuadas en una {C:attention}escalera{}",
                    "que estén en la misma posición",
                    "que cada uno de tus jokers",
                    "{X:mf,C:white}MF{} empezando por la izquierda" }
            },

            j_ina_Gamer = {
                name = "Gamer",
                text = { "{C:fire}Bateo Total{}", "Ganas {C:chips}fichas{} iguales a tus {C:attention}FPS / 2{}",
                    "El bono pasa a ser {C:attention}FPS{} si", "tienes al menos 2 jugadores {X:otaku,C:white}Otaku{}",
                    "El valor máximo es {C:attention}144 FPS{}", "{C:inactive}Actualmente{} {C:chips}+#1#{}" }
            },

            j_ina_Artist = {
                name = "Artista",
                text = { "{C:wind}Ludopatía Máxima{}", "Si la mano jugada contiene",
                    "un {C:attention}Rey{} y una {C:attention}Reina{} que puntúen",
                    "convierte todas las cartas puntuadas",
                    "en {C:attention}Cartas de la Suerte{}" }
            },

            j_ina_Arcade = {
                name = "Arcade",
                text = { "{C:forest}Tiro del Cometa{}", "La probabilidad de activar",
                    "el dinero extra en las {C:attention}Lucky Card{}",
                    "es ahora {C:green}#1# en 15{}, Ahora cada",
                    "{C:attention}Lucky Card{}", "cuesta {C:money}#2#${} para jugarse" }
            },

            -- Inazuma Eleven
            j_ina_Hillman = {
                name = "Hillman",
                text = { "{C:mountain}Restaurante Ray Ray{}",
                    "Gana {X:chips,C:white}X#1#{} fichas por",
                    "{C:pink}Strat{} usada esta partida",
                    "{C:inactive}Actualmente{} {X:chips,C:white}X#2#{}" }
            },

            j_ina_Island = {
                name = "Island",
                text = { "{C:forest}Zig zag chispeante{}",
                    "Gana {C:chips}+#1#{} fichas si la mano jugada",
                    "contiene {C:attention}doble pareja{}",
                    "{C:inactive}Actualmente{} {C:chips}+#2#{}" }
            },

            j_ina_Sweet = {
                name = "Sweet",
                text = { "{C:mountain}Reclutamiento{}",
                    "Crea un comodín del {X:raimon,C:white}Raimon{} o {X:inazuma_eleven,C:white}I.Eleven",
                    "cuando se selecciona la ciega{}",
                    "Puede ser {C:chips}Común{} o {C:green}Poco Común{}",
                    "{C:inactive}Tienes que tener espacio{}" }
            },

            j_ina_Butler = {
                name = "Butler",
                text = { "{C:forest}Rentista{}",
                    "La deuda ahora puede",
                    "llegar hasta {C:money}-#1#${}",
                    "por cada {C:money}-#2#${}, cada",
                    "carta que puntue gana",
                    "{C:chips}+#3#{} fichas para el",
                    "resto de la partida" }
            },

            j_ina_Barista = {
                name = "Barista",
                text = { "{C:wind}Master{}",
                    "La última carta jugada da",
                    "{X:chips,C:white}X2{} {C:attention}sus{} chips a mayores" }
            },

            j_ina_Builder = {
                name = "Builder",
                text = { "{C:fire}A Construir{}",
                    "Si la mano jugada contiene",
                    " {C:attention}Full{} transforma una carta",
                    "al azar en {C:attention}Acero{}",
                    "y {C:mult}destruye{} otra carta" }
            },

            -- Shuriken
            j_ina_Hood = {
                name = "Hood",
                text = {
                    "{C:forest}Jutsu de Protección{}",
                    "Gana {X:mult,C:white}X#1#{} por",
                    "cada Joker {X:gk,C:white}GK{}{}",
                    "{C:inactive}Actualmente{} {X:mult,C:white}X#2#{}"
                }
            },

            j_ina_Hillfort = {
                name = "Hillfort",
                text = { "{C:wind}Ataque de las Sombras{}", "Gana {C:chips}+X{} fichas donde {C:chips}X{} es",
                    "{C:attention}la media del valor de venta{}",
                    "de los comodines de {X:wind,C:white}viento{}",
                    "{C:inactive}Actualmente{} {C:chips}+#1#{}" }
            },

            j_ina_Code = {
                name = "Code",
                text = { "{C:mountain}Telaraña{}",
                    "Reactiva las cartas {C:attention}doradas{}",
                    "en la mano al final de la ronda",
                    "tantas veces como",
                    "jugadores del {X:shuriken,C:white}Shuriken{}" }
            },

            j_ina_Star = {
                name = "Star",
                text = { "{C:wind}Regate Múltiple{}", "Por cada carta de {C:red}diamantes{}",
                    "gana {C:money}+#1#${} y {C:mult}+#2#{} Mult", }
            },

            j_ina_Cleats = {
                name = "Cleats",
                text = { "{C:wind}Luna creciente{}",
                    "Al seleccionar la ciega",
                    "{C:green}transforma{} el jugador de",
                    "la derecha en otro",
                    "de la misma {C:green}rareza{}" }
            },

            j_ina_Hattori = {
                name = "Hattori",
                text = { "{C:forest}Remate Múltiple{}",
                    "Al seleccionar la ciega crea",
                    "{C:attention}#1#{} copias básicas",
                    "{C:dark_edition}negativas{} de si mismo.",
                    "Se destruyen al finalizar la ronda" }
            },

            j_ina_Cloack = {
                name = "Cloack",
                text = { "{C:fire}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2" }
            },

            -- Farm
            j_ina_Greeny = {
                name = "Greeny",
                text = { "{C:fire}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2" }
            },

            j_ina_Hayseed = {
                name = "Hayseed",
                text = {
                    "{C:mountain}Semilla del Trío{}",
                    "Gana {C:mult}+3{} de multiplicador",
                    "por cada {C:attention}Trío exacto{} jugado",
                    "{C:inactive}Actualmente{} {C:mult}+#1#{} Mult"
                }
            },

            j_ina_Sherman = {
                name = "Sherman",
                text = { "{C:fire}Trama Trama{}",
                    "Gana {C:chips}+#1# Fichas{}", "cuando se activa un",
                    "jugador del {X:farm,C:white}Farm{}",
                    "{C:inactive}Actualmente{} {C:chips}+#2# Chips{}" }
            },

            j_ina_Spray = {
                name = "Spray",
                text = { "{C:fire}Superbalón rodante{}",
                    "Cuando se selecciona una {C:attention}ciega{} y",
                    "se tiene menos de {C:money}#1#${} gana {X:mult,C:white}X#2#{}",
                    "{C:inactive}Actualmente{}: {X:mult,C:white}X#3#{}" }
            },

            j_ina_Dawson = {
                name = "Dawson",
                text = { "{C:wind}Regate topo{}",
                    "Si se tiene menos de {C:money}#1#${} y",
                    "la mano jugada es {C:attention}carta alta{}",
                    "se {C:attention}duplica{} esa carta" }
            },

            j_ina_Muffs = {
                name = "Muffs",
                text = { "{C:forest}Tiro Cegador{}",
                    "Tras jugar una mano {C:attention}Siembra{}.",
                    "{C:attention}Cosechador:{} Gana {C:mult}+#1# Mult{}",
                    "{C:inactive}Actualmente{} {C:mult}+#2# Mult{}" }
            },

            j_ina_Hillvalley = {
                name = "Hillvalley",
                text = { "{C:mountain}Muralla infinita{}",
                    "Gana {C:chips}+X{} fichas permanentemente ",
                    "al anotar un {C:attention}8{}, {C:attention}9{} o {C:attention}10{} siendo {C:chips}X{} el",
                    "{C:attention}valor más alto{} entre esas cartas",
                    "{C:inactive}Actualmente{}: {C:chips}+#1#{}" }
            },

            -- Kirkwood
            j_ina_Neville = {
                name = "Neville",
                text = { "{C:fire}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2" }
            },

            j_ina_Night = {
                name = "Night",
                text = { "{C:fire}Corte Giratorio{}",
                    "Al seleccionar una",
                    "ciega, genera un jugador",
                    "del {X:kirkwood,C:white}Kirkwood{}, {C:chips}Común{}, o {C:green}Poco Común{}",
                    "{C:attention}Puede generar repetidos{}",
                    "{C:inactive}Requiere espacio{}" }
            },

            j_ina_Marvin = {
                name = "Marvin",
                text = { "{C:fire}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2" }
            },

            j_ina_Thomas = {
                name = "Thomas",
                text = { "{C:wind}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2" }
            },

            j_ina_Tyler = {
                name = "Tyler",
                text = {
                    "{C:mountain}Tornado Inverso{}",
                    "Cuando se juega una {C:attention}pareja{}",
                    "convierte la otra carta en una",
                    "{C:attention}versión dorada{} de sí misma"
                }
            },

            j_ina_Damian = {
                name = "Damian",
                text = {
                    "{C:wind}Viento Ardiente{}",
                    "Al salir de la tienda, gana",
                    "{C:chips}+#1# Fichas{} por cada",
                    "jugador del tipo {C:fire}Fuego{} en juego",
                    "{C:inactive}Actualmente{}: {C:chips}+#2#{}" }
            },

            j_ina_Nashmith = {
                name = "Nashmith",
                text = { "{C:forest}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2" }
            },

            -- Zeus
            j_ina_Poseidon = {
                name = "Poseidon",
                text = { "{C:mountain}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2" }
            },

            j_ina_Hephestus = {
                name = "Hephestus",
                text = { "{C:fire}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2" }
            },

            j_ina_Apollo = {
                name = "Apollo",
                text = { "{C:forest}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2" }
            },

            j_ina_Artemis = {
                name = "Artemis",
                text = { "{C:wind}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2" }
            },

            j_ina_Hermes = {
                name = "Hermes",
                text = { "{C:forest}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2" }
            },

            j_ina_Demeter = {
                name = "Demeter",
                text = { "{C:fire}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2" }
            },

            j_ina_Aphrodite = {
                name = "Aphrodite",
                text = { "{C:forest}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2" }
            }

        },
        Other = {
            Mountain = {
                name = "Tipo",
                text = { "{X:mountain,C:white}Montaña{}" }
            },
            Fire = {
                name = "Tipo",
                text = { "{X:fire,C:white}Fuego{}" }
            },
            GK = {
                name = "Posición",
                text = { "{X:gk,C:white}GK{}" }
            },
            FW = {
                name = "Posición",
                text = { "{X:fw,C:white}FW{}" }
            },
            Forest = {
                name = "Tipo",
                text = { "{X:forest,C:white}Bosque{}" }
            },
            Wind = {
                name = "Tipo",
                text = { "{X:wind,C:white}Viento{}" }
            },
            DF = {
                name = "Posición",
                text = { "{X:df,C:white}DF{}" }
            },
            MF = {
                name = "Posición",
                text = { "{X:mf,C:white}MF{}" }
            },
            Harvester = {
                name = "Cosechador",
                text = { "Se activa al descartar",
                    "una carta {C:attention}Cosechable{}" }
            },
            p_ina_team_pack_raimon = {
                name = "Pack Raimon",
                text = { "Elige {C:attention}#1#{} entre", "{C:attention}#2#{} jugadores {X:raimon,C:white}Raimon{}" }
            },
            p_ina_team_pack_occult = {
                name = "Pack Occult",
                text = { "Elige {C:attention}#1#{} entre", "{C:attention}#2#{} jugadores {X:occult,C:white}Occult{}" }
            },
            p_ina_team_pack_royal = {
                name = "Pack Royal",
                text = { "Elige {C:attention}#1#{} entre",
                    "{C:attention}#2#{} jugadores {X:royal academy,C:white}R. Academy{}" }
            },
            p_ina_team_pack_wild = {
                name = "Pack Wild",
                text = { "Elige {C:attention}#1#{} entre", "{C:attention}#2#{} jugadores {X:wild,C:white}Wild{}" }
            },
            p_ina_team_pack_brain = {
                name = "Pack Brain",
                text = { "Elige {C:attention}#1#{} entre", "{C:attention}#2#{} {X:brain,C:white}Brain{} jugadores" }
            },
            p_ina_team_pack_inazuma = {
                name = "Pack Inazuma",
                text = { "Elige {C:attention}#1#{} entre", "{C:attention}#2#{} {X:inazuma,C:white}Inazuma{} jugadores" }
            },
            p_ina_team_pack_shuriken = {
                name = "Pack Shuriken",
                text = { "Elige {C:attention}#1#{} entre", "{C:attention}#2#{} {X:shuriken,C:white}Shuriken{} jugadores" }
            },
            p_ina_team_pack_farm = {
                name = "Pack Farm",
                text = { "Elige {C:attention}#1#{} entre", "{C:attention}#2#{} {X:farm,C:white}Farm{} jugadores" }
            },
            p_ina_team_pack_kirwood = {
                name = "Pack Kirwood",
                text = { "Elige {C:attention}#1#{} entre", "{C:attention}#2#{} {X:kirwood,C:white}Kirwood{} jugadores" }
            },
            p_ina_team_pack_zeus = {
                name = "Pack Zeus",
                text = { "Elige {C:attention}#1#{} entre", "{C:attention}#2#{} {X:zeus,C:white}Zeus{} jugadores" }
            },
            ina_harvest_sticker = {
                name = "Cosechable",
                text = {
                    "Esta carta puede ser",
                    "cosechada por jokers"
                },
            },
        },
        Planet = {},
        Spectral = {},
        Stake = {},
        Tag = {
            tag_ina_wild_tag = {
                name = "Etiqueta Wild",
                text = { "La tienda tiene un {C:attention}jugador gratuito{}",
                    "{C:uncommon}Poco Común{} de uno de tus equipos" }
            },
            tag_ina_chain_tag = {
                name = "Etiqueta Cadena",
                text = { "Cambia la {C:attention}Ciega grande{}, Si estas en",
                    "una ciega grande, cambia la {C:attention}Ciega Jefe{}" }
            }
        },
        Tarot = {},
        Voucher = {
            v_ina_ex_law = {
                name = "Ley del Ex",
                text = {
                    "Por cada jugador que",
                    "lleves del equipo al",
                    "que te enfrentas, reduce",
                    "en un {C:attention}#1#%{} las {C:chips}fichas{} necesarias"
                },
            },
            v_ina_ex_law_2 = {
                name = "Ley del Ex",
                text = {
                    "Por cada jugador que",
                    "lleves del equipo al",
                    "que te enfrentas, reduce",
                    "en un {C:attention}#1#%{} las {C:chips}fichas{} necesarias"
                },
            },
        }
    },
    misc = {
        achievement_descriptions = {},
        achievement_names = {},
        blind_states = {},
        challenge_names = {},
        collabs = {},
        dictionary = {
            ina_evolve_level = "¡Nivel subido!",
            ina_evolve_success = "¡Intercambio!",
            ina_val_down = "¡Drenado!",
            ina_training = "¡Cambio!",
            ina_next_match = "Siguiente",
            k_team_pack = "Pack de Equipo",
            ina_convert = "¡Convertido!",
            ina_potential_increased = "¡Potencial aumentado!",
            ina_sell_increased = "¡Jokers mejorados!",
            ina_settings_no_custom_middle_blinds = "Sin Ciegas Pequeñas o Grandes personalizadas",
            ina_settings_middle_blinds_abilities = "Las Ciegas Pequeñas y Grandes no tendrán habilidades",
            ina_destroy = "¡Destruido!",
            ina_dribbling = "¡Regate!",
            ina_harvest = "Cosecha!",
            ina_seed = "Siembra!"
        },
        high_scores = {},
        labels = {
            ina_harvest_sticker = "Cosechable"
        },
        poker_hand_descriptions = {},
        poker_hands = {},
        quips = {},
        ranks = {},
        suits_plural = {},
        suits_singular = {},
        tutorial = {},
        v_dictionary = {
            a_powmult = { "^#1# Mult" },
            ina_idea = { "Idea: #1#" },
            ina_art = { "Arte: #1#" }
        },
        v_text = {}
    }
}
