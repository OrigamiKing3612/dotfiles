return {
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"elkowar/yuck.vim",
		ft = "yuck",
	},
	-- {
	-- 	"rushjs1/nuxt-goto.nvim",
	-- 	ft = "vue",
	-- },
	{
		"chrisgrieser/nvim-spider",
		lazy = true,
		keys = {
			{ "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
			{ "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
			{ "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
		},
	},
}
