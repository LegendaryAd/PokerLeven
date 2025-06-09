mod_dir = ''..SMODS.current_mod.path

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
                item.config.pposition = {ptype = item.pposition}
              end
            end

            SMODS.Joker(item)
        end
    end
end
