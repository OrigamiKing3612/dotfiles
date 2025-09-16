return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			transparent_background = true,
			background = {
				dark = "mocha",
			},
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			default_integrations = true,
			integrations = {
				cmp = true,
				blink_cmp = {
					enabled = true,
				},
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
			custom_highlights = function(C)
				local O = require("catppuccin").options
				return {
					["@tag"] = { fg = C.mauve }, -- Tags like html tag names.
					["@tag.attribute"] = { fg = C.teal, style = O.styles.miscs or { "italic" } }, -- Tags like html tag names.
					["@type.builtin"] = { fg = C.yellow, style = O.styles.properties or { "italic" } }, -- For builtin types.
					["@variable.member"] = { fg = C.lavender }, -- For fields.
					["@property"] = { fg = C.lavender, style = O.styles.properties or {} }, -- Same as TSField.
				}
			end,
		},
	},
}
