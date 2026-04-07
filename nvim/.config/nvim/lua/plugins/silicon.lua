return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	opts = {
		font = "FiraMono Nerd Font=34",
		theme = os.getenv("HOME") .. "/dotfiles/bat/.config/bat/themes/Catppuccin Mocha.tmTheme",
		window_title = function()
			return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
		end,
		output = function()
			return "~/Desktop/code_" .. os.date("!%Y-%m-%dT%H-%M-%SZ") .. ".png"
		end,
		language = function()
			return vim.bo.filetype
		end,
		disable_defaults = true,
	},
}
