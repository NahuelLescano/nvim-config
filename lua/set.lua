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

vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.cursorline = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Better buffer splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.wrap = true
vim.opt.textwidth = 300
vim.opt.list = true
vim.opt.clipboard = "unnamedplus"

-- Remember 50 items in commandline history
vim.opt.history = 30

-- Highlight the region on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("nahuel-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
  end,
})

vim.g.have_nerd_font = true

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Open a terminal inside neovim",
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
end)

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>")
