return {
  -- Add surrounding delimiters for text objects
  "tpope/vim-surround",

  -- An array of useful mini features
  { "echasnovski/mini.nvim", version = '*' },

  -- Auto close pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },

  -- LaTeX >>> Word
  {
    "lervag/vimtex",
    tag = "v2.15",
    lazy = false,
    config = function()
      -- Disable auto popup of quickfix window
      vim.g.vimtex_quickfix_mode = 0
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_view_method = 'skim'
      -- Value 1 allows forward search after every successful compilation
      vim.g.vimtex_view_skim_sync = 1
      -- Value 1 allows chanvim.ge focus to skim after command `.VimtexView` is given
      vim.g.vimtex_view_skim_activate = 1
      vim.cmd("autocmd FileType tex nnoremap <silent> <buffer> <Space>lt :VimtexTocToggle<CR>")
    end,
  },
}
