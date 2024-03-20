return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    { "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "tsserver",
                    "html",
                    "cssls",
                    "gopls"
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "<space>e", vim.diagnostic.open_float,  { desc = 'Show diagnostic [E]rror messages' })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
            vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("nahuel-lsp-config", { clear = true }),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    local map = function (keys, func, desc)
                        vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
                    end
                    map("gD", vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                    map("gd", vim.lsp.buf.definition, '[G]oto [D]efinition')
                    map("gi", vim.lsp.buf.implementation, '[G]oto [I]implementation')
                    map("<C-k>", vim.lsp.buf.signature_help, 'Signature help')
                    map("<C-j>", vim.lsp.buf.hover, 'Hover documentation')
                    map("<leader>wa", vim.lsp.buf.add_workspace_folder, '[A]dd [W]orkspace folder')
                    map("<leader>wr", vim.lsp.buf.remove_workspace_folder, '[R]emove [W]orkspace folder')
                    map("<leader>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
                    end, '[L]ist [W]orkspace folders')
                    map("<leader>D", vim.lsp.buf.type_definition, 'Type [D]efinition')
                    map("<leader>rn", vim.lsp.buf.rename, '[R]e[n]ame buffer')
                    map("gr", vim.lsp.buf.references, '[G]oto [R]eferences')
                    local opts = { buffer = ev.buf }
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts, { desc = '[C]ode [A]ction' })
                end,
            })
        end,
    },
}
