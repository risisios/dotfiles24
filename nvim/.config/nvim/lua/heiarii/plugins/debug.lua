return {
    {
        "mfussenegger/nvim-dap",
        init = function()
            -- Creating some mappings (recommended ones)
            local dap = require("dap")
            vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = "Launch or continue debugging" })
            vim.keymap.set('n', '<F6>', function() dap.step_over() end, { desc = "Next debugging step" })
            vim.keymap.set('n', '<F7>', function() dap.step_into() end, { desc = "Step into scope" })
            vim.keymap.set('n', '<F8>', function() dap.step_out() end, { desc = "Step out of scope" })
            vim.keymap.set('n', '<F12>', function() dap.terminate() end, { desc = "Terminate debugging session" })
            vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint" })
            -- vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
            vim.keymap.set('n', '<Leader>B',
                function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
                { desc = "Set logpoint" })
            vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end, { desc = "Open REPL window" })
        end,
        config = function()
            local dap = require("dap")

            -- Initializing the GDB adapter
            -- Need to install GDB 14.0+ (from source)
            -- which needs up to date GMP and MPFR
            -- installed with `apt install libgmp-dev libmpfr-dev`
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "-i", "dap" }
            }

            -- Configuring the C debugging
            dap.configurations.c = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = vim.fn.getcwd(),
                }
            }
        end
    },
    {
        "nvim-telescope/telescope-dap.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "mfussenegger/nvim-dap",
            "nvim-treesitter/nvim-treesitter"
        },
        config = function()
            require("telescope").load_extension("dap")
        end
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-treesitter/nvim-treesitter"
        },
        opts = {
            all_references = true
        }
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap"
        },
        main = "dapui",
        init = function()
            local dapui = require("dapui")
            vim.keymap.set('n', '<leader>lb', function() dapui.float_element("breakpoints") end,
            { desc = "List breakpoints in a floating window" })
        end
    }
}
