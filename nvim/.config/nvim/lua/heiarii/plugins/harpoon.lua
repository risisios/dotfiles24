return {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function()
        vim.keymap.set("n", "<leader>ha", function() require("harpoon.mark").add_file() end,
            { desc = "Marks a Harpoon file" })
        vim.keymap.set("n", "<leader>hs", function() require("harpoon.ui").toggle_quick_menu() end,
            { desc = "Toggle Harpoon quick menu" })
        vim.keymap.set("n", "<leader>hh", function() require("harpoon.ui").nav_file(1) end,
            { desc = "Go to Harpoon file #1" })
        vim.keymap.set("n", "<leader>hj", function() require("harpoon.ui").nav_file(2) end,
            { desc = "Go to Harpoon file #2" })
        vim.keymap.set("n", "<leader>hk", function() require("harpoon.ui").nav_file(3) end,
            { desc = "Go to Harpoon file #3" })
    end
}
