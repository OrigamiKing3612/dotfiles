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

vim.o.autocomplete = true
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("origami.lsp", {}),
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end

		if
			not client:supports_method("textDocument/willSaveWaitUntil")
			and client:supports_method("textDocument/formatting")
		then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("origami.lsp", { clear = false }),
				buffer = ev.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})
