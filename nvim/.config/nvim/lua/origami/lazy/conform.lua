return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "eslint_d", stop_after_first = true },
			-- java = { "ast-grep" },
			swift = { "swiftformat" },
			-- html = { "ast-grep" },
			bash = { "shfmt" },
			yaml = { "yamlfmt" },
			go = { "goimports", "gopls" },
			scss = { "cssls" },
			css = { "cssls" },
			-- vue = { "lsp" },
			-- typescript = { "eslint_d", stop_after_first = true },
		},
		formatters = {
			lsp = {
				inherit = true,
			},
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
