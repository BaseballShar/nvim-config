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
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            theme = "dropdown",
          }
        },
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
      })
      local builtin = require("telescope.builtin")
      local keymap = vim.keymap.set
      keymap('n', '<Leader>f', builtin.find_files)
      keymap('n', '<Leader>b', builtin.buffers)
      keymap('n', '<Leader>gb', builtin.current_buffer_fuzzy_find)
      keymap('n', '<Leader>gc', builtin.commands)
      keymap('n', '<Leader>gm', builtin.marks)
      keymap('n', '<Leader>gh', builtin.oldfiles)
      keymap('n', '<Leader>gr', builtin.registers)
      keymap('n', '<Leader>gk', builtin.keymaps)
    end,
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
  -- Mason lsp manager
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      vim.keymap.set('n', '<Leader>ms', ':Mason<CR>')
    end,
  },
  -- Mason lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls"}
      })
    end,
  },
  -- nvim lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})

      vim.keymap.set('n', '<Leader>ml', ':LspInfo<CR>')
      vim.keymap.set('n', 'K', vim.lsp.buf.hover)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references)
      vim.keymap.set('n', 'rn', vim.lsp.buf.rename)
      vim.keymap.set('n', '<Space>ca', vim.lsp.buf.code_action)
    end,
  },

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
