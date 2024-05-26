return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",

    config = function()
        require("neogen").setup({
            snippet_engine = "luasnip",
        })

        local neogen = require("neogen").setup()

        vim.keymap.set("n", "<leader>df", function()
            neogen.generate({ type = "func" })
        end)

        vim.keymap.set("n", "<leader>dt", function()
            neogen.generate({ type = "type" })
        end)
    end,
}
