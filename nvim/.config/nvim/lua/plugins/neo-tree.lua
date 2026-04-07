return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = function(_, opts)
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = " ",
					[vim.diagnostic.severity.HINT] = "󰌵 ",
				},
				linehl = {
					[vim.diagnostic.severity.ERROR] = "Error",
					[vim.diagnostic.severity.WARN] = "Warn",
					[vim.diagnostic.severity.INFO] = "Info",
					[vim.diagnostic.severity.HINT] = "Hint",
				},
			},
		})

		vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>")

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
					["."] = "nop",
				},
			},
		}
	end,
}
