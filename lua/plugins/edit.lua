return {
  -- Add surrounding delimiters for text objects
  "tpope/vim-surround",

  -- An array of useful mini features
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.starter").setup({
        header = "Welcome Fisher Baseball\nTime for some bruh work!",
      })
      require("mini.ai").setup()
      require("mini.jump").setup({
        delay = {
          idle_stop = 1000,
        },
      })
    end,
  },

  -- Auto close pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- LaTeX >>> Word
  {
    "lervag/vimtex",
    tag = "v2.15",
    lazy = false,
    config = function()
      -- Disable auto popup of quickfix window
      vim.g.vimtex_quickfix_mode = 0
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_view_method = "skim"
      -- Value 1 allows forward search after every successful compilation
      vim.g.vimtex_view_skim_sync = 1
      -- Value 1 allows chanvim.ge focus to skim after command `.VimtexView` is given
      vim.g.vimtex_view_skim_activate = 1
      vim.cmd("autocmd FileType tex nnoremap <silent> <buffer> <Space>lt :VimtexTocToggle<CR>")
    end,
  },

  -- Jump to everywhere within 4 strokes
  {
    "ggandor/leap.nvim",
    config = function()
      vim.keymap.set('n',        's', '<Plug>(leap)')
      vim.keymap.set('n',        'S', '<Plug>(leap-from-window)')
      vim.keymap.set({'x', 'o'}, 's', '<Plug>(leap-forward)')
      vim.keymap.set({'x', 'o'}, 'S', '<Plug>(leap-backward)')
    end,
  }
}
