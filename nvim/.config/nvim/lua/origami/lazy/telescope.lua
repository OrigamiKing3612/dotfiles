return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-telescope/telescope-fzy-native.nvim",
		},
		opts = function()
			local actions = require("telescope.actions")
			local trouble_telescope = require("trouble.sources.telescope")

			return {
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
					},
					path_display = { "smart" },
					find_command = { "fd", "--type", "f", "--hidden", "--follow", "--exclude", ".git/" },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist,
							["<C-t>"] = trouble_telescope.open,
						},
					},
				},
			}
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("fzy_native")
			telescope.load_extension("fidget")

			local builtin = require("telescope.builtin")
			local is_inside_work_tree = {}

			vim.keymap.set("n", "<leader>ff", function()
				local opts = {}
				local cwd = vim.fn.getcwd()
				if is_inside_work_tree[cwd] == nil then
					vim.fn.system("git rev-parse --is-inside-work-tree")
					is_inside_work_tree[cwd] = vim.v.shell_error == 0
				end
				if is_inside_work_tree[cwd] then
					builtin.git_files(opts)
				else
					builtin.find_files(opts)
				end
			end)

			vim.keymap.set("n", "<leader>fg", builtin.live_grep)
			vim.keymap.set("n", "<leader>fq", builtin.quickfix)
			vim.keymap.set("n", "<leader>fh", builtin.help_tags)
			vim.keymap.set("n", "<leader>fn", "<cmd>Telescope fidget<CR>")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			telescope.load_extension("ui-select")
		end,
	},
}
