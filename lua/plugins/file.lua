local keymap = vim.keymap.set
local opts = { silent = true }

return {
	-- Breathable air for nvim
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = "<Leader>e",
		config = function()
			require("neo-tree").setup({})
			keymap("n", "<Leader>e", ":Neotree toggle<CR>", opts)
		end,
	},
	-- Smooth like oil, vesatile like oil
	{
		"stevearc/oil.nvim",
		keys = { "-" },
		config = function()
			require("oil").setup({
				keymaps = {
					["h"] = "actions.parent",
					["l"] = "actions.select",
					["C-v"] = "actions.select_vsplit",
				},
			})
			keymap("n", "-", ":Oil<CR>", opts)
		end,
	},
}
