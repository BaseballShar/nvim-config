local keymap = vim.keymap.set

return {
  -- Comments all the way
  "numToStr/Comment.nvim",

  -- Treesitter oxygenates your language parsers
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Mason the medieval lsp gather
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      keymap('n', '<Leader>ms', ':Mason<CR>')
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

      keymap('n', '<Leader>ml', ':LspInfo<CR>')
      keymap('n', 'K', vim.lsp.buf.hover)
      keymap('n', '<C-k>', vim.lsp.buf.signature_help)
      keymap('n', 'gd', vim.lsp.buf.definition)
      keymap('n', 'gr', vim.lsp.buf.references)
      keymap('n', 'rn', vim.lsp.buf.rename)
      keymap('n', '<Space>ca', vim.lsp.buf.code_action)
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
}
