return {
    "christoomey/vim-tmux-navigator",
    config = function()
        vim.keymap.set("n", "<C-j>", "<CMD>TmuxNavigateDown<CR>")
        vim.keymap.set("n", "<C-k>", "<CMD>TmuxNavigateUp<CR>")
        vim.keymap.set("n", "<C-l>", "<CMD>TmuxNavigateRight<CR>")
        vim.keymap.set("n", "<C-h>", "<CMD>TmuxNavigateLeft<CR>")
    end,
}
