vim.api.nvim_set_option('termguicolors', true)
-- utils.opt('o', 'termguicolors', true)

local not_vscode = [[not vim.g.vscode]]

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd[[colorscheme catppuccin]]