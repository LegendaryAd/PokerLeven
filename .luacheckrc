std = "luajit"

globals = {
    "G", "love", "lovely", "Controller", "SMODS", "Pokerleven"
}

ignore = {
    "111", -- setting non-standard global variable
    "113", -- unused argument
    "212", -- unused argument in function
    "121", -- unused variable
    "421", -- unused loop variable
    "432", -- unused label
}

max_line_length = 160
