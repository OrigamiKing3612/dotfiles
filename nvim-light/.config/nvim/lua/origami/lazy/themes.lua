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
			default_integrations = true,
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
