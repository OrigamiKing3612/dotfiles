return {
	{
		"zbirenbaum/copilot.lua",
		dependencies = {
			"giuxtaposition/blink-cmp-copilot",
		},
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
				copilot_node_command = vim.fn.expand("$HOME") .. "/.local/share/nvm/versions/node/v25.2.1/bin/node",
				nes = {
					enabled = false,
				},
			})
		end,
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
			"giuxtaposition/blink-cmp-copilot",
		},
		version = "1.*",
		--- @module 'blink.cmp'
		--- @class blink.cmp.Source
		opts = {
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			completion = {
				menu = {
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind" },
						},
					},
				},
			},
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
				-- "lazydev",
				default = { "lsp", "path", "snippets", "buffer", "copilot" },
				providers = {
					-- lazydev = {
					-- 	name = "LazyDev",
					-- 	module = "lazydev.integrations.blink",
					-- 	score_offset = 100,
					-- },
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 100,
						async = true,
						transform_items = function(_, items)
							local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
							local kind_idx = #CompletionItemKind + 1
							CompletionItemKind[kind_idx] = "Copilot"
							for _, item in ipairs(items) do
								item.kind = kind_idx
							end
							return items
						end,
					},
				},
			},
			appearance = {
				kind_icons = {
					Copilot = "",
					Text = "󰉿",
					Method = "󰊕",
					Function = "󰊕",
					Constructor = "󰒓",

					Field = "󰜢",
					Variable = "󰆦",
					Property = "󰖷",

					Class = "󱡠",
					Interface = "󱡠",
					Struct = "󱡠",
					Module = "󰅩",

					Unit = "󰪚",
					Value = "󰦨",
					Enum = "󰦨",
					EnumMember = "󰦨",

					Keyword = "󰻾",
					Constant = "󰏿",

					Snippet = "󱄽",
					Color = "󰏘",
					File = "󰈔",
					Reference = "󰬲",
					Folder = "󰉋",
					Event = "󱐋",
					Operator = "󰪚",
					TypeParameter = "󰬛",
				},
			},
		},
	},
	-- {
	-- 	"folke/lazydev.nvim",
	-- 	ft = "lua",
	-- 	opts = {
	-- 		library = {
	-- 			"lazy.nvim",
	-- 			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	-- 			"LazyVim",
	-- 			"LazyDev",
	-- 		},
	-- 		enabled = function(root_dir)
	-- 			return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
	-- 		end,
	-- 	},
	-- },
}
