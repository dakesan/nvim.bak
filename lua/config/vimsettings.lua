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

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- quick-scopeをvscodeに反映させる
vim.cmd[[highlight quickscopeprimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline]]
vim.cmd[[highlight quickscopesecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline]]
vim.cmd[[ let g:qs_highlight_on_keys = ['f', 'f', 't', 't'] ]]

-- clipboard
-- vim.cmd[[
-- set clipboard+=unnamedplus
-- let g:clipboard = {
--   \   'name': 'win32yank-wsl',
--   \   'copy': {
--   \      '+': 'win32yank.exe -i --crlf',
--   \      '*': 'win32yank.exe -i --crlf',
--   \    },
--   \   'paste': {
--   \      '+': 'win32yank.exe -o --lf',
--   \      '*': 'win32yank.exe -o --lf',
--   \   },
--   \   'cache_enabled': 0,
--   \ }
-- ]]
-- vim.cmd[[
--     set clipboard&
--     set clipboard^=unnamedplus
-- ]]

-- vim.cmd [[
--     let s:clip = '/mnt/c/Windows/System32/clip.exe'
-- if executable(s:clip)
--     augroup WSLYank
--         autocmd!
--         autocmd TextYankPost * call system*'echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
--     augroup END
-- end

-- map <silent> "=p :r !powershell.exe -Command Get-Clipboard<CR>
-- map! <silent> <C-r>= :r !powershell.exe -Command Get-Clipboard<CR>
-- noremap "+p :exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')<CR>
-- ]]
