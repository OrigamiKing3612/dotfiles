-- move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- remove the \n at the end of line
vim.keymap.set("n", "J", "mzJ`z")

-- move half page up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- move when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Renames the word that is under the cursor
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- tmux
vim.keymap.set("n", "C-h", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "C-j", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "C-k", ":TmuxNavigateUp<CR>")
vim.keymap.set("n", "C-l", ":TmuxNavigateRight<CR>")

-- lsp
vim.keymap.set("n", "<leader><CR>", vim.diagnostic.open_float, { desc = "Show diagnostic message" })

vim.keymap.set("n", "<leader>lg", Snacks.lazygit({ desc = "Open Lazygit" }))
vim.keymap.set("n", "<leader>llg", Snacks.lazygit.log({ desc = "Open Lazygit Log" }))
vim.keymap.set({ "n", "v" }, "<leader>K", Snacks.image.hover({ desc = "Hover Image" }))
vim.keymap.set("n", "<leader>ff", function()
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
end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function()
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
end, { desc = "Find with Grep" })
vim.keymap.set("n", "<leader>fh", Snacks.picker.help({ desc = "Find Help" }))
vim.keymap.set("n", "<leader>fq", Snacks.picker.qflist({ desc = "Quickfix List" }))
vim.keymap.set("n", "<leader>fb", Snacks.picker.buffers({ desc = "Find Buffers" }))
vim.keymap.set("n", "<leader>fs", Snacks.picker({ desc = "Open Picker List" }))
vim.keymap.set("n", "<leader>fl", Snacks.picker.lsp_symbols({ desc = "Find LSP Symbols" }))
