return {
	"ChristianChiarulli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			filetypes = {
				"typescript",
				"typescriptreact",
				"javascript",
				"javascriptreact",
				"css",
				"html",
				"lua",
			},
			user_default_options = {
				names = false,
				rgb_fn = true,
				hsl_fn = true,
				tailwind = "both",
			},
			buftypes = {},
		})
	end,
}
