return {
    {
        "tpope/vim-fugitive",
        init = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open Fugitive window" })
        end
    },
    {
        "rbong/vim-flog",
        lazy = true,
        cmd = { "Flog", "Flogsplit", "Floggit" },
        dependencies = {
            "tpope/vim-fugitive"
        },
        init = function()
            vim.keymap.set("n", "<leader>gl", vim.cmd.Flog, { desc = "Open Flog graph window" })
        end
    }
}
