local fn = vim.fn
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
-- Install your plugins here
return require("lazy").setup({
  -- My plugins here
  "gruvbox-community/gruvbox",
  -- "lunarvim/darkplus.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-sleuth",
  "tpope/vim-projectionist",
  "tpope/vim-vinegar",
  "tpope/vim-surround",
  -- "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim,
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  {
    "numToStr/Comment.nvim", -- Easily comment stuff
    config = function()
      require("Comment").setup()
    end
  },
  -- "kyazdani42/nvim-web-devicons",
  -- "kyazdani42/nvim-tree.lua",
  -- "akinsho/bufferline.nvim",
  -- "moll/vim-bbye",
  -- "nvim-lualine/lualine.nvim",
  "vim-airline/vim-airline",
  -- "akinsho/toggleterm.nvim",
  -- "ahmedkhalf/project.nvim",
  -- "lewis6991/impatient.nvim",
  -- "lukas-reineke/indent-blankline.nvim",
  -- "goolord/alpha-nvim",
  -- "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight,
  -- "folke/which-key.nvim",

  -- cmp plugins
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions,
  "hrsh7th/cmp-path", -- path completions,
  "hrsh7th/cmp-cmdline", -- cmdline completions,
  "saadparwaiz1/cmp_luasnip", -- snippet completions,
  "hrsh7th/cmp-nvim-lsp",

  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine,
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use,

  -- -- LSP
  "neovim/nvim-lspconfig", -- enable LSP,
  {
    "williamboman/mason.nvim",
    name = "mason",
    -- cmd = "Mason",
    config = {
      ui = {
        border = "none",
        icons = {
          package_installed = "◍",
          package_pending = "◍",
          package_uninstalled = "◍",
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    }
  }, -- simple to use language server installer,
  {
    "williamboman/mason-lspconfig.nvim", -- simple to use language server installer,
    name = "mason-lspconfig",
    cmd = {
      "Mason",
      "LspInstall",
      "LspUninstall"
    },
    config = {
      ensure_installed = {
        "sumneko_lua",
        -- "cssls",
        -- "html",
        -- "tsserver",
        "pyright",
        -- "bashls",
        "jsonls",
        -- "yamlls",
      },
      automatic_installation = true,
    }
  },
  "j-hui/fidget.nvim",
  "folke/neodev.nvim",
  -- "tamago324/nlsp-settings.nvim" -- language server settings defined in json for,
  -- "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters,

  -- Telescope
  { 
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable 'make' == 1
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },
  -- -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },

  -- -- Git
  -- "lewis6991/gitsigns.nvim",
  {
    "preservim/tagbar"
  },
  --
  -- https://git.sr.ht/~whynothugo/lsp_lines.nvim

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to the default settings,
        -- refer to the configuration section below
      }
    end
  }
})
