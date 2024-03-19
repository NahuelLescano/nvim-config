return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration
    },
    config = function ()
        require("neogit").setup()
        local neogit = require("neogit")
        vim.keymap.set("n", "<leader>gs", function()
            neogit.open({ kind = "split" })
        end)
    end

}
