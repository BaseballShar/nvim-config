local keymap = vim.keymap.set
local lsp_servers = {
  "lua_ls",
  "tsserver",
  "pyright",
  "hls",
  "vimls",
  "texlab",
  "html",
  "cssls",
  "emmet_language_server",
}

return {
  -- Comments all the way
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Treesitter oxygenates your language parsers
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- Huge and colourful tree!
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "cpp",
          "haskell",
          "html",
          "java",
          "javascript",
          "lua",
          "python",
          "typescript",
          "vim",
        },
        -- Avoid conflicts with vimtex
        ignore_install = { "latex" },
        auto_install = true,
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
      })
    end,
  },

  -- Mason the medieval lsp gather
  {
    "williamboman/mason.nvim",
    tag = "v1.10.0",
    config = function()
      require("mason").setup()
      keymap("n", "<Leader>m", ":Mason<CR>")
    end,
  },

  -- Mason lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    tag = "v1.29.0",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = lsp_servers,
      })
    end,
  },

  -- nvim lspconfig
  {
    "neovim/nvim-lspconfig",
    tag = "v0.1.7",
    config = function()
      local lspconfig = require("lspconfig")
      for _, server in ipairs(lsp_servers) do
        lspconfig[server].setup({})
      end

      keymap("n", "<Leader>k", ":LspInfo<CR>")
      keymap("n", "K", vim.lsp.buf.hover)
      keymap("n", "gi", vim.lsp.buf.implementation)
      keymap("n", "gd", vim.lsp.buf.definition)
      keymap("n", "gr", vim.lsp.buf.references)
      keymap("n", "rn", vim.lsp.buf.rename)
      keymap("n", "<Space>ca", vim.lsp.buf.code_action)
      keymap("n", "]d", vim.diagnostic.goto_next)
      keymap("n", "[d", vim.diagnostic.goto_prev)
    end,
  },

  -- Snippet plugins
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
          { name = "buffer" },
          { name = "path" },
        }),
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })

      -- Set up lspconfig.
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      for _, server in ipairs(lsp_servers) do
        require("lspconfig")[server].setup({
          capabilities = capabilities,
        })
      end
    end,
  },
  "saadparwaiz1/cmp_luasnip",
}
