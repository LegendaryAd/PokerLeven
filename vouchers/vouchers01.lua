local ex_law = V({
    key = "ex_law",
    atlas = "vouchers01",
    order = 33,
    set = "Voucher",
    pos = { x = 0, y = 0 },
    config = { extra = { percent = 5 } },
    discovered = true,
    unlocked = true,
    available = true,
    cost = 10,
    loc_vars = function(self, info_queue)
        return { vars = { self.config.extra.percent } }
    end,
    ina_credits = {
        art = { 'Shadorossa' },
        idea = { 'Shadorossa' }
    }
})

return {
    name = "Vouchers01",
    list = { ex_law }
}
