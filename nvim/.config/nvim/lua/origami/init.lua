require("origami.set")
require("origami.lazy_init")
require("origami.remap")

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

-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.cmd("TSBufEnable highlight")
-- 	end,
-- })
