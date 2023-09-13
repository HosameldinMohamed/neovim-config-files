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
    { 'nvimdev/lspsaga.nvim', commit = '4cad6da6e05b7651ca8f66ec1fb3a824395ada68' },
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

    -- Harpoon
    'ThePrimeagen/harpoon',

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
    { 'lukas-reineke/indent-blankline.nvim' },

    -- octo (GitHub plugin)
    {
        'pwntester/octo.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        config = function ()
            require('octo').setup()
        end
    },

    -- Better folding
    { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },

    -- Noice
    'rcarriga/nvim-notify',
    'MunifTanjim/nui.nvim',
    'folke/noice.nvim',

    -- hardtime nvim
    {
       "m4xshen/hardtime.nvim",
       dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
       opts = { enabled = false, }
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
})
