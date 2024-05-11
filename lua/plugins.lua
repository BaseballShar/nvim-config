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
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown{}
          }
        }
      })
      telescope.load_extension("ui-select")
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
        ensure_installed = {"lua_ls", "tsserver"}
      })
    end,
  },
  -- nvim lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})

      vim.keymap.set('n', '<Leader>ml', ':LspInfo<CR>')
      vim.keymap.set('n', 'K', vim.lsp.buf.hover)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references)
      vim.keymap.set('n', 'rn', vim.lsp.buf.rename)
      vim.keymap.set('n', '<Space>ca', vim.lsp.buf.code_action)
    end,
  },

  -- Snippet plugins
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require'cmp'

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
            { name = 'buffer' },
          })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            { name = 'cmdline' }
          }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })

      -- Set up lspconfig.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
      require('lspconfig')['lua_ls'].setup {
        capabilities = capabilities
      }
      require('lspconfig')['tsserver'].setup {
        capabilities = capabilities
      }
    end,
  },

  -- LuaSnip engine
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

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
