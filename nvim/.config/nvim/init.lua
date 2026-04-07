require("set")
require("lazy_init")
require("remap")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local OrigamiGroup = augroup("Origami", {})
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = OrigamiGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({
			lsp_fallback = true,
			bufnr = args.buf,
		})
	end,
})

autocmd({ "BufRead", "FileType" }, {
	desc = "Enable Treesitter",
	callback = function(event)
		local bufnr = event.buf
		local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

		if filetype == "" then
			return
		end

		-- Get parser name based on filetype
		local parser_name = vim.treesitter.language.get_lang(filetype)
		if not parser_name then
			vim.notify(vim.inspect("No treesitter parser found for filetype: " .. filetype), vim.log.levels.WARN)
			return
		end

		-- Try to get existing parser
		local parser_configs = require("nvim-treesitter.parsers")
		if not parser_configs[parser_name] then
			return -- Parser not available, skip silently
		end

		vim.treesitter.start(bufnr, parser_name)
		vim.bo[bufnr].syntax = "ON"

		-- vim.wo.foldlevel = 99
		-- vim.wo.foldmethod = "expr"
		-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		-- vim.wo.foldtext = "v:lua.vim.treesitter.foldtext()"

		vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- autocmd("ColorScheme", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
-- 	end,
-- })

vim.cmd("colorscheme catppuccin-nvim")
