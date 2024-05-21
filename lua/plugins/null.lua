local autocmd = vim.api.nvim_create_autocmd
local keymap = vim.keymap.set
local opts = { buffer = true, silent = true }

-- Use shell commands for normal and visual range formatting
local format_configs = {
	{
		filetype = "python",
		formatter = "autopep8",
		flag = "-",
	},
	{
		filetype = { "html", "css", "javascript", "typescript" },
		formatter = "prettier",
		flag = "--stdin-filepath %",
	},
	{
		filetype = "lua",
		formatter = "stylua",
		flag = "-",
	},
}

return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- null_ls.builtins.formatting.stylua,
			},
		})

		-- Creates autocmds for formatting files
		for _, config in ipairs(format_configs) do
			autocmd("Filetype", {
				pattern = config.filetype,
				callback = function()
					local command_str = config.formatter .. " " .. config.flag .. "<CR>"
					local normal_command = ":%!" .. command_str
					local visual_command = ":'<,'>!" .. command_str
					keymap("n", "<Leader>cf", normal_command, opts)
					keymap("x", "<Leader>cf", visual_command, opts)
				end,
			})
		end
	end,
}
