return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    spec = {
      { "<Leader>/", desc = "Global search" },
      { "<Leader><Leader>", desc = "Current buffer fuzzy" },
      { "<Leader>b", desc = "Find buffers" },
      { "<Leader>c", group = "Code" },
      { "<Leader>ca", desc = "Code actions" },
      { "<Leader>cf", desc = "Code format" },
      { "<Leader>cp", desc = "Copilot toggle" },
      { "<Leader>d", group = "Diagnosis" },
      { "<Leader>ds", desc = "Document symbol" },
      { "<Leader>dt", desc = "Toggle diagnostics" },
      { "<Leader>f", desc = "Find files" },
      { "<Leader>g", group = "Grep" },
      { "<Leader>ga", desc = "Git" },
      { "<Leader>ga", desc = "Git" },
      { "<Leader>gc", desc = "Vim commands" },
      { "<Leader>gd", desc = "Diagnostics" },
      { "<Leader>gh", desc = "Old files" },
      { "<Leader>gk", desc = "Keymaps" },
      { "<Leader>gm", desc = "Marks" },
      { "<Leader>gr", desc = "Registers" },
      { "<Leader>gt", desc = "Todo" },
      { "<Leader>r", group = "Rename" },
      { "<Leader>rn", desc = "Rename variables" },
      { "<Leader>w", group = "Vimwiki" },
      { "<Leader>ws", desc = "Workspace symbol" },
      { "<Leader>ww", desc = "Open vimwiki" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
