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
  "ctrlpvim/ctrlp.vim",
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

  -- cmp plugins
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions,
  "hrsh7th/cmp-path", -- path completions,
  "hrsh7th/cmp-cmdline", -- cmdline completions,
  "saadparwaiz1/cmp_luasnip", -- snippet completions,

  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine,
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use,

  -- LSP
  {
    "neovim/nvim-lspconfig", -- enable LSP,
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    }
  },
  "j-hui/fidget.nvim",
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
    main = "nvim-treesitter.configs",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    opts = {
      ensure_installed = {
        "lua",
        "go",
        "python",
        "typescript",
        "vimdoc",
        "bash",
        "diff",
        "html",
        "markdown",
        "markdown_inline",
        "query",
        "vim"
      },
      sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
      ignore_install = { "" }, -- List of parsers to ignore installing
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true, disable = { "yaml" } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-a>",
          node_incremental = "<C-a>",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
      },
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
    event = 'VimEnter',
    opts = {
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
      
      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  }
})
