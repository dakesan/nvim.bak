-- クリップボード共有 
local api = vim.api

require('config.plugins')
require('config.colorscheme')
require('config.vimsettings')
-- require('config.nvim_tree')
require('config.keysettings')


-- ctrl+s save on insertmode
api.nvim_set_keymap("i", "<c-s>", "<esc>:w<cr>i", { noremap = true })
api.nvim_set_keymap("n", "<c-s>", ":w<cr>", { noremap = true })

