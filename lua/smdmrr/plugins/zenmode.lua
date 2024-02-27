return {
    "folke/zen-mode.nvim",
    config = function()
        vim.keymap.set("n", "<leader>zz", function()
            require("zen-mode").setup {
                window = {
                    width = 90,
                },
            }
            require("zen-mode").toggle()
        end)


        vim.keymap.set("n", "<leader>zZ", function()
            require("zen-mode").setup {
                window = {
                    width = 90,
                    options = {
                        signcolumn = "no", -- disable signcolumn
                        number = false,   -- disable number column
                        relativenumber = false, -- disable relative numbers
                        cursorcolumn = false, -- disable cursor column
                        list = false,     -- disable whitespace characters
                        colorcolumn = "0", -- disable color column
                    },
                },
                -- callback where you can add custom code when the Zen window opens
                on_open = function()
                    -- if file is markdown - change colorscheme to one that is better for markdown
                    if vim.bo.filetype == "markdown" then
                        vim.cmd("colorscheme catppuccin")
                        vim.cmd("PencilToggle")
                    end
                end,
                -- callback where you can add custom code when the Zen window closes
                on_close = function()
                    vim.cmd("colorscheme kanagawa")
                    vim.cmd("PencilToggle")
                end,
            }
            require("zen-mode").toggle()
        end)
    end
}
