local keymap = vim.keymap.set

return {
  -- Annoying copilot
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_no_tab_map = true

      vim.cmd('inoremap <silent><script><expr> <C-CR> copilot#Accept("")')
      keymap('i', '<C-l>', '<Plug>(copilot-accept-line)', { silent = true })
      keymap('i', '<C-w>', '<Plug>(copilot-accept-word)', { silent = true })

      -- Only enable copilot in these filetypes
      vim.g.copilot_filetypes = {
        ['*'] = false,
        fish = true,
      }
    end,
  },
}
