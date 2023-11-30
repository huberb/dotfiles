require('plugins')
require('lsp')

require("gruvbox").setup({
    palette_overrides = {
        dark0 = "#101010",
    },
})

require("nvim-tree").setup()
require("nvim-web-devicons").setup()

vim.opt.termguicolors = true
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

vim.g.mapleader = ","
vim.o.expandtab = true
vim.g.nohlsearch = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.clipboard = 'unnamed,unnamedplus'

vim.g.vimspector_enable_mappings = 'HUMAN'

vim.cmd("set nohlsearch")

vim.g.vimspector_base_dir = "/Users/ben/.config/nvim/vimspector-config"
