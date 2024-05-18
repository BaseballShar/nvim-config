return {
  -- Colorscheme
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme everforest")
      vim.cmd("autocmd FileType vifm set ft=vim")
    end,
  },
  "rebelot/kanagawa.nvim",
}
