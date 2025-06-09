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
  G.ARGS.LOC_COLOURS["mountain"] = HEX("e97333")
  G.ARGS.LOC_COLOURS["gk"] = HEX("ff9040")
  G.ARGS.LOC_COLOURS["fire"] = HEX("f81020")
  G.ARGS.LOC_COLOURS["fw"] = HEX("eb3232")
  return custom_colours(_c, _default)
end