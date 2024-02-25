return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function()
        vim.keymap.set('n', '<leader>tf', function() require("telescope.builtin").find_files() end,
        { desc = "Telescope find files" })
        vim.keymap.set('n', '<leader>tg', function() require("telescope.builtin").git_files() end,
        { desc = "Telescope find git files" })
        vim.keymap.set('n', '<leader>ts', function()
            require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
        end,
        { desc = "Telescope search" })
    end
}
