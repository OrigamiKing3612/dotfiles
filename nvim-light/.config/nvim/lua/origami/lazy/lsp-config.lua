local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config("yamlls", {
	filetypes = { "yaml", "yml" },
	capabilities = capabilities,
})
vim.lsp.enable({ "yamlls" })

vim.lsp.config("dockerls", {
	capabilities = capabilities,
})
vim.lsp.enable({ "dockerls" })

vim.lsp.config("docker_compose_language_service", {
	capabilities = capabilities,
})
vim.lsp.enable({ "docker_compose_language_service" })

vim.lsp.config("jsonls", {
	filetypes = { "json", "jsonc" },
	capabilities = capabilities,
})
vim.lsp.enable({ "jsonls" })

vim.lsp.config("bashls", {
	filetypes = { "sh", "bash" },
	capabilities = capabilities,
})
vim.lsp.enable({ "bashls" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
	end,
})

return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
	},
}
