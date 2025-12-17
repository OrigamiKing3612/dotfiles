return {
	"catgoose/nvim-colorizer.lua",
	event = "VeryLazy",
	opts = {
		lazy_load = true,
		user_default_options = {
			names = false,
			xterm = true,
			css = true,
			css_fn = true,
			buftypes = {},
			sass = { enable = false, parsers = { "css" } },

			mode = "background",
		},
	},
}
