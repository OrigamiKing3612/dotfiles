return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = {
				{
					name = "catputtin",
					colorscheme = "catppuccin",
				},
				{
					name = "darkplus",
					colorscheme = "darkplus",
				},
				{
					name = "tokyonight",
					colorscheme = "tokyonight",
				},
				{
					name = "everforest",
					colorscheme = "everforest",
				},
			},
		})
	end,
}
