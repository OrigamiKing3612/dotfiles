return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local autopairs = require("nvim-autopairs")

		autopairs.setup({
			-- check_ts = true,
			-- ts_config = {
			-- 	lua = { "string" },
			-- 	javascript = { "template_string" },
			-- 	typescript = { "string", "template_string" },
			-- 	html = { "tag" },
			-- 	swift = { "string", "comment" },
			-- 	java = { "string" },
			-- },
			-- fast_wrap = {},
			-- disable_filetype = { "TelescopePrompt", "vim" },
			-- enable_check_bracket_line = false,
			-- ignored_next_char = "[%w%.]",
		})

		-- local Rule = require("nvim-autopairs.rule")
		-- autopairs.add_rules({
		-- 	Rule("<", ">", "html"),
		-- 	Rule("<", ">", "xml"),
		-- 	Rule("{", "}"),
		-- 	Rule("[", "]"),
		-- 	Rule("(", ")"),
		-- 	Rule('"', '"'),
		-- 	Rule("'", "'"),
		-- })
		--
		-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		-- local cmp = require("cmp")
		-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
