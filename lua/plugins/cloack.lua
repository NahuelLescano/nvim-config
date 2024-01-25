return {
    "laytan/cloak.nvim",
    config = function()
        vim.keymap.set("n", "<leader>ct", ":CloackToggle<CR>")
        vim.keymap.set("n", "<leader>ct", ":CloackDisable<CR>")
    end,
}
