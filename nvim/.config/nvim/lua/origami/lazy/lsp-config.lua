local vue_language_server_path = vim.fn.stdpath("data")
	.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}

local vue_ls_config = {
	filetypes = { "vue" },
	root_markers = { "package.json", "tsconfig.json" },
	on_init = function(client)
		client.handlers["tsserver/request"] = function(_, result, context)
			local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
			if #clients == 0 then
				vim.notify(
					"Could not find `vtsls` lsp client, `vue_ls` would not work without it.",
					vim.log.levels.ERROR
				)
				return
			end
			local ts_client = clients[1]
			---@diagnostic disable-next-line: deprecated
			local param = unpack(result)
			---@diagnostic disable-next-line: deprecated
			local id, command, payload = unpack(param)
			ts_client:exec_cmd({
				title = "vue_request_forward",
				command = "typescript.tsserverRequest",
				arguments = {
					command,
					payload,
				},
			}, { bufnr = context.bufnr }, function(_, r)
				local response_data = { { id, r.body } }
				---@diagnostic disable-next-line: param-type-mismatch
				client:notify("tsserver/response", response_data)
			end)
		end
	end,
}

local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config("lua_ls", {
	filetypes = { "lua" },
	capabilities = capabilities,
})
vim.lsp.enable({ "lua_ls" })

vim.lsp.config("gopls", {
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.mod" },
	capabilities = capabilities,
})
vim.lsp.enable({ "gopls" })

vim.lsp.config("rust_analyzer", {
	filetypes = { "rust" },
	capabilities = capabilities,
})
vim.lsp.enable({ "rust_analyzer" })

vim.lsp.config("pyright", {
	filetypes = { "py", "python" },
	capabilities = capabilities,
})
vim.lsp.enable({ "pyright" })

vim.lsp.config("clangd", {
	capabilities = capabilities,
})
vim.lsp.enable({ "clangd" })

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

vim.lsp.config("jdtls", {
	filetypes = { "java" },
	capabilities = capabilities,
})
vim.lsp.enable({ "jdtls" })

vim.lsp.config("jsonls", {
	filetypes = { "json", "jsonc" },
	capabilities = capabilities,
})
vim.lsp.enable({ "jsonls" })

vim.lsp.config("vtsls", {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	on_attach = function(_, bufnr)
		local opts = { buffer = bufnr, desc = "Goto Definition" }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	end,
})
vim.lsp.config("vue_ls", vue_ls_config)
vim.lsp.enable({ "vtsls", "vue_ls" })

vim.lsp.config("sourcekit", {
	filetypes = { "swift", "objective-c", "objective-cpp" },
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	},
})
vim.lsp.enable({ "sourcekit" })

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
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"rust_analyzer",
				-- "volar",
				"pyright",
				"jdtls",
				"yamlls",
				"dockerls",
				"docker_compose_language_service",
				"vtsls",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
	},
}
