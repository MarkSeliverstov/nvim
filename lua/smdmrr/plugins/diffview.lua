return {
	"sindrets/diffview.nvim",
	config = function()
		-- Lua
		local actions = require("diffview.actions")

		require("diffview").setup({
			keymaps = {
				file_panel = {
					{
						"n",
						"<leader>e",
						actions.toggle_files,
						{ desc = "Toggle the file panel" },
					},
					{
						"n",
						"cc",
						function()
							vim.ui.input({ prompt = "Commit message: " }, function(msg)
								if not msg then
									return
								end
								local results = vim.system({ "git", "commit", "-m", msg }, { text = true }):wait()

								if results.code ~= 0 then
									vim.notify(
										"Commit failed with the message: \n"
											.. vim.trim(results.stdout .. "\n" .. results.stderr),
										vim.log.levels.ERROR,
										{ title = "Commit" }
									)
								else
									vim.notify(results.stdout, vim.log.levels.INFO, { title = "Commit" })
								end
							end)
						end,
					},
				},
			},
		})
	end,
	keys = {
		{ "dv", "<cmd>DiffviewOpen<CR>" },
    { "q", "<cmd>DiffviewClose<CR>" },
	},
}
