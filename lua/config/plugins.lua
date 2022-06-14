local nocode = function()
    return vim.fn.exists('g:vscode') == 0
end

local utils = require('utils')

require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- 基本プラグイン
    use {"tpope/vim-surround"}
    -- use {
    --     'numToStr/Comment.nvim',
    --     config = function()
    --         require('Comment').setup()
    --     end
    -- }
    use {"tpope/vim-commentary"}
    use {"tpope/vim-repeat"}
    use {"jiangmiao/auto-pairs"}
    use {"sheerun/vim-polyglot"}
    use {'psliwka/vim-smoothie'}
    use {'unblevable/quick-scope'}
    use {'rhysd/clever-f.vim'}
    use {"haya14busa/vim-edgemotion"}
    use {"yutkat/wb-only-current-line.vim"}
    use {"kana/vim-niceblock"}
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons' -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
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

    -- nvim tree
    -- use {
    --     'kyazdani42/nvim-tree.lua',
    --     requires = {
    --         'kyazdani42/nvim-web-devicons', -- optional, for file icon
    --     }
    -- }
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

    -- 連番
    --     " Sequencial numbering use default settings(ref. global variables).
    -- :'<,'>RengBang
    -- " Specify pattern like this. This sample is for array index.
    -- :'<,'>RengBang \[\zs\(\d\+\)\ze\]
    -- " Start sequencial numbering from 3.
    -- :'<,'>RengBang \(\d\+\)  3
    -- " Start from 3 and 2 step.
    -- :'<,'>RengBang \(\d\+\)  0  2
    -- " Start position use first detected number.
    -- :'<,'>RengBang \(\d\+\)  0  1  1
    -- " Use format %03d for replacing to sequencial number like '001.'.
    -- :'<,'>RengBang \(\d\+\)  0  1  0  %03d.
    use {"deris/vim-rengbang"}

    -- Lazy loading:
    -- Load on specific commands
    use {
        'tpope/vim-dispatch',
        opt = true,
        cmd = {'Dispatch', 'Make', 'Focus', 'Start'}
    }

    -- match up
    -- %keyで括弧の最後にジャンプする
    use {
        'andymass/vim-matchup',
        event = 'VimEnter'
    }

    -- Plugins can have post-install/update hooks
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        cmd = 'MarkdownPreview'
    }

    -- Post-install/update hook with neovim command
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- move
    use 'fedepujol/move.nvim'

    -- Use specific branch, dependency and run lua file after load
    -- use {
    --     'glepnir/galaxyline.nvim',
    --     branch = 'main',
    --     config = function()
    --         require 'statusline'
    --     end,
    --     requires = {'kyazdani42/nvim-web-devicons'}
    -- }

    -- themes
    -- cond = { nocode },
    -- use { 'dracula/vim', as = 'dracula' }
    use ({
        'catppuccin/nvim',
        as = 'catppucin'
    })
end)
