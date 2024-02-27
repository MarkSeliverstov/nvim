return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.api.nvim_set_keymap("n", "<leader>mp", ":MarkdownPreview<Cr>", { silent = true, noremap = true })
        vim.api.nvim_set_keymap("n", "<leader>mpt", ":MarkdownPreviewToggle<Cr>", { silent = true, noremap = true })
        vim.api.nvim_set_keymap("n", "<leader>mps", ":MarkdownPreviewStop<Cr>", { silent = true, noremap = true })
    end,
    ft = { "markdown" },
}
