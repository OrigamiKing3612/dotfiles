return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = function(_, opts)
		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

		--vim.cmd(":Neotree filesystem reveal left")
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")

		local function on_move(data)
			Snacks.rename.on_rename_file(data.source, data.destination)
		end
		local events = require("neo-tree.events")
		opts.event_handlers = opts.event_handlers or {}
		vim.list_extend(opts.event_handlers, {
			{ event = events.FILE_MOVED, handler = on_move },
			{ event = events.FILE_RENAMED, handler = on_move },
		})

		return {
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
			filesystem = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				use_libuv_file_watcher = true,
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						"node_modules",
						".DS_Store",
					},
					hide_by_pattern = {
						--"*.meta",
						--"*/src/*/tsconfig.json",
					},
					always_show = {
						".gitignored",
					},
					always_show_by_pattern = {
						--".env*",
					},
					never_show = {
						".DS_Store",
						".git",
						".swiftpm",
						".build",
					},
					never_show_by_pattern = {
						--".null-ls_*",
					},
				},
			},
			window = {
				persist_state = true,
				mappings = {
					["<bs>"] = "nop",
				},
			},
		}
	end,
}
