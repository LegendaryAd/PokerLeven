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
    },
    calculate = function(self, card, context)
        if context.setting_blind then
            apply_team_discount_to_blind(self.config.extra.percent)
        end
    end
})

local ex_law_2 = V({
    key = "ex_law_2",
    atlas = "vouchers01",
    order = 33,
    set = "Voucher",
    pos = { x = 0, y = 1 },
    config = { extra = { percent = 5 } },
    discovered = true,
    unlocked = true,
    available = true,
    requires = { "v_ina_ex_law_2" },
    cost = 10,
    loc_vars = function(self, info_queue)
        return { vars = { self.config.extra.percent } }
    end,
    ina_credits = {
        art = { 'Shadorossa' },
        idea = { 'Shadorossa' }
    },
    calculate = function(self, card, context)
        if context.setting_blind then
            apply_team_discount_to_blind(self.config.extra.percent)
        end
    end
})

return {
    name = "Vouchers01",
    list = { ex_law, ex_law_2 }
}
