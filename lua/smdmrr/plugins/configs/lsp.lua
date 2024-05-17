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
}
local ensure_installed = {
	"stylua",
	"markdownlint",
	"shellcheck",
	"ruff", -- python formatter/linter
	"mypy", -- python type checker
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
