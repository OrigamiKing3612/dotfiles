return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		proiority = 1000,
		opts = {
			flavour = "mocha",
			background = {
				dark = "mocha",
			},
			dim_inactive = {
				enabled = true,
				shade = "dark",
				percentage = 0.15,
			},
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				mason = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				lsp_trouble = false,
				neotree = true,
				fidget = true,
				copilot_vim = true,
				telescope = {
					enabled = true,
				},
			},
		},
	},
}
