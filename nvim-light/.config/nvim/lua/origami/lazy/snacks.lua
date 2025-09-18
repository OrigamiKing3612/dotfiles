return {
	"folke/snacks.nvim",
	priority = 1001,
	lazy = false,
	opts = {
		-- image = {},
		picker = {},
		input = {
			enable = true,
			relative = "cursor",
			row = -3,
			col = 0,
		},
		lazygit = {
			configure = false,
			win = {
				style = "lazygit",
			},
		},
		bigfile = {
			notify = true,
			size = 1.5 * 1024 * 1024, -- 1.5MB
			setup = function(ctx)
				if vim.fn.exists(":NoMatchParen") ~= 0 then
					vim.cmd([[NoMatchParen]])
				end
				Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
				vim.b.minianimate_disable = true
				vim.schedule(function()
					if vim.api.nvim_buf_is_valid(ctx.buf) then
						vim.bo[ctx.buf].syntax = ctx.ft
					end
				end)
			end,
		},
		git = {
			enable = true,
		},
		words = {
			enable = true,
		},
	},
	keys = {
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Open Lazygit",
		},
		{
			"<leader>llg",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Open Lazygit Log",
		},
		{
			"<leader>K",
			function()
				Snacks.image.hover()
			end,
			desc = "Hover Image",
			mode = { "n" },
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
			mode = { "n" },
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
			mode = { "n" },
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
			mode = { "n" },
		},
	},
}
