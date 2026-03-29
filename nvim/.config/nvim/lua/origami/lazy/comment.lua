return {
	-- 'numToStr/Comment.nvim',
	"faergeek/Comment.nvim", -- use this and branch until fixed
	branch = "nvim-0.12-compatibility",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	opts = function()
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		return {
			pre_hook = ts_context_commentstring.create_pre_hook(),
		}
	end,
}
