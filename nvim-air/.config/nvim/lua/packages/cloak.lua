vim.pack.add({
	{ src = "laytan/cloak.nvim" },
})

require("cloak").setup({
	opts = {
		enabled = true,
		cloak_character = "*",
		highlight_group = "Comment",
		patterns = {
			{
				file_pattern = {
					".env*",
					"wrangler.toml",
					".dev.vars",
				},
				cloak_pattern = "=.+",
			},
		},
	},
})
