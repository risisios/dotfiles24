return {
    "lervag/vimtex",
    init = function()
        -- Enabling filetype for VimTeX
        vim.cmd("filetype plugin indent on")

        -- Enabling the syntax
        vim.cmd("syntax enable")

        -- Enabling the viewer
        vim.g.vimtex_view_method = "zathura"

        -- Customizing the local map leader
        vim.g.maplocalleader = ","
        -- Suppress some warnings
        vim.g.vimtex_quickfix_ignore_filters = { "Underfull", "Overfull" }
    end,
    lazy = false
}
