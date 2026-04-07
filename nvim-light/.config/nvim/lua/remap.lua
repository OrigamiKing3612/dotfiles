vim.keymap.set("n", "<leader>L", ":Lazy<CR>")

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

-- jump to the first word in a line
vim.keymap.set("n", "9", "0w")

-- in Visual Line mode, copy and paste a line
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("v", "p", '"_dP')

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>p", "<nop>")
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true })
end)

-- Renames the word that is under the cursor
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- tmux
vim.keymap.set("n", "C-h", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "C-j", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "C-k", ":TmuxNavigateUp<CR>")
vim.keymap.set("n", "C-l", ":TmuxNavigateRight<CR>")

vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("Wa", "wa", {})

-- lsp
vim.keymap.set("n", "<leader><CR>", vim.diagnostic.open_float, { desc = "Show diagnostic message" })

vim.keymap.set("n", "H", "<cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "L", "<cmd>bnext<CR>", { desc = "Next buffer" })

vim.keymap.set("n", "<leader>qq", "<cmd>:q<CR>")
vim.keymap.set("n", "<leader>qqa", "<cmd>:qa<CR>")
