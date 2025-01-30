return {
	"akinsho/nvim-bufferline.lua",
	depends = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		require("bufferline").setup({
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
		})
	end,
}
