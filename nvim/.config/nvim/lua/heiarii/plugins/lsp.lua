return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "folke/neodev.nvim",
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig"
    },
    init = function()
        vim.api.nvim_create_autocmd("LspAttach",
            {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    -- Workspace
                    vim.keymap.set("n", "<leader>lw", function()
                            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                        end,
                        {
                            buffer = ev.buf,
                            desc = "List workspace directories"
                        })
                    vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol,
                        {
                            buffer = ev.buf,
                            desc = "Search workspace symbol"
                        })
                    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder,
                        {
                            buffer = ev.buf,
                            desc = "Add workspace directory"
                        })
                    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder,
                        {
                            buffer = ev.buf,
                            desc = "Remove workspace directory"
                        })

                    -- Gotos
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
                        {
                            buffer = ev.buf,
                            desc = "Go to declaration"
                        })
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition,
                        {
                            buffer = ev.buf,
                            desc = "Go to definition"
                        })
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation,
                        {
                            buffer = ev.buf,
                            desc = "Go to implementation"
                        })
                    vim.keymap.set("n", "gr", vim.lsp.buf.references,
                        {
                            buffer = ev.buf,
                            desc = "Go to references"
                        })

                    -- Docs
                    vim.keymap.set("n", "K", vim.lsp.buf.hover,
                        {
                            buffer = ev.buf,
                            desc = "Hover symbol"
                        })
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help,
                        {
                            buffer = ev.buf,
                            desc = "Get signature help"
                        })
                    vim.keymap.set("n", "<leader><space>D", vim.lsp.buf.type_definition,
                        {
                            buffer = ev.buf,
                            desc = "Get type definition"
                        })

                    -- Refactors
                    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename,
                        {
                            buffer = ev.buf,
                            desc = "Rename symbol"
                        })
                    vim.keymap.set({ "n", "v" }, "<F4>", vim.lsp.buf.code_action,
                        {
                            buffer = ev.buf,
                            desc = "Trigger code action"
                        })
                    vim.keymap.set("n", "<F3>", function()
                            vim.lsp.buf.format { async = true }
                        end,
                        {
                            buffer = ev.buf,
                            desc = "Format buffer"
                        })

                    -- Diagnostic
                    vim.keymap.set("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>",
                        {
                            buffer = ev.buf,
                            desc = "View current diagnostic"
                        })
                    vim.keymap.set("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<cr>",
                        {
                            buffer = ev.buf,
                            desc = "Go to next diagnostic"
                        })
                    vim.keymap.set("n", "<leader>dN", "<cmd>lua vim.diagnostic.goto_prev()<cr>",
                        {
                            buffer = ev.buf,
                            desc = "Go to previous diagnostic"
                        })
                end
            })
    end,
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "bashls",
                "clangd",
                "cmake",
                "pylsp",    -- requires PyPI installation: `pyton-lsp-server[all]`, `jedi_language_server`
                "marksman", -- requires binary installation: `sudo snap install marksman`
                "texlab",   -- requires texlive
                "yamlls",   -- requires npm: `nodejs`, `npm`
                "lua_ls",
                "vimls"     -- requires npm: `nodejs`, `npm`
            },
            handlers = {
                -- Default handler
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        -- Set up completion capabilities
                        capabilities = require("cmp_nvim_lsp").default_capabilities()
                    })
                end,
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        -- Set up completion capabilities
                        capabilities = require("cmp_nvim_lsp").default_capabilities(),
                        -- Removing the `undefined globals ``vim``` warning
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    })
                end
            }
        })
    end
}
