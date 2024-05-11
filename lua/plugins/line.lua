return {
  -- A decent buffer indicator for vim
  {
    "akinsho/bufferline.nvim",
    version = "4.5.x",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup()
    end
  },

  -- A Nice and highly customisible statusline for vim
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        sections = {
          lualine_b = {"branch", "diff"},
          lualine_c = {"g:coc_status"},
          lualine_x = {"diagnostics"}
        }
      })
    end,
  }
}
