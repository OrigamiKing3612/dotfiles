return {
	{ "github/copilot.vim" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			-- "saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		opts = {
			config = {
				set_config = {
					history = true,
					updateevents = "TextChanged,TextChangedI",
				},
			},
		},
		config = function()
			require("luasnip.loaders.from_snipmate").load({ paths = "./snippets" })
		end,
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		--- @module 'blink.cmp'
		--- @class blink.cmp.Source
		opts = {
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			keymap = {
				preset = "enter",
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			},
			snippets = { preset = "luasnip" },
			signature = {
				enabled = true,
			},
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
}
