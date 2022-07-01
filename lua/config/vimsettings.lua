-- local utils = require('utils')

local cmd = vim.cmd
local indent = 4
vim.api.nvim_set_option('syntax', 'enable')
vim.api.nvim_set_option('filetype', 'on')
vim.bo.expandtab = true
vim.bo.shiftwidth = indent
vim.bo.smartindent = true
vim.bo.tabstop = indent
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.scrolloff = 4
vim.o.shiftround = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wildmode = 'list:longest'
vim.wo.number = true
vim.wo.relativenumber = true

vim.o.mouse = "a"

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- quick-scopeをvscodeに反映させる
-- vim.cmd[[highlight quickscopeprimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline]]
-- vim.cmd[[highlight quickscopesecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline]]
-- vim.cmd[[ let g:qs_highlight_on_keys = ['f', 'f', 't', 't'] ]]


vim.cmd[[
    set clipboard&
    set clipboard^=unnamedplus
]]


