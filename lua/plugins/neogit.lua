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

        vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>",
            { silent = true, noremap = true })

        vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>",
            { silent = true, noremap = true })

        vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>",
            { silent = true, noremap = true })
    end
}
