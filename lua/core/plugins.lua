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

local plugins = {

  -- new lsp
  -- LSP Support
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = false,
    config = false,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    }
  },
  -- Autocompletion and Snippets
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'L3MON4D3/LuaSnip' }
    },
  },
  { 'saadparwaiz1/cmp_luasnip' },
  { "rafamadriz/friendly-snippets" },
  -- null ls none ls
  "nvimtools/none-ls.nvim",

  -- TREE
  -- 'nvim-tree/nvim-tree.lua',
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },

  'nvim-tree/nvim-web-devicons',
  'nvim-treesitter/nvim-treesitter',
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  --flutter
  {
    'akinsho/flutter-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    config = function()
      require("flutter-tools").setup {} -- use defaults
    end,
  },

  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies =
    'nvim-tree/nvim-web-devicons'
  },
  --utils
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  "windwp/nvim-ts-autotag",
  "moll/vim-bbye",
  -- {
  --   "ggandor/leap.nvim",
  --   config = function() require('leap').add_default_mappings() end
  -- },

  -- comments
  'JoosepAlviste/nvim-ts-context-commentstring',
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end
  },

  --github
  "tpope/vim-fugitive",
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },

  -- colors
  'shaunsingh/nord.nvim',
  { "catppuccin/nvim",  as = "catppuccin" },
  { 'rose-pine/neovim', name = 'rose-pine' },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },


}

local opts = {}

require("lazy").setup(plugins, opts)
