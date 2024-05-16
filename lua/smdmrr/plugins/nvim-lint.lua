return {
	"mfussenegger/nvim-lint",
	event = { "BufWritePre", "BufRead" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			python = { "ruff" },
			markdown = { "markdownlint" },
			sh = { "shellcheck" },
		}

		local lint_group = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			-- pattern = { "*.lua", "*.py", "*.sh", "*.md" },
			group = lint_group,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", lint.try_lint, { buffer = 0 })
	end,
}
