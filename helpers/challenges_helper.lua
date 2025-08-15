local filtered = {}
for _, ch in ipairs(G.CHALLENGES) do
    if ch.original_mod and ch.original_mod.id == "Pokerleven" then
        table.insert(filtered, ch)
    end
end

G.CHALLENGES = filtered
