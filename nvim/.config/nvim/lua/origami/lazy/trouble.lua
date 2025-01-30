return {
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		config = function()
			require("trouble").setup({})
		end,
	},
}
