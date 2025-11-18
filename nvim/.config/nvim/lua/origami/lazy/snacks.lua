return {
	"folke/snacks.nvim",
	priority = 1001,
	lazy = false,
	opts = {
		-- image = {},
		input = {
			enable = true,
			relative = "cursor",
			row = -3,
			col = 0,
		},
		lazygit = {
			configure = false,
			win = {
				style = "lazygit",
			},
		},
		git = {
			enable = true,
		},
		words = {
			enable = true,
		},
		win = {
			border = true,
		},
	},
	keys = {
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Open Lazygit",
		},
		{
			"<leader>llg",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Open Lazygit Log",
		},
		{
			"<leader>K",
			function()
				Snacks.image.hover()
			end,
			desc = "Hover Image",
			mode = { "n" },
		},
	},
}
