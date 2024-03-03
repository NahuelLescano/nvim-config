return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            }
        },
        config = function()
            pcall(require('telescope').load_extension, 'fzf')
            pcall(require('telescope').load_extension, 'ui-select')

            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = '[S]earch [F]iles' })
            vim.keymap.set("n", "<leader>fg", function ()
                builtin.live_grep {
                    grep_open_files = true,
                    prompt_title = 'Live Grep in Open Files',
                }
            end, { desc = '[S]earch by [G]rep' })

            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = '[ ] Find existing buffers' })
            vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>/', function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = '[/] Fuzzily search in current buffer' })

            vim.keymap.set('n', '<leader>sn', function()
                builtin.find_files { cwd = vim.fn.stdpath 'config' }
            end, { desc = '[S]earch [N]eovim files' })
        end,
    },
}
