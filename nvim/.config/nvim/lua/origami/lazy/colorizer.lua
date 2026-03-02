return {
	"catgoose/nvim-colorizer.lua",
	event = "VeryLazy",
	opts = {
		lazy_load = true,
		options = {
			parsers = {
				css = true,
				css_fn = true,
				names = {
					enable = false,
					lowercase = true,
					camelcase = true,
					uppercase = false,
					strip_digits = false,
					custom = false, -- table|function|false
				},
				hex = {
					default = false,
					rgb = false, -- #RGB
					rgba = false, -- #RGBA
					rrggbb = true, -- #RRGGBB
					rrggbbaa = false, -- #RRGGBBAA
					aarrggbb = true, -- 0xAARRGGBB
				},
				rgb = { enable = true },
				hsl = { enable = true },
				oklch = { enable = true },
				tailwind = {
					enable = false,
					lsp = true,
					update_names = false,
				},
				sass = {
					enable = false,
					parsers = { css = true },
					variable_pattern = "^%$([%w_-]+)",
				},
				xterm = { enable = true },
				custom = {},
			},
			display = {
				mode = "background", -- "background"|"foreground"|"virtualtext"
				background = {
					bright_fg = "#000000",
					dark_fg = "#ffffff",
				},
				virtualtext = {
					char = "■",
					position = "eol", -- "eol"|"before"|"after"
					hl_mode = "foreground",
				},
				priority = {
					default = 150, -- vim.hl.priorities.diagnostics
					lsp = 200, -- vim.hl.priorities.user
				},
			},
		},
	},
}
