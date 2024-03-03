-- General settings
vim.g.maplocalleader = " "
vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Deactivating swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.cursorline = true

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Better buffer splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Better editing experience
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.wrap = true
vim.opt.textwidth = 300
vim.opt.tabstop = 4
vim.opt.list = true
vim.opt.clipboard = "unnamedplus"

-- Remember 50 items in commandline history
vim.opt.history = 30

-- Highlight the region on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('nahuel-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
    end,
})

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--     pattern = "*",
--     command = [[%s/\s\+$//e]],
-- })

-- Buffer usage
vim.keymap.set("n", "<leader>bn", "<CMD>bn<CR>")
vim.keymap.set("n", "<leader>bp", "<CMD>bp<CR>")

-- Vertical split
vim.keymap.set("n", "<leader>vs", "<CMD>vs<CR>")

-- Horizonal split
vim.keymap.set("n", "<leader>vh", "<CMD>split<CR>")

-- Open terminal
vim.keymap.set("n", "<leader>t", "<CMD>term<CR>")
