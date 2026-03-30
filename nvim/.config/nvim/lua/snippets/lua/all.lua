local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local sn = ls.snippet_node

local project_snippet_path = vim.fn.getcwd() .. "/.nvim/snippets"

if vim.fn.isdirectory(project_snippet_path) == 1 then
	require("luasnip.loaders.from_lua").load({ paths = project_snippet_path })
end

vim.api.nvim_create_autocmd("DirChanged", {
	pattern = "*",
	callback = function()
		local path = vim.fn.getcwd() .. "/.nvim/snippets"
		if vim.fn.isdirectory(path) == 1 then
			require("luasnip.loaders.from_lua").load({ paths = path })
		end
	end,
})
