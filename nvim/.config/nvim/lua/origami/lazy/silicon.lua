return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	config = function()
		require("nvim-silicon").setup({
			font = "FiraMono Nerd Font=34",
			theme = "Dracula",
			background = "#94e2d5",
			window_title = function()
				return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
			end,
			output = function()
				return "~/Desktop/code_" .. os.date("!%Y-%m-%dT%H-%M-%SZ") .. ".png"
			end,
			language = function()
				return vim.bo.filetype
			end,
		})
	end,
}
