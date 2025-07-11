local lovely = require("lovely")

SMODS.Atlas({
    key = "Jokers01",
    path = "Jokers01.png",
    px = 71,
    py = 95
}):register()

local custom_colours = loc_colour
function loc_colour(_c, _default)
  if not G.ARGS.LOC_COLOURS then
    custom_colours()
  end
G.ARGS.LOC_COLOURS["mountain"] = HEX("f57c00")  
G.ARGS.LOC_COLOURS["gk"] = HEX("ffa726")        
G.ARGS.LOC_COLOURS["fire"] = HEX("d32f2f")      
G.ARGS.LOC_COLOURS["fw"] = HEX("ef5350")       
G.ARGS.LOC_COLOURS["forest"] = HEX("2e7d32")  
G.ARGS.LOC_COLOURS["df"] = HEX("66bb6a")        
G.ARGS.LOC_COLOURS["air"] = HEX("81d4fa")      
G.ARGS.LOC_COLOURS["mf"] = HEX("4fc3f7")        


  return custom_colours(_c, _default)
end