return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local trouble = require("trouble")
        vim.keymap.set("n", "<leader>tt", function()
            trouble.toggle()
        end)
        vim.keymap.set("n", "<leader>td", function()
            trouble.toggle("workspace_diagnostics")
        end)
        vim.keymap.set("n", "<leader>tq", function()
            trouble.toggle("quickfix")
        end)
        vim.keymap.set("n", "<leader>tn", function()
            trouble.next({ skip_groups = true, jump = true })
        end)
        vim.keymap.set("n", "<leader>tp", function()
            trouble.previous({ skip_groups = true, jump = true })
        end)
        vim.keymap.set("n", "<leader>tp", function()
            trouble.last({ skip_groups = true, jump = true })
        end)
        vim.keymap.set("n", "<leader>tc", function()
            trouble.close()
        end)
    end,
}
