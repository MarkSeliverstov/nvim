return {
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none", -- disable numbers bg
						},
					},
				},
			},
		},
		config = function(_, opts)
			require("kanagawa").setup(opts)
		end,
	},
}
