local generate_planet_text = function()
    return {
        "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
        "{C:attention}#2#",
        "{C:mult}+#3#{} Mult and",
        "{C:chips}+#4#{} chips",
    }
end

return {

    Back = {
        b_ina_hillman = {
            name = "Hillman",
            text = {
                "{C:pink}#1# Managers{}",
                "A partir de {C:attention}ante #2#{} genera",
                "{C:pink}#3# Strat{} cada ronda",
                "{C:inactive}Ha de haber espacio{}"
            }
        },
        b_ina_ray_dark = {
            name = "Ray Dark",
            text = {
                "{C:pink}#1# Managers{}",
                "Las cartas {C:spectral}espectrales{}",
                "pueden salir en la tienda"
            },
            unlock = {
                "Usa un {C:dark_edition}Néctar de los Dioses{}"
            }
        },
        b_ina_newton_thomas = {
            name = "Newton Thomas",
            text = {
                "{C:pink}#1# Managers{}",
                "{C:chips}-1{} Mano",
                "Puedes ver las próximas",
                "{C:attention}3{} cartas a jugar"
            },
        },
        b_ina_wintersea = {
            name = "Wintersea",
            text = {
                "{C:pink}#1# Managers{}",
                "El primer joker",
                "será {C:dark_edition}eterno{}, {C:attention}fijado{}",
                "y {C:mult}policromático{}"
            },
        },
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

    Training = {
        c_ina_upgrade_technique_Forest_GK = {
            name = "Mejora de técnica",
            text = { "Mejora el nivel de técnica del",
                "jugador seleccionado si este es del",
                "tipo {C:forest}Bosque{} y su posición es {X:gk,C:white}GK{}" }
        },
        c_ina_upgrade_technique_Forest_DF = {
            name = "Mejora de técnica",
            text = { "Mejora el nivel de técnica del",
                "jugador seleccionado si este es del",
                "tipo {C:forest}Bosque{} y su posición es {X:df,C:white}DF{}" }
        },
        c_ina_upgrade_technique_Forest_MF = {
            name = "Mejora de técnica",
            text = { "Mejora el nivel de técnica del",
                "jugador seleccionado si este es del",
                "tipo {C:forest}Bosque{} y su posición es {X:mf,C:white}MF{}" }
        },
        c_ina_upgrade_technique_Forest_FW = {
            name = "Mejora de técnica",
            text = { "Mejora el nivel de técnica del",
                "jugador seleccionado si este es del",
                "tipo {C:forest}Bosque{} y su posición es {X:fw,C:white}FW{}" }
        },
        c_ina_upgrade_technique_Fire_GK = {
            name = "Mejora de técnica",
            text = { "Mejora el nivel de técnica del",
                "jugador seleccionado si este es del",
                "tipo {C:fire}Fuego{} y su posición es {X:gk,C:white}GK{}" }
        },
        c_ina_upgrade_technique_Fire_DF = {
            name = "Mejora de técnica",
            text = { "Mejora el nivel de técnica del",
                "jugador seleccionado si este es del",
                "tipo {C:fire}Fuego{} y su posición es {X:df,C:white}DF{}" }
        },
        c_ina_upgrade_technique_Fire_MF = {
            name = "Mejora de técnica",
            text = { "Mejora el nivel de técnica del",
                "jugador seleccionado si este es del",
                "tipo {C:fire}Fuego{} y su posición es {X:mf,C:white}MF{}" }
        },
        c_ina_upgrade_technique_Fire_FW = {
            name = "Mejora de técnica",
            text = { "Mejora el nivel de técnica del",
                "jugador seleccionado si este es del",
                "tipo {C:fire}Fuego{} y su posición es {X:fw,C:white}FW{}" }
        },
        c_ina_upgrade_technique_Wind_GK = {
            name = "Mejora de técnica",
            text = { "Mejora el nivel de técnica del",
                "jugador seleccionado si este es del",
                "tipo {C:wind}Viento{} y su posición es {X:gk,C:white}GK{}" }
        },
        c_ina_upgrade_technique_Wind_DF = {
            name = "Mejora de técnica",
            text = { "Mejora el nivel de técnica del",
                "jugador seleccionado si este es del",
                "tipo {C:wind}Viento{} y su posición es {X:df,C:white}DF{}" }
        },
        c_ina_upgrade_technique_Wind_MF = {
            name = "Mejora de técnica",
            text = { "Mejora el nivel de técnica del",
                "jugador seleccionado si este es del",
                "tipo {C:wind}Viento{} y su posición es {X:mf,C:white}MF{}" }
        },
        c_ina_upgrade_technique_Wind_FW = {
            name = "Mejora de técnica",
            text = { "Mejora el nivel de técnica del",
                "jugador seleccionado si este es del",
                "tipo {C:wind}Viento{} y su posición es {X:fw,C:white}FW{}" }
        },
        c_ina_upgrade_technique_Mountain_GK = {
            name = "Mejora de técnica",
            text = { "Mejora el nivel de técnica del",
                "jugador seleccionado si este es del",
                "tipo {C:mountain}Montaña{} y su posición es {X:gk,C:white}GK{}" }
        },
        c_ina_upgrade_technique_Mountain_DF = {
            name = "Mejora de técnica",
            text = { "Mejora el nivel de técnica del",
                "jugador seleccionado si este es del",
                "tipo {C:mountain}Montaña{} y su posición es {X:df,C:white}DF{}" }
        },
        c_ina_upgrade_technique_Mountain_MF = {
            name = "Mejora de técnica",
            text = { "Mejora el nivel de técnica del",
                "jugador seleccionado si este es del",
                "tipo {C:mountain}Montaña{} y su posición es {X:mf,C:white}MF{}" }
        },
        c_ina_upgrade_technique_Mountain_FW = {
            name = "Mejora de técnica",
            text = { "Mejora el nivel de técnica del",
                "jugador seleccionado si este es del",
                "tipo {C:mountain}Montaña{} y su posición es {X:fw,C:white}FW{}" }
        },
    },

    Edition = {},

    Enhanced = {},

    Other = {
        ina_training_seal = {
            name = "Sello de entrenamiento",
            text = {
                "Crea una carta de {C:training}Entrenamiento{}",
                "si puntúa en la {C:attention}última mano{}",
                "{C:inactive}(Debe haber espacio){}",
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
        Frontal = {
            name = "Frontal",
            text = { "Se activa si es el",
                "joker de más a la {C:attention}Izquierda{}" }
        },
        Trillizos = {
            name = "Triángulo Z",
            text = { "Si tienes a {C:attention}Thomas{}",
                "{C:attention}Tyler{} y {C:attention}Marvin{} reactiva",
                "las cartas {C:attention}impares{}" }
        },
        Right_Footed = {
            name = "Diestro",
            text = { "Se activa si es el",
                "joker de más a la {C:attention}Derecha{}" }
        },
        p_ina_growing_pack = {
            name = "Pack Creciente",
            text = { "Elige {C:attention}#1#{} entre {C:attention}#2#{}", "{C:attention}Jokers{} de tus equipos" }
        },
        p_ina_advanced_pack = {
            name = "Pack Avanzado",
            text = { "Elige {C:attention}#1#{} entre {C:attention}#2#{}", "{C:attention}Jokers{} de tus equipos" }
        },
        p_ina_item_pack_ina = {
            name = "Ina Pack",
            text = { "Elige {C:attention}#1#{} de {C:attention}#2#{} Cartas del {C:tarot}Tarot{}",
                "#3# {C:strat}Strats{} o #4# {C:training}Entrenamientos{}",
                "compatible con uno de tus jugadores",
                "para usar de inmediato" }
        },
        p_ina_manager_pack = {
            name = "Manager Pack",
            text = { "Elige {C:attention}#1#{} de {C:attention}#2#{} {C:pink}Managers{}" }
        },
        p_ina_training_pack = {
            name = "Training Pack",
            text = { "Elige {C:attention}#1#{} de {C:attention}#2#{} {C:training}Entrenamientos{}",
                "para usar de inmediato" }
        },
        p_ina_jumbo_training_pack = {
            name = "Jumbo Training Pack",
            text = { "Elige {C:attention}#1#{} de {C:attention}#2#{} {C:training}Entrenamientos{}",
                "para usar de inmediato", "Al menos uno será compatible",
                "con tus {C:attention}Jokers{}" }
        },
        p_ina_mega_training_pack = {
            name = "Mega Training Pack",
            text = { "Elige {C:attention}#1#{} de {C:attention}#2#{} {C:training}Entrenamientos{}",
                "para usar de inmediato", "Al menos dos serán compatibles",
                "con tus {C:attention}Jokers{}" }
        },
        ina_harvest_sticker = {
            name = "Cosechable",
            text = {
                "Esta carta puede ser",
                "cosechada por jokers"
            },
        },
        ina_tech_plus1_sticker = {
            name = "Técnica +1",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_plus2_sticker = {
            name = "Técnica +2",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_plus3_sticker = {
            name = "Técnica +3",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_plus4_sticker = {
            name = "Técnica +4",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_plus5_sticker = {
            name = "Técnica +5",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_number2_sticker = {
            name = "Técnica número 2",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_number3_sticker = {
            name = "Técnica número 3",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_number4_sticker = {
            name = "Técnica número 4",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_numbera_sticker = {
            name = "Técnica A",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_numbers_sticker = {
            name = "Técnica S",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_numberz_sticker = {
            name = "Técnica Z",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_numberinf_sticker = {
            name = "Técnica infinito",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_grade2_sticker = {
            name = "Técnica grado 2",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_grade3_sticker = {
            name = "Técnica grado 3",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_grade4_sticker = {
            name = "Técnica grado 4",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_grade5_sticker = {
            name = "Técnica grado 5",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_grade0_sticker = {
            name = "Técnica grado 0",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_j_sticker = {
            name = "Técnica J",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_q_sticker = {
            name = "Técnica Q",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_k_sticker = {
            name = "Técnica K",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_a_sticker = {
            name = "Técnica A",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
            },
        },
        ina_tech_joker_sticker = {
            name = "Técnica Joker",
            text = {
                "Este comodín tiene las",
                "estadísticas aumentadas"
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
            text = { "Sube el {C:training}nivel de técnica{}",
                "de una carta sin importar",
                "su tipo o posición" }
        },
        c_ina_divine_water = {
            name = "Néctar de los Dioses",
            text = { "Sube el {C:training}nivel de técnica{}",
                "de una carta {C:dark_edition,E:1}al máximo{}",
                "pero lo vuelve {C:dark_edition}perecedero{}" }
        },
        c_ina_wait = {
            name = "Espere un poco más",
            text = { "Crea un manager {C:dark_edition}Legendario{}" }
        },
        c_ina_centella = {
            name = "Centro centella",
            text = { "Sube el {C:training}nivel de técnica{}",
                "de todos tus {C:attention}titulares{}" }
        }
    },

    Stake = {},

    Tag = {
        tag_ina_wild_tag = {
            name = "Etiqueta Wild",
            text = { { "La tienda tiene un {C:attention}jugador gratuito{}",
                "{C:uncommon}Poco Común{} de uno de tus equipos",
            },
                { "Probabilidad aumentada de que",
                    "el comodín sea {C:dark_edition}negativo{}" } }
        },
        tag_ina_chain_tag = {
            name = "Etiqueta Cadena",
            text = { "Cambia la {C:attention}Ciega grande{}, Si estas en",
                "una ciega grande, cambia la {C:attention}Ciega Jefe{}" }
        },
        tag_ina_bench_tag = {
            name = "Etiqueta Banquillo",
            text = { "Otorga gratis un {C:pink}Manager Pack{}" }
        },
        tag_ina_technique_tag = {
            name = "Etiqueta Técnica",
            text = { "Otorga gratis un {C:training}Mega Training Pack{}" }
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
            unlock = {
                "{C:mult}Derrota{} a un equipo",
                "con {C:attention}al menos{} un jugador",
                "que pertenezca a dicho equipo"
            }
        },
        v_ina_training = {
            name = "Entrenamiento",
            text = {
                "{C:attention}+1{} al {C:gold}nivel máximo{} de técnica"
            },
        },
        v_ina_training_2 = {
            name = "Súper Entrenamiento",
            text = {
                "{C:attention}+1{} al {C:maxlvl}nivel máximo{} de técnica"
            },
            unlock = {
                "Sube a {C:training}ASZ/+4/A/G5{}",
                "la técnica de un jugador"
            }
        },
        v_ina_managers_1 = {
            name = "Nueva incorporación",
            text = {
                "{C:attention}+1{} espacio de {C:enhanced}Mánager{}"
            },
        },
        v_ina_managers_2 = {
            name = "Nueva incorporación",
            text = {
                "{C:attention}+1{} espacio de {C:enhanced}Mánager{}"
            },
            unlock = {
                "Consigue espacio para {C:attention}3{} {C:pink}Managers{}"
            }
        },
    }
}
