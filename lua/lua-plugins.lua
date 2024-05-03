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
  ensure_installed = {
    "c", "cpp", "haskell", "html", "javascript", "typescript",
    "python", "lua", "vim"
  },
  auto_install = true,
  -- To prevent conflict with vim-tex
  ignore_install = {"latex"},

  highlight = {enable = true, additional_vim_regex_highlighting = false},
  indent = {enable = true}
}

-- A Terminal inside a vim run by another terminal
require('toggleterm').setup {size = 15, open_mapping = [[<C-t>]]}

-- Should provide better commenting for CODE!
require('Comment').setup()

-- Mini plugins
require('mini.starter').setup({
  header = "Welcome Fisher Baseball\nTime for some bruh work!",
})
require('mini.ai').setup()
require('mini.jump').setup({
  delay = {
    idle_stop = 1000,
  }
})
require('mini.align').setup()

-- Indent blanklines
require('ibl').setup{
  scope = {enabled = false},
}

-- Kitty scrollback
require('kitty-scrollback').setup()

-- Telescope settings
require('telescope').setup({
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
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
    }
  }
})

-- Use fzf algorithm and syntax for telescope
require('telescope').load_extension('fzf')
-- Integration Telescope with zoxide
require("telescope").load_extension('zoxide')
