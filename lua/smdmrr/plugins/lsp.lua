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

			-- Autoformatting on Read
			local foramtting_group = vim.api.nvim_create_augroup("formatting", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter" }, {
				group = foramtting_group,
				callback = function()
					require("conform").format()
				end,
			})
		end,
	},
}
