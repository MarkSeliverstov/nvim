require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = {
			"ruff_fix", -- To fix lint errors.
			"ruff_format", -- To run the Ruff formatter.
		},
		markdown = { "markdownlint" },
		typescript = { { "prettierd", "prettier" } },
		javascript = { { "prettierd", "prettier" } },
		graphql = { { "prettierd", "prettier" } },
		json = { { "prettierd", "prettier" } },
		yaml = { { "prettierd", "prettier" } },
    vue = { { "prettierd", "prettier" } },
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
vim.api.nvim_set_keymap(
	"n",
	"FF",
	"<cmd>lua require('conform').format()<CR>",
	{ noremap = true, silent = true }
)
