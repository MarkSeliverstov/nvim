local capabilities = nil
if pcall(require, "cmp_nvim_lsp") then
	capabilities = require("cmp_nvim_lsp").default_capabilities()
end

local lspconfig = require("lspconfig")

local servers_to_install = {
	"bashls",
	"clangd",
	"dockerls",
	"jsonls",
	"markdownlint",
	"omnisharp",
	"ruff_lsp",
	"tsserver",
	"yamlls",
	"shellcheck",
	-- "pyright",
}

require("mason").setup()
local ensure_installed = {
	"stylua",
	"lua_ls",
	"ruff",
	-- "mypy",
	-- "pylsp",
	-- "flake8",
}

vim.list_extend(ensure_installed, servers_to_install)
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

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
