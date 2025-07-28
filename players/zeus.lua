-- Poseidon
local Poseidon = {
  name = "Poseidon",
  pos = { x = 10, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {}
  end,
  rarity = 3, -- Rare
  pools = { ["Zeus"] = true },
  cost = 8,
  atlas = "Jokers01",
  ptype = "Mountain",
  pposition = "GK", -- Goalkeeper
  pteam = "Zeus",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Hephestus
local Hephestus = {
  name = "Hephestus",
  pos = { x = 12, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Zeus"] = true },
  cost = 6,
  atlas = "Jokers01",
  ptype = "Fire",
  pposition = "DF", -- Defense
  pteam = "Zeus",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Apollo
local Apollo = {
  name = "Apollo",
  pos = { x = 11, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Zeus"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = "Forest",
  pposition = "DF", -- Defense
  pteam = "Zeus",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Artemis
local Artemis = {
  name = "Artemis",
  pos = { x = 0, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Zeus"] = true },
  cost = 6,
  atlas = "Jokers01",
  ptype = "Wind",
  pposition = "MF", -- Midfielder
  pteam = "Zeus",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Hermes
local Hermes = {
  name = "Hermes",
  pos = { x = 9, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Zeus"] = true },
  cost = 6,
  atlas = "Jokers01",
  ptype = "Forest",
  pposition = "MF", -- Midfielder
  pteam = "Zeus",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Demeter
local Demeter = {
  name = "Demeter",
  pos = { x = 8, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Zeus"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = "Fire",
  pposition = "FW", -- Forward
  pteam = "Zeus",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Aphrodite
local Aphrodite = {
  name = "Aphrodite",
  pos = { x = 1, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {}
  end,
  rarity = 4, -- Legendary
  pools = { ["Zeus"] = true },
  cost = 12,
  atlas = "Jokers01",
  ptype = "Forest",
  pposition = "MF", -- Midfielder
  pteam = "Zeus",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

return {
  name = "Zeus",
  list = { Poseidon, Hephestus, Apollo, Artemis, Hermes, Demeter, Aphrodite },
}
