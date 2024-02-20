local home = vim.fn.expand("$HOME")

return {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
        require("chatgpt").setup({
            api_key_cmd = "cat " .. home .. "/secret-gpt.txt",
            openai_params = {
                model = "gpt-3.5-turbo",
                max_tokens = 4000,
            },
            openai_edit_params = {
                model = "gpt-3.5-turbo",
                temperature = 0,
                top_p = 1,
                n = 1,
            },
        })
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
        "nvim-telescope/telescope.nvim"
    }
}
