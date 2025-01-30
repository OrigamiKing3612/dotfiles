return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			strategies = {
				chat = {
					adapter = "copilot",
					roles = {
						llm = "Code Companion",
						user = "Origami",
					},
				},
			},
			display = {
				action_palette = {
					provider = "telescope",
				},
			},
		},
	},
	-- { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
}
