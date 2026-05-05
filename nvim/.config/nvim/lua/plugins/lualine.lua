return {
	"nvim-lualine/lualine.nvim",
	requires = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = function()
		local lazy_status = require("lazy.status")
		local mocha = require("catppuccin.palettes").get_palette("mocha")

		--- @module 'lualine.nvim'
		--- @class lualine.nvim.config
		return {
			options = {
				icons_enabled = true,
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "toggleterm", "snacks_picker_input" },
					winbar = { "snacks_picker_input" },
				},
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = mocha.yellow },
					},
					{ "filetype" },
				},
			},
		}
	end,
}
