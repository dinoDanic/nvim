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
  'neovim/nvim-lspconfig',
  -- cmp
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  'rafamadriz/friendly-snippets',
  "jose-elias-alvarez/null-ls.nvim",

  -- quick fix actions
  -- "kevinhwang91/nvim-bqf",

  -- lua line
  -- 'nvim-lualine/lualine.nvim',
  -- ui
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
  -- { "catppuccin/nvim", as = "catppuccin" },

}

local opts = {}

require("lazy").setup(plugins, opts)
