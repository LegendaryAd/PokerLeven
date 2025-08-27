-- Gazelle
local Zell = {
    name = "Zell",
    pos = { x = 10, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["DiamondDust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.FW,
    pteam = "Polvo de Diamantes",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

return {
    name = "Diamond Dust",
    list = {}
    -- list = { Dvalin, Kenville, Mole, Kayson, Tytan, Fedora, Krypto, Sworm, Mercury, Metron, Zell },
}
