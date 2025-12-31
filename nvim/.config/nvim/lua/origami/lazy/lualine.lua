return {
	"nvim-lualine/lualine.nvim",
	requires = { "nvim-tree/nvim-web-devicons" },
	--- @module 'lualine.nvim'
	--- @class lualine.nvim.config
	opts = function()
		local lazy_status = require("lazy.status")
		-- local symbols = require("trouble").statusline({
		-- 	mode = "lsp_document_symbols",
		-- 	groups = {},
		-- 	title = false,
		-- 	filter = { range = true },
		-- 	format = "{kind_icon}{symbol.name:Normal}",
		-- 	-- The following line is needed to fix the background color
		-- 	-- Set it to the lualine section you want to use
		-- 	hl_group = "lualine_c_normal",
		-- })

		return {
			options = {
				icons_enabled = true,
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				-- lualine_c = {
				-- 	{
				-- 		symbols.get,
				-- 		cond = symbols.has,
				-- 	},
				-- },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#f9e2af" },
					},
					{ "filetype" },
				},
			},
		}
	end,
}
