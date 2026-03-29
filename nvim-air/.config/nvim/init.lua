require("set")

vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
})

require("mason").setup()
require("mason-lspconfig").setup()

require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	background = {
		dark = "mocha",
	},
	default_integrations = true,
	custom_highlights = function(C)
		local O = require("catppuccin").options
		return {
			["@tag"] = { fg = C.mauve }, -- Tags like html tag names.
			["@tag.attribute"] = { fg = C.teal, style = O.styles.miscs or { "italic" } }, -- Tags like html tag names.
			["@type.builtin"] = { fg = C.yellow, style = O.styles.properties or { "italic" } }, -- For builtin types.
			["@variable.member"] = { fg = C.lavender }, -- For fields.
			["@property"] = { fg = C.lavender, style = O.styles.properties or {} }, -- Same as TSField.
		}
	end,
})

require("snacks").setup({
	picker = {
		layouts = {
			telescope = {
				reverse = true,
				layout = {
					box = "horizontal",
					backdrop = 60,
					width = 0.8,
					height = 0.9,
					border = "none",
					{
						box = "vertical",
						{ win = "list", title = " Results ", title_pos = "center", border = "single" },
						{
							win = "input",
							height = 1,
							border = "single",
							title = "{title} {live} {flags}",
							title_pos = "center",
						},
					},
					{
						win = "preview",
						title = "{preview:Preview}",
						width = 0.45,
						border = "single",
						title_pos = "center",
					},
				},
			},
		},
		layout = "telescope",
	},
	input = {
		enable = true,
		relative = "cursor",
		row = -3,
		col = 0,
	},
	lazygit = {
		configure = false,
		win = {
			style = "lazygit",
		},
	},
	git = {
		enable = true,
	},
	words = {
		enable = true,
	},
	win = {
		border = "rounded",
		backdrop = {
			-- blend = 50,
			-- transparent = false,
		},
	},
	styles = {
		float = {},
	},
})

vim.cmd("colorscheme catppuccin-nvim")

vim.lsp.config("lua_ls", {
	filetypes = { "lua" },
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

vim.lsp.enable({ "lua_ls", "bashls", "jsonls", "dockerls", "yamlls" })
require("keymaps")
