local lsp_servers = {
	"bashls",
	"clangd",
	"dockerls",
	"jsonls",
	"omnisharp",
	"tsserver",
	"yamlls",
	"pyright", -- python lsp
	"lua_ls",
	"ruff", -- python formatter/linter
}
local ensure_installed = {
	"stylua",
	"markdownlint",
	"shellcheck",
	"mypy", -- python type checker
	"ruff-lsp", -- python formatter/linter
	"typescript-language-server",
	"eslint-lsp",
	"prettierd",
}
vim.list_extend(ensure_installed, lsp_servers)

local lspconfig = require("lspconfig")

-- Install the following tools
require("mason").setup()
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

-- Enable the following language servers
for _, server in ipairs(lsp_servers) do
	lspconfig[server].setup({})
end

-- Setup yamlls language server
lspconfig.yamlls.setup({
	settings = {
		yaml = {
			validate = true,
			schemaStore = {
				enable = false,
				url = "",
			},
			schemas = {
				kubernetes = { "kube*/**/*.yaml", "kube*/*.yaml" },
				["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
				["https://json.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
			},
		},
	},
})

-- Setup clangd language server with custom command options
lspconfig.clangd.setup({
	cmd = { "clangd", "--fallback-style=webkit" },
})

-- Keymaps for LSP
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
		vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = 0 })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = 0 })
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { buffer = 0 })

		vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })
		vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })
	end,
})
