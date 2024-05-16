return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Autoformatting
			"stevearc/conform.nvim",
		},
		config = function()
			require("smdmrr.plugins.configs.lsp")
			require("smdmrr.plugins.configs.formatting")
		end,
	},
}
