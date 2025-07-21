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

vim.treesitter.query.set(
	"go",
	"method_receiver_name",
	[[ [
		(method_declaration
			receiver: (parameter_list
				(parameter_declaration
					name: (identifier) @receiver_name
					)
				)
			)
	] ]]
)

local function get_go_receiver_name()
	local cursor_node = ts_utils.get_node_at_cursor()
	local scope = ts_locals.get_scope_tree(cursor_node, 0)

	local function_node
	for _, v in ipairs(scope) do
		if v:type() == "method_declaration" then
			function_node = v
			break
		end
	end

	if function_node == nil then
		return nil
	end

	local bufnr = 0

	local query = vim.treesitter.query.get("go", "method_receiver_name")
	for id, node in query:iter_captures(function_node, bufnr) do
		local name = query.captures[id]
		if name == "receiver_name" then
			local receiver_name = vim.treesitter.get_node_text(node, bufnr)
			return receiver_name
		end
	end

	return nil
end

local go_receiver_name = function()
	local receiver_name = get_go_receiver_name()
	print(receiver_name)

	if receiver_name == nil then
		return
	end

	return ls.sn(nil, { t(receiver_name .. ".") })
end

local function get_func_info()
	local cursor_node = ts_utils.get_node_at_cursor()
	local scope = require("nvim-treesitter.locals").get_scope_tree(cursor_node, 0)

	local func_node
	for _, node in ipairs(scope) do
		if node:type() == "function_declaration" or node:type() == "method_declaration" then
			func_node = node
			break
		end
	end

	if not func_node then
		return nil
	end

	local bufnr = 0
	local func_name_node = func_node:field("name")[1]
	local param_node = func_node:field("parameters")[1]

	local func_name = func_name_node and get_node_text(func_name_node, bufnr) or "func"

	local params = {}
	if param_node then
		for param in param_node:iter_children() do
			if param:type() == "parameter_declaration" then
				local names = { param:field("name")[1] }
				for _, name_node in ipairs(names) do
					if name_node then
						table.insert(params, get_node_text(name_node, bufnr))
					end
				end
			end
		end
	end

	return {
		name = func_name,
		params = params,
	}
end

local function log_print_dynamic()
	return d(1, function()
		local info = get_func_info()
		if not info then
			return sn(nil, { t('log.Printf("")') })
		end

		-- Start the format string
		local fmt_str = info.name .. ": "
		local args = {}

		for idx, param in ipairs(info.params) do
			if idx > 1 then
				fmt_str = fmt_str .. ", "
			end
			fmt_str = fmt_str .. param .. "=%v"
			table.insert(args, t({ ", " .. param }))
		end

		-- Now build the final snippet node
		local nodes = {
			t('log.Printf("'),
			t(fmt_str),
			t('"'),
		}

		-- Insert all args (as plain text nodes)
		for _, arg in ipairs(info.params) do
			table.insert(nodes, t(", "))
			table.insert(nodes, t(arg))
		end

		table.insert(nodes, t(")"))

		return sn(nil, nodes)
	end)
end

ls.add_snippets("go", {
	-- s("slogerr", {
	-- 	d(1, go_receiver_name),
	-- 	t('logger.Error("'),
	-- 	i(2, "msg"),
	-- 	t('", slog.Any("error", err))'),
	-- }),

	s("iferr", {
		t({ "if err != nil {", "" }),
		i(1, "    return"),
		t({ "", "}" }),
	}),

	s("fmterr", {
		t('fmt.Errorf("'),
		i(1, "msg"),
		t(': %w", err)'),
	}),

	s("httperr", {
		t({ "if err != nil {", "  w.WriteHeader(http." }),
		i(1, "StatusInternalServerError"),
		t({ ")", "  return", "}" }),
	}),
	s("#ctx", {
		t("ctx context.Context"),
	}),
	s("#serv", {
		t("server *server.Server"),
	}),
	s("#print", {
		log_print_dynamic(),
	}),
})
