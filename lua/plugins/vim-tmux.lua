return {
	"christoomey/vim-tmux-navigator",
    config = function ()
        vim.keymap.set('n', '<C-J>', ':TmuxNavigateDown<CR>')
        vim.keymap.set('n', '<C-K>', ':TmuxNavigateUp<CR>')
        vim.keymap.set('n', '<C-L>', ':TmuxNavigateLeft<CR>')
        vim.keymap.set('n', '<C-H>', ':TmuxNavigateRight<CR>')
    end
}
