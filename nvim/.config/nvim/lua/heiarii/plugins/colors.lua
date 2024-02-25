return {
    -- The prefered scheme must have an init
    {
        "projekt0n/github-nvim-theme",
        lazy = false,
        priority = 1000,
        config = function()
            require("github-theme").setup({
                options = {
                    transparent = true,
                }
            })
            -- vim.cmd([[
            --     augroup user_colors
            --         autocmd!
            --         autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
            --     augroup END
            -- ]])
            vim.cmd("colorscheme github_dark")
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = { transparent = true }
    }
}
