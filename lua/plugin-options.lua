-- A Terminal inside a vim run by another terminal
require("toggleterm").setup({
  size = 15,
  direction = "float",
  open_mapping = [[<A-1>]],
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
    "python", "lua", "vim", "java",
  },
  -- Avoid conflicts with vimtex
  ignore_install = {"latex"},
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
