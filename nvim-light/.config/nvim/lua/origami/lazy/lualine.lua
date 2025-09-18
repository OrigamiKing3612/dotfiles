return {
	"nvim-lualine/lualine.nvim",
	requires = { "nvim-tree/nvim-web-devicons" },
	--- @module 'lualine.nvim'
	--- @class lualine.nvim.config
	opts = {
		options = {
			icons_enabled = true,
			theme = require("themery").getCurrentTheme().lualine,
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
		},
	},
}
