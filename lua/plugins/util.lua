local keymap = vim.keymap.set

return {
  -- Terminal integration plugins
  "christoomey/vim-tmux-navigator",

  -- Auto-disable hightlight after moving on
  "romainl/vim-cool",

  -- Offers indent guide
  "lukas-reineke/indent-blankline.nvim",

  -- Git plugins
  -- Shows sign columns and hunk text objects
  "airblade/vim-gitgutter",

  { "akinsho/toggleterm.nvim", tag = "v2.11.0" },

  {
    "vimwiki/vimwiki",
    init = function()
      vim.g.vimwiki_list = {{ syntax = 'markdown', ext = 'md' }}
    end,
    config = function()
      keymap({"n", "v"}, "<M-Space>", "<Plug>VimwikiToggleListItem")
    end,
  },

  -- Show hex code as colours
  {
    "rrethy/vim-hexokinase",
    build = "make hexokinase",
    init = function()
      vim.g.Hexokinase_highlighters = { "virtual" }
      vim.g.Hexokinase_optInPatterns = { "full_hex" }
    end,
  },
}
