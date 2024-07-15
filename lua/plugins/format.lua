return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    -- Link formatters to filetypes
    conform.setup({
      formatters_by_ft = {
        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        lua = { "stylua" },
        python = { "autopep8" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
      },
      -- Auto format on save
      format_on_save = {
        timeout_ms = 500,
      },
    })

    -- Configure formatter arguments
    conform.formatters.stylua = {
      prepend_args = {
        "--indent-type",
        "Spaces",
        "--indent-width",
        "2",
        "--column-width",
        "80",
      },
    }

    -- Uncomment if want to manually format
    -- vim.keymap.set("n", "<Leader>cf", conform.format)
  end,
}
