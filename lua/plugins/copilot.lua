local keymap = vim.keymap.set
local user_command = vim.api.nvim_create_user_command

return {
	-- Annoying copilot
	{
		"github/copilot.vim",
		config = function()
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_no_tab_map = true

			-- Keymaps for accepting suggestions
			vim.cmd('inoremap <silent><script><expr> <C-CR> copilot#Accept("")')
			keymap("i", "<C-l>", "<Plug>(copilot-accept-line)", { silent = true })
			keymap("i", "<C-w>", "<Plug>(copilot-accept-word)", { silent = true })

			-- A Vim function for toggling copilot
			local copilot_on = true
			user_command("CopilotToggle", function()
				if copilot_on then
					vim.cmd("Copilot disable")
					print("Copilot landed")
				else
					vim.cmd("Copilot enable")
					print("Copilot taken off")
				end
				copilot_on = not copilot_on
			end, { nargs = 0 })
			vim.keymap.set("", "<Leader>cp", ":CopilotToggle<CR>", { silent = true })
		end,
	},
}
