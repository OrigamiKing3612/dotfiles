return {
	"akinsho/nvim-bufferline.lua",
	version = "*",
	after = "catppuccin",
	opts = {
		options = {
			mode = "tabs",
			mappings = true,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
			separator_style = "separator",
			offsets = {
				{ filetype = "neo-tree", text = "File Explorer", highlight = "Directory", text_align = "left" },
			},
		},
	},
}
