local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
                                      install_path})
end

local nocode = function()
    return vim.fn.exists('g:vscode') == 0
end
local utils = require('utils')

require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    local vscode = "vim.fn.exists('g:vscode') ~= 0"
    local term = "vim.fn.exists('g:vscode') == 0"

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false
                },
                indent = {
                    enable = true
                },
                matchup = {
                    enable = true
                }
            }
        end
    }
    use {"machakann/vim-sandwich"}
    use {
        'unblevable/quick-scope',
        setup = [[require('config.quickscope')]],
        keys = {'f', 'F', 't', 'T'}
    }
    -- use {"tpope/vim-commentary"}
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end,
        cond = term
    }
    -- use {'rhysd/clever-f.vim'}
    -- use {"haya14busa/vim-edgemotion"}
    -- use {"yutkat/wb-only-current-line.vim"}
    use {"kana/vim-niceblock"}
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        tag = 'nightly',
        config = [[require('config.nvim_tree')]],
        cond = term
    }
    use {
        'phaazon/hop.nvim',
        branch = 'v1', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup {
                keys = 'etovxqpdygfblzhckisuran'
            }
        end
    }
    -- vim-expand-region
    -- +で拡大, _で縮小
    use {"terryma/vim-expand-region"}

    -- substitute.nvim
    -- yiw->gs"などで　ヤンク->置換
    use({
        "gbprod/substitute.nvim",
        config = function()
            require("substitute").setup({
                on_substitute = nil,
                yank_substitued_text = false,
                range = {
                    prefix = "s",
                    prompt_current_text = false,
                    confirm = false,
                    complete_word = false,
                    motion1 = false,
                    motion2 = false
                },
                exchange = {
                    motion = false
                }
            })
        end
    })

    -- Lazy loading:
    -- Load on specific commands
    use {
        'tpope/vim-dispatch',
        opt = true,
        cmd = {'Dispatch', 'Make', 'Focus', 'Start'}
    }

    -- match up
    -- %keyで括弧の最後にジャンプする
    -- use {
    --     'andymass/vim-matchup',
    --     event = 'VimEnter',
    -- }

    -- Plugins can have post-install/update hooks
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        cmd = 'MarkdownPreview',
        setup = function()
            vim.g.mkdp_filetypes = {"markdown"}
        end,
        ft = {"markdown"},
        cond = term
    }


    -- move
    use {
        'fedepujol/move.nvim',
        cond = term
    }

    use {
        'catppuccin/nvim',
        as = 'catppucin',
    }

	use {
		'David-Kunz/treesitter-unit'
	} 

	use {
		'mfussenegger/nvim-treehopper',
		after = 'nvim-treesitter',
		config = function()
			vim.cmd([[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]])
vim.cmd([[vnoremap <silent> m :lua require('tsht').nodes()<CR>]])
require('tsht').config.hint_keys = { 'j', 'k', 'l', 'f', 'd', 's', 'h', 'g', 'm' }
		end
	}

	use { 'mizlan/iswap.nvim' }

  --   use {
	 --    'bkad/CamelCaseMotion',
	 --    setup = function()
		--     vim.cmd[[let g:camelcasemotion_key = '<leader>']]
		-- end,
  --   }
    

    -- -- lsp
    -- use {
    --     "neovim/nvim-lspconfig",
    --     cond = term
    -- }
    --
    -- use {
    --     'hrsh7th/cmp-nvim-lsp',
    --     cond = term
    -- }
    -- use {
    --     'hrsh7th/cmp-buffer',
    --     cond = term
    -- }
    -- use {
    --     'hrsh7th/cmp-path',
    --     cond = term
    -- }
    -- use {
    --     'hrsh7th/cmp-cmdline',
    --     cond = term
    -- }
    -- use {
    --     'hrsh7th/nvim-cmp',
    --     cond = term
    -- }
    --
    -- use {
    --     'L3MON4D3/LuaSnip',
    --     cond = term
    -- }
    -- use {
    --     'saadparwaiz1/cmp_luasnip',
    --     cond = term
    -- }

end)

require('Comment').setup()
require('config.quickscope')
