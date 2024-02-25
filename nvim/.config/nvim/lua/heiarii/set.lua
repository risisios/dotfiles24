vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.textwidth = 80

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 10

-- setup "xclip" for "neovim"

vim.g.clipboard = {
    name = 'XClip',
    copy = {
        ["*"] = { 'xclip', '-selection', 'primary' },
        ["+"] = { 'xclip', '-selection', 'clipboard' },
    },
    paste = {
        ["*"] = { 'xclip', '-out', 'primary' },
        ["+"] = { 'xclip', '-out', 'clipboard' },
    },
    cache_enabled = true,
}

