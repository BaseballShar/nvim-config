-- A Nice and highly customisible statusline for vim
require("lualine").setup {
  sections = {
    lualine_b = {"branch", "diff"},
    lualine_c = {"g:coc_status"},
    lualine_x = {"diagnostics"}
  }
}

-- A decent buffer indicator for vim
require("bufferline").setup()

-- A Terminal inside a vim run by another terminal
require("toggleterm").setup({
  size = 15,
  direction = "float",
  open_mapping = [[<A-1>]],
})

-- Telescope settings
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
})

-- Comments
require("Comment").setup()

-- Mini plugins
require("mini.starter").setup({
  header = "Welcome Fisher Baseball\nTime for some bruh work!",
})
require("mini.ai").setup()
require("mini.jump").setup({
  delay = {
    idle_stop = 1000,
  }
})

-- Huge and colourful tree!
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c", "cpp", "haskell", "html", "javascript", "typescript",
    "python", "lua", "vim", "java"
  },
  auto_install = true,
  highlight = {enable = true, additional_vim_regex_highlighting = false},
  indent = {enable = true}
})

-- Indent blanklines
require("ibl").setup{
  scope = {enabled = false},
}

-- Breathable air for nvim
require("nvim-tree").setup({
  filters = {
    dotfiles = true
  }
})

-- Lsp lives here
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls"}
})
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})

vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', 'rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<Space>ca', vim.lsp.buf.code_action)
