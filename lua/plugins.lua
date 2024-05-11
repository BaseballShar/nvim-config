local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
  -- Colorscheme
  "sainnhe/everforest",
  "rebelot/kanagawa.nvim",

  -- Search plugins
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  "junegunn/fzf",
  "junegunn/fzf.vim",
  "nvim-tree/nvim-tree.lua",

  -- Appearance plugins
  {
    "akinsho/bufferline.nvim",
    version = "4.5.x",
    dependencies = "nvim-tree/nvim-web-devicons"
  },
  "nvim-lualine/lualine.nvim",

  -- Language support plugins
  "numToStr/Comment.nvim",
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  -- Utility plugins
  { "akinsho/toggleterm.nvim", tag = "v2.11.0" },
  -- Auto-disable hightlight after moving on
  "romainl/vim-cool",
  {
    "vimwiki/vimwiki",
    init = function()
      vim.g.vimwiki_list = {{ syntax = 'markdown', ext = 'md' }}
    end,
  },
  "tpope/vim-surround",
  { "echasnovski/mini.nvim", version = '*' },
  -- Show hex code as colours
  {
    "rrethy/vim-hexokinase",
    build = "make hexokinase",
    init = function()
      vim.g.Hexokinase_highlighters = { "virtual" }
      vim.g.Hexokinase_optInPatterns = { "full_hex" }
    end,
  },
  -- Offers indent guide
  "lukas-reineke/indent-blankline.nvim",
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },

  -- Git plugins
  -- Shows sign columns and hunk text objects
  "airblade/vim-gitgutter",

  -- LaTeX plugins
  { "lervag/vimtex", tag = "v2.15", lazy = false },

  -- Terminal integration plugins
  "christoomey/vim-tmux-navigator",

  -- Annoying plugins
  "github/copilot.vim",
})
