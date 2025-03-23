return {
	"AndreM222/copilot-lualine", -- Copilot statusline
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		enabled = false,
		config = function()
			require("copilot").setup({
				panel = { enabled = false },
				suggestion = {
					enabled = false,
					auto_trigger = false,
					hide_during_completion = true,
					debounce = 75,
					keymap = {
						accept = false,
						accept_word = false,
						accept_line = false,
						next = "<C-L>",
						prev = "<C-H>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					-- yaml = false,
					markdown = true,
					-- help = false,
					-- gitcommit = false,
					-- gitrebase = false,
					-- hgcommit = false,
					-- svn = false,
					-- cvs = false,
					["."] = true,
				},
			})

			-- Enable <Tab> to indent if no suggestions are available
			vim.keymap.set("i", "<Tab>", function()
				if require("copilot.suggestion").is_visible() then
					require("copilot.suggestion").accept()
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
				end
			end, { desc = "Super Tab", silent = true })
		end,
	},
}
