require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = {
			-- To fix auto-fixable lint errors.
			"ruff_fix",
			-- To run the Ruff formatter.
			"ruff_format",
			-- To organize the imports.
			"ruff_organize_imports",
		},
		markdown = { "markdownlint" },
		typescript = { "prettierd" },
		javascript = { "prettierd" },
		javascriptreact = { "eslint_d", "prettierd", "prettier" },
		typescriptreact = { "eslint_d", "prettierd", "prettier" },
		css = { "prettierd", "prettier", stop_after_first = true },
		graphql = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		yaml = { "prettierd", "prettier", stop_after_first = true },
		vue = { "prettierd", "prettier", stop_after_first = true },
		terraform = { "terraform_fmt" },
		sql = { "sql-formatter" },
    go = { "gofmt", "gofumpt" },
	},
	-- format_on_save = {
	-- 	lsp_fallback = true,
	-- 	async = false,
	-- 	timeout_ms = 500,
	-- },
})

-- Autoformatting on Read
-- local foramtting_group = vim.api.nvim_create_augroup("formatting", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
-- 	group = foramtting_group,
-- 	callback = function()
-- 		require("conform").format()
-- 	end,
-- })

-- Command to format the current buffer
vim.api.nvim_set_keymap("n", "FF", "<cmd>lua require('conform').format()<CR>", { noremap = true, silent = true })
