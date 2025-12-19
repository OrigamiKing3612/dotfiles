return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	branch = "master",
	opts = {
		-- A list of parser names, or "all"
		ensure_installed = {
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			"javascript",
			"typescript",
			"java",
			"swift",
			"rust",
			"bash",
			"dockerfile",
			"json",
			"yaml",
			"html",
			"css",
			"scss",
			"gitignore",
			"vue",
		},

		sync_install = false,

		auto_install = true,

		indent = {
			enable = true,
		},
		-- autotag = {
		-- 	enable = true,
		-- },
		highlight = {
			enable = true,

			additional_vim_regex_highlighting = { "markdown" },
		},
	},
}
