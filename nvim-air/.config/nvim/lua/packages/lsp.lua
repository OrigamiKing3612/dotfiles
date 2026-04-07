vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup()
require("mason-lspconfig").setup()

vim.lsp.config("lua_ls", {
	filetypes = { "lua" },
	settings = {
		Lua = {
			workspace = {
				vim.env.VIMRUNTIME,
				vim.fn.stdpath("data") .. "/lazy/snacks.nvim/lua",
			},
		},
	},
})

vim.lsp.enable({ "lua_ls", "bashls", "jsonls", "dockerls", "yamlls" })
