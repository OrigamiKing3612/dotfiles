function SetColor()
	vim.cmd("colorscheme " .. "catppuccin")
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		proiority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				background = {
					dark = "mocha",
				},
				dim_inactive = {
					enabled = true,
					shade = "dark",
					percentage = 0.15,
				},
				default_integrations = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					mason = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
							ok = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
							ok = { "underline" },
						},
						inlay_hints = {
							background = true,
						},
					},
					lsp_trouble = false,
					neotree = true,
					fidget = true,
					copilot_vim = true,
					telescope = {
						enabled = true,
					},
				},
			})
		end,
	},
	{
		"lunarvim/darkplus.nvim",
		name = "darkplus",
		config = function()
			require("darkplus").setup({})
		end,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
				transparent = true, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
				styles = {
					comments = { italic = true },
					keywords = { italic = false, bold = true },
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
			})
		end,
	},
	{
		"sainnhe/everforest",
		name = "everforest",
		config = function()
			vim.g.everforest_enable_italic = true
			vim.g.everforest_background = "hard"
		end,
	},
}
