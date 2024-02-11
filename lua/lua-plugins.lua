-- A Nice and highly customisible statusline for vim
require('lualine').setup {
  sections = {
    lualine_b = {'branch', 'diff'},
    lualine_c = {'g:coc_status'},
    lualine_x = {'diagnostics'}
  }
}

-- A decent buffer indicator for vim
require('bufferline').setup()

-- Huge and colourful tree!
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  auto_install = true,
  -- To prevent conflict with vim-tex
  ignore_install = {"latex"},

  highlight = {enable = true, additional_vim_regex_highlighting = false},
  indent = {enable = true}
}

-- A Terminal inside a vim run by another terminal
require('toggleterm').setup {size = 25, open_mapping = [[<C-t>]]}

-- Should provide better commenting for CODE!
require('Comment').setup()
