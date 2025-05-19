return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			java = { "ast-grep" },
			swift = { "swiftformat" },
			html = { "ast-grep" },
			bash = { "shfmt" },
			yaml = { "yamlfmt" },
			go = { "goimports", "gopls" },
			vue = { "prettierd", "prettier", stop_after_first = true },
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
