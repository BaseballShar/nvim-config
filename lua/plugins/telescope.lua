local keymap = vim.keymap.set
local opts = {silent = true}

return {
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            theme = "dropdown",
          }
        },
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
      })
      local builtin = require("telescope.builtin")
      keymap("n", "<Leader>f", builtin.find_files)
      keymap("n", "<Leader>b", builtin.buffers)
      keymap("n", "<Leader>gb", builtin.current_buffer_fuzzy_find)
      keymap("n", "<Leader>gc", builtin.commands)
      keymap("n", "<Leader>gm", builtin.marks)
      keymap("n", "<Leader>gh", builtin.oldfiles)
      keymap("n", "<Leader>gr", builtin.registers)
      keymap("n", "<Leader>gk", builtin.keymaps)
    end,
  },
  -- Telescope ui select
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown{}
          }
        }
      })
      telescope.load_extension("ui-select")
    end,
  },
  -- fzf integration
  {
    "junegunn/fzf",
    dependencies = "junegunn/fzf.vim",
    config = function()
      keymap("n", "<Leader>gg", ":Rg<CR>", opts)
      keymap("n", "<Leader>gf", ":Lines<CR>", opts)
    end,
  },
  -- Breathable air for nvim
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        filters = {
          dotfiles = true
        }
      })
      keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)
    end,
  },
}
