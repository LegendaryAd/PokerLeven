mod_dir = ''..SMODS.current_mod.path

SMODS.current_mod.optional_features = {
	retrigger_joker = true,
	post_trigger = true
}

pokerleven_config = SMODS.current_mod.config

--Load Sprites file
local sprite, load_error = SMODS.load_file("sprites.lua")
if load_error then
  sendDebugMessage ("The error is: "..load_error)
else
  sprite()
end

--Load aux functions
local helper, load_error = SMODS.load_file("functions/inaaux.lua")
if load_error then
  sendDebugMessage ("The error is: "..load_error)
else
  helper()
end

--Load UI file
local UI, load_error = SMODS.load_file("pokeui.lua")
if load_error then
  sendDebugMessage ("The error is: "..load_error)
else
  UI()
end

--Load consumable types
local pconsumable_types = NFS.getDirectoryItems(mod_dir.."consumable types")

for _, file in ipairs(pconsumable_types) do
  sendDebugMessage ("The file is: "..file)
  local con_type, load_error = SMODS.load_file("consumable types/"..file)
  if load_error then
    sendDebugMessage ("The error is: "..load_error)
  else
    local curr_type = con_type()
    if curr_type.init then curr_type:init() end
    
    for i, item in ipairs(curr_type.list) do
      SMODS.ConsumableType(item)
    end
  end
end

--Load joker types
local p_joker_types = NFS.getDirectoryItems(mod_dir.."misc")

for _, file in ipairs(p_joker_types) do
  sendDebugMessage ("The file is: "..file)
  local joker_type, load_error = SMODS.load_file("misc/"..file)
  if load_error then
    sendDebugMessage ("The error is: "..load_error)
  else
    local curr_type = joker_type()
    if curr_type.init then curr_type:init() end
    
    for i, item in ipairs(curr_type.list) do
      SMODS.ObjectType(item)
    end
  end
end


--Load consumables
local consumables = NFS.getDirectoryItems(mod_dir.."consumables")

for _, file in ipairs(consumables) do
  sendDebugMessage ("The file is: "..file)
  local consumable, load_error = SMODS.load_file("consumables/"..file)
  if load_error then
    sendDebugMessage ("The error is: "..load_error)
  else
    local curr_consumable = consumable()
    if curr_consumable.init then curr_consumable:init() end
    for i, item in ipairs(curr_consumable.list) do
        SMODS.Consumable(item)
    end
  end
end 

--Load stickers
local pseals = NFS.getDirectoryItems(mod_dir.."stickers")

for _, file in ipairs(pseals) do
  sendDebugMessage ("The file is: "..file)
  local sticker, load_error = SMODS.load_file("stickers/"..file)
  if load_error then
    sendDebugMessage ("The error is: "..load_error)
  else
    local curr_sticker = sticker()
    if curr_sticker.init then curr_sticker:init() end
    
    for i, item in ipairs(curr_sticker.list) do
      SMODS.Sticker(item)
    end
  end
end

--Load tags
local tags = NFS.getDirectoryItems(mod_dir.."tags")

for _, file in ipairs(tags) do
  sendDebugMessage ("The file is: "..file)
  local tag, load_error = SMODS.load_file("tags/"..file)
  if load_error then
    sendDebugMessage ("The error is: "..load_error)
  else
    local curr_tag = tag()
    if curr_tag.init then curr_tag:init() end
    
    for i, item in ipairs(curr_tag.list) do
      SMODS.Tag(item)
    end
  end
end


--Load boosters
local pboosters = NFS.getDirectoryItems(mod_dir.."boosters")

for _, file in ipairs(pboosters) do
  sendDebugMessage ("The file is: "..file)
  local booster, load_error = SMODS.load_file("boosters/"..file)
  if load_error then
    sendDebugMessage ("The error is: "..load_error)
  else
    local curr_booster = booster()
    if curr_booster.init then curr_booster:init() end
    
    for i, item in ipairs(curr_booster.list) do
      SMODS.Booster(item)
    end
  end
end

--Load blinds
local blinds = NFS.getDirectoryItems(mod_dir.."blinds")

for _, file in ipairs(blinds) do
  sendDebugMessage ("The file is: "..file)
  local blind, load_error = SMODS.load_file("blinds/"..file)
  if load_error then
    sendDebugMessage ("The error is: "..load_error)
  else
    local curr_blind = blind()
    if curr_blind.init then curr_blind:init() end
    
    for i, item in ipairs(curr_blind.list) do
      SMODS.Blind(item)
    end
  end
end



--Load jokers files
local pfiles = NFS.getDirectoryItems(mod_dir.."players")
for _, file in ipairs(pfiles) do
    sendDebugMessage ("The file is: "..file)
    local player, load_error = SMODS.load_file("players/"..file)
    if load_error then
        sendDebugMessage ("The error is: "..load_error)
    else
        local curr_player = player()
        if curr_player.init then curr_player:init() end
        for i, item in ipairs(curr_player.list) do

            item.discovered = true
            if not item.key then
                item.key = item.name
            end

            if item.ptype then
              if item.config and item.config.extra then
                item.config.extra.ptype = item.ptype
              elseif item.config then
                item.config.extra = {ptype = item.ptype}
              end
            end

            if item.pposition then
              if item.config and item.config.extra then
                item.config.extra.pposition = item.pposition
              elseif item.config then
                item.config.extra = {pposition = item.pposition}
              end
            end

            if item.pteam then
              if item.config and item.config.extra then
                item.config.extra.pteam = item.pteam
              elseif item.config then
                item.config.extra = {pteam = item.pteam}
              end
            end

            item.in_pool = function(self)
                return player_in_pool(self)
            end
            
            item.set_badges = ina_set_badges

            SMODS.Joker(item)
        end
    end
end
