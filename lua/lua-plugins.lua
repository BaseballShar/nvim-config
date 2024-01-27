-- A Nice and highly customisible statusline for vim
require('lualine').setup {
  sections = {
    lualine_b = {'branch', 'diff'},
    lualine_c = {},
    lualine_x = {'diagnostics'}
  }
}

-- A decent buffer indicator for vim
require('bufferline').setup {}

-- Huge and colour tree!
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  auto_install = true,
  -- To prevent conflict with vim-tex
  ignore_install = {"latex"},

  highlight = {enable = true, additional_vim_regex_highlighting = false},
  indent = {enable = true}
}

-- TERMINAL
require('toggleterm').setup {
  size = 15,
  open_mapping = [[<C-t>]],
}

-- Comments
require('Comment').setup()
