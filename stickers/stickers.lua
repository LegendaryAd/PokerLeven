local wind_sticker = {
  key = "wind_sticker",
  badge_colour = HEX("289830"),
  prefix_config = { key = false },
  rate = 0.0,
  atlas = "stickers",
  pos = { x = 7, y = 0 },
  hide_badge = true
}

local fire_sticker = {
  key = "fire_sticker",
  badge_colour = HEX("289830"),
  prefix_config = { key = false },
  rate = 0.0,
  atlas = "stickers",
  pos = { x = 5, y = 0 },
  hide_badge = true
}

local mountain_sticker = {
  key = "mountain_sticker",
  object_type = "Sticker",
  no_sticker_sheet = true,
  badge_colour = HEX("289830"),
  prefix_config = { key = false },
  rate = 0.0,
  atlas = "stickers",
  pos = { x = 4, y = 0 },
  hide_badge = true
}

local forest_sticker = {
  key = "forest_sticker",
  badge_colour = HEX("289830"),
  prefix_config = { key = false },
  rate = 0.0,
  atlas = "stickers",
  pos = { x = 6, y = 0 },
  hide_badge = true
}

local fw_sticker = {
  key = "fw_sticker",
  badge_colour = HEX("289830"),
  prefix_config = { key = false },
  rate = 0.0,
  atlas = "stickers",
  pos = { x = 2, y = 0 },
  hide_badge = true
}

local mf_sticker = {
  key = "mf_sticker",
  badge_colour = HEX("289830"),
  prefix_config = { key = false },
  rate = 0.0,
  atlas = "stickers",
  pos = { x = 1, y = 0 },
  hide_badge = true
}

local df_sticker = {
  key = "df_sticker",
  badge_colour = HEX("289830"),
  prefix_config = { key = false },
  rate = 0.0,
  atlas = "stickers",
  pos = { x = 3, y = 0 },
  hide_badge = true
}

local gk_sticker = {
  key = "gk_sticker",
  badge_colour = HEX("289830"),
  prefix_config = { key = false },
  rate = 0.0,
  atlas = "stickers",
  pos = { x = 0, y = 0 },
  hide_badge = true
}

local harvest_sticker = {
  object_type = "Sticker",
  key = "harvest_sticker",
  badge_colour = HEX("289830"),
  rate = 0.0,
  atlas = "stickers",
  pos = { x = 8, y = 0 },
  hide_badge = false
}

return
{
  name = "Stickers",
  list = { wind_sticker, fire_sticker, mountain_sticker,
    forest_sticker, gk_sticker, df_sticker,
    mf_sticker, fw_sticker, harvest_sticker }
}
