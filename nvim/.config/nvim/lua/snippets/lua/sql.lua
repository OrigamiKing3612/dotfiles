local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local sn = ls.snippet_node

local ts_locals = require("nvim-treesitter.locals")
local ts_utils = require("nvim-treesitter.ts_utils")
local get_node_text = vim.treesitter.get_node_text

ls.add_snippets("sql", {
	-- s(
	-- 	"sel",
	-- 	fmt("SELECT {} FROM {};", {
	-- 		i(1, "*"),
	-- 		i(2, "table_name"),
	-- 	})
	-- ),
	-- s(
	-- 	"ins",
	-- 	fmt("INSERT INTO {} ({}) VALUES ({});", {
	-- 		i(1, "table_name"),
	-- 		i(2, "column1, column2"),
	-- 		i(3, "value1, value2"),
	-- 	})
	-- ),
	-- s(
	-- 	"upd",
	-- 	fmt("UPDATE {} SET {} WHERE {};", {
	-- 		i(1, "table_name"),
	-- 		i(2, "column1 = value1"),
	-- 		i(3, "condition"),
	-- 	})
	-- ),
	-- s(
	-- 	"del",
	-- 	fmt("DELETE FROM {} WHERE {};", {
	-- 		i(1, "table_name"),
	-- 		i(2, "condition"),
	-- 	})
	-- ),
	s(
		"#--",
		fmt("-- name: {} :exec", {
			i(1, "name"),
		})
	),
})
