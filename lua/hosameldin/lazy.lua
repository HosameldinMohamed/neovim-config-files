vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

    -- lua functions that many plugins use
    'nvim-lua/plenary.nvim',

    'bluz71/vim-nightfly-guicolors', -- preferred colorscheme
    { 'bluz71/vim-moonfly-colors'},
    'folke/tokyonight.nvim',
    'ellisonleao/gruvbox.nvim',
    'rebelot/kanagawa.nvim',
    { 'catppuccin/nvim'},

    'christoomey/vim-tmux-navigator', -- tmux & split window navigation

    'szw/vim-maximizer', -- maximizes and restores current window

    -- essential plugins
    'tpope/vim-surround',
    'vim-scripts/ReplaceWithRegister',

    -- commenting with gc
    'numToStr/Comment.nvim',

    -- file explorer
    'nvim-tree/nvim-tree.lua',

    -- icons
    'nvim-tree/nvim-web-devicons',

    -- statusline
    'nvim-lualine/lualine.nvim',

    -- fuzzy finding w/ telescope
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- dependency for better sorting performance
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }, -- fuzzy finder

    -- autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-omni',

    -- snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'SirVer/ultisnips',
    'quangnguyen30192/cmp-nvim-ultisnips',

    -- managing & installing lsp servers, linters & formatters
    'williamboman/mason.nvim', -- in charge of managing lsp servers, linters & formatters
    'williamboman/mason-lspconfig.nvim', -- bridges gap b/w mason & lspconfig

    -- configuring lsp servers
    'neovim/nvim-lspconfig', -- easily configure language servers
    'hrsh7th/cmp-nvim-lsp', -- for autocompletion
    { 'nvimdev/lspsaga.nvim'},
    'ray-x/lsp_signature.nvim', -- for functions signatures

    'jose-elias-alvarez/typescript.nvim', -- additional functionality for typescript server (e.g. rename file & update imports)
    'onsails/lspkind.nvim', -- vs-code like icons for autocompletion
    'RRethy/vim-illuminate', -- automatically highlighting

    -- formatting & linting
    'jose-elias-alvarez/null-ls.nvim', -- configure formatters & linters
    'jayp0521/mason-null-ls.nvim', -- bridges gap b/w mason & null-ls

    -- treesitter configuration
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    },

    -- Rainbow parentheses
    'p00f/nvim-ts-rainbow',

    -- auto closing
    'windwp/nvim-autopairs', -- autoclose parens, brackets, quotes, etc...
    'windwp/nvim-ts-autotag', -- autoclose tags

    -- git integration
    'lewis6991/gitsigns.nvim', -- show line modifications on left hand side

    'kdheepak/lazygit.nvim',

    -- nvim-navic
    {
        'SmiteshP/nvim-navic',
        dependencies = 'neovim/nvim-lspconfig'
    },

    -- for Markdown preview
    -- install without yarn or npm
    {
        'iamcco/markdown-preview.nvim',
        build = function() vim.fn['mkdp#util#install']() end,
    },

    -- Markdown TOC generation
    'mzlogin/vim-markdown-toc',

    -- Latex support
    'lervag/vimtex',

    -- Grapple
    {
        "cbochs/grapple.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons", lazy = true }
        },
    },

    -- Auto-save
    'Pocco81/auto-save.nvim',

    -- Git blame
    'APZelos/blamer.nvim',

    -- Scrollbar
    'petertriho/nvim-scrollbar',

    -- Nvim-hlslens
    'kevinhwang91/nvim-hlslens',

    -- DiffView
    { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },

    -- indent-blankline
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- octo (GitHub plugin)
    -- {
    --     'pwntester/octo.nvim',
    --     dependencies = {
    --         'nvim-lua/plenary.nvim',
    --         'nvim-telescope/telescope.nvim',
    --         'nvim-tree/nvim-web-devicons',
    --     },
    --     config = function ()
    --         require('octo').setup()
    --     end
    -- },

    -- Better folding
    { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },

    -- Noice
    { 'rcarriga/nvim-notify',
    config = function ()
        require("notify").setup {
            stages = 'fade_in_slide_out',
            -- background_colour = 'FloatShadow',
            timeout = 2000,
            top_down = false,
        }
        vim.notify = require('notify')
    end
    },

    'MunifTanjim/nui.nvim',
    'folke/noice.nvim',

    -- hardtime nvim
    {
       "m4xshen/hardtime.nvim",
       dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
       opts = { enabled = false, }
    },

    -- codewindow
    {
        'gorbit99/codewindow.nvim',
        init = function()
            require('codewindow').apply_default_keybinds()
        end,
        opts = {
            -- here you can paste configuration block
        },
    },

    -- Firenvim
    {
        'glacambre/firenvim',

        -- Lazy load firenvim
        -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
        lazy = not vim.g.started_by_firenvim,
        build = function()
            vim.fn["firenvim#install"](0)
        end
    },

    -- Screen Saver
    {
        "folke/drop.nvim",
        event = "VimEnter",
        config = function()
            require("drop").setup({
                theme = "leaves", -- it be set to leaves, snow, stars, xmas, spring or summer
                -- screensaver = 1000 * 60 * 5,
                screensaver = false,
            })
        end,
    },

    -- Debugoutsource much of the logic that before had to be implemented in every
    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require('dap')
            dap.adapters.lldb = {
                type = 'executable',
                command = '/usr/bin/lldb-dap',
                name = 'lldb'
            }

            dap.configurations.cpp = {
                {
                    name = 'Launch',
                    type = 'lldb',
                    request = 'launch',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {},
                },
            }

            -- Optional configurations for other languages using the same debugger
            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp
            vim.fn.sign_define('DapBreakpoint', { text='🔴', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
            vim.fn.sign_define('DapBreakpointCondition', { text='⭕', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
            vim.fn.sign_define('DapBreakpointRejected', { text='☢️', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
            vim.fn.sign_define('DapLogPoint', { text='ℹ️', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
            vim.fn.sign_define('DapStopped', { text='▶️', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })
        end
    },

    {
        "nvim-neotest/nvim-nio"
    },

    {
        'rcarriga/nvim-dap-ui',
        requires = {'mfussenegger/nvim-dap'},
        config = function()
            local dapui = require('dapui')
            dapui.setup()

            local dap = require('dap')
            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated['dapui_config'] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited['dapui_config'] = function()
                dapui.close()
            end
        end
    },

    {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            local dapvirtext = require("nvim-dap-virtual-text")
            dapvirtext.setup()
        end
    },
})
