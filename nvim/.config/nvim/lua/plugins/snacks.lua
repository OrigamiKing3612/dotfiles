return {
	"folke/snacks.nvim",
	priority = 1001,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- image = {},
		picker = {
			layouts = {
				telescope = {
					reverse = true,
					layout = {
						box = "horizontal",
						backdrop = 60,
						width = 0.8,
						height = 0.9,
						border = "none",
						{
							box = "vertical",
							{ win = "list", title = " Results ", title_pos = "center", border = "single" },
							{
								win = "input",
								height = 1,
								border = "single",
								title = "{title} {live} {flags}",
								title_pos = "center",
							},
						},
						{
							win = "preview",
							title = "{preview:Preview}",
							width = 0.45,
							border = "single",
							title_pos = "center",
						},
					},
				},
			},
			layout = "telescope",
		},
		input = {
			enabled = true,
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
		git = {
			enabled = false,
		},
		words = {
			enabled = false,
		},
		win = {
			border = "rounded",
			backdrop = {
				-- blend = 50,
				-- transparent = false,
			},
		},
		styles = {
			float = {},
		},
		statuscolumn = {
			enabled = true,
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
				local is_inside_work_tree = {}
				local cwd = vim.fn.getcwd()
				if is_inside_work_tree[cwd] == nil then
					vim.fn.system("git rev-parse --is-inside-work-tree")
					is_inside_work_tree[cwd] = vim.v.shell_error == 0
				end

				if is_inside_work_tree[cwd] then
					Snacks.picker.git_files()
				else
					Snacks.picker.files()
				end
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				local is_inside_work_tree = {}
				local cwd = vim.fn.getcwd()
				if is_inside_work_tree[cwd] == nil then
					vim.fn.system("git rev-parse --is-inside-work-tree")
					is_inside_work_tree[cwd] = vim.v.shell_error == 0
				end

				if is_inside_work_tree[cwd] then
					Snacks.picker.git_grep()
				else
					Snacks.picker.grep()
				end
			end,
			desc = "Find with Grep",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Find Help",
		},
		{
			"<leader>fq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Find Buffers",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker()
			end,
			desc = "Open Picker List",
		},
		{
			"<leader>fl",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "Find LSP Symbols",
		},
	},
}
