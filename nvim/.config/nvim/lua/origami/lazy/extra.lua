return {
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"elkowar/yuck.vim",
		ft = "yuck",
	},
	{
		"chrisgrieser/nvim-spider",
		lazy = true,
		keys = {
			{ "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
			{ "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
			{ "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
		},
	},
	{ "christoomey/vim-tmux-navigator" },
	{
		"wakatime/vim-wakatime",
		lazy = false,
	},
}
