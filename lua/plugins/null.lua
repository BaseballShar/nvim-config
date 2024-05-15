local autocmd = vim.api.nvim_create_autocmd
local keymap = vim.keymap.set
local opts = { buffer = true, silent = true }

return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
      },
    })

    -- Autocmd formatting
    autocmd("Filetype", {
      pattern = "python",
      callback = function()
        keymap("n", "<Leader>cf", ":%!autopep8 -<CR>", opts)
        keymap("x", "<Leader>cf", ":'<,'>!autopep8 -<CR>", opts)
      end,
    })
  end,
}
