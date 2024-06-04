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
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
})
