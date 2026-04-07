vim.keymap.set({ "n", "v", "x" }, "j", "gj")
vim.keymap.set({ "n", "v", "x" }, "k", "gk")

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

-- in Visual Line mode, copy and paste a line
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("v", "p", '"_dP')

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>p", "<nop>")

-- Renames the word that is under the cursor
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>S", ":%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>")

-- spelling
vim.keymap.set("n", "z=", function()
	Snacks.picker.spelling({
		layout = "telescope",
	})
end)
vim.keymap.set("n", "zg", "zg") -- add word to dictionary
vim.keymap.set("n", "zw", "zw") -- remove word from dictionary
vim.keymap.set("n", "]s", "]s") -- move to next spelling errors
vim.keymap.set("n", "[s", "[s") -- move to previous spelling errors

vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("Wa", "wa", {})

-- lsp
vim.keymap.set("n", "<leader><CR>", vim.diagnostic.open_float, { desc = "Show diagnostic message" })

vim.keymap.set("n", "<leader>lg", function()
	Snacks.lazygit()
end, { desc = "Open Lazygit" })
vim.keymap.set("n", "<leader>llg", function()
	Snacks.lazygit.log()
end, { desc = "Open Lazygit Log" })
vim.keymap.set("n", "<leader>K", function()
	Snacks.image.hover()
end, { desc = "Hover Image" })
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
vim.keymap.set("n", "<leader>fh", function()
	Snacks.picker.help()
end, { desc = "Find Help" })
vim.keymap.set("n", "<leader>fq", function()
	Snacks.picker.qflist()
end, { desc = "Quickfix List" })
vim.keymap.set("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fs", function()
	Snacks.picker()
end, { desc = "Open Picker List" })
vim.keymap.set("n", "<leader>fl", function()
	Snacks.picker.lsp_symbols()
end, { desc = "Find LSP Symbols" })
--
