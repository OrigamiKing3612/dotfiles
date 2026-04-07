vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
	picker = {
		layouts = {
			telescope = {
				reverse = true,
				layout = {
					box = "horizontal",
					backdrop = 60,
					width = 0.8,
					height = 0.9,
					border = "none",
					{
						box = "vertical",
						{ win = "list", title = " Results ", title_pos = "center", border = "single" },
						{
							win = "input",
							height = 1,
							border = "single",
							title = "{title} {live} {flags}",
							title_pos = "center",
						},
					},
					{
						win = "preview",
						title = "{preview:Preview}",
						width = 0.45,
						border = "single",
						title_pos = "center",
					},
				},
			},
		},
		layout = "telescope",
	},
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
		border = "rounded",
		backdrop = {
			-- blend = 50,
			-- transparent = false,
		},
	},
	styles = {
		float = {},
	},
})
