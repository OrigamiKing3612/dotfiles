return {
	"folke/snacks.nvim",
	proiority = 1001,
	opts = {
		image = {},
		lazygit = {
			configure = true,
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
	},
}
