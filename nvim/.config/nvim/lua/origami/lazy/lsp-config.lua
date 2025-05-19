return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"rust_analyzer",
				"volar",
				"pyright",
				"jdtls",
				"yamlls",
				"dockerls",
				"docker_compose_language_service",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("volar", {
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
				init_options = {
					vue = {
						hybridMode = false,
					},
				},
				-- capabilities = capabilities,
			})

			lspconfig.sourcekit.setup({
				capabilities = {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				},
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.yamlls.setup({
				capabilities = capabilities,
			})
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})
			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			-- lspconfig.html.setup({
			-- 	capabilities = capabilities,
			-- })

			local augroup = vim.api.nvim_create_augroup("LspAttachGroup", {})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = augroup,
				callback = function(event)
					local opts = { buffer = event.buf }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
				end,
			})
		end,
	},
}
