vim.keymap.set("n", "<leader>F", ":Themery<CR>")
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

-- tabs
vim.keymap.set("n", "<leader>tt", ":tabnew<CR>:Neotree filesystem reveal left<CR>")
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>")
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>")
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>")
vim.keymap.set("n", "<leader>td", ":tabnew %<CR>")

-- tmux
vim.keymap.set("n", "C-h", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "C-j", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "C-k", ":TmuxNavigateUp<CR>")
vim.keymap.set("n", "C-l", ":TmuxNavigateRight<CR>")

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- code companion
vim.keymap.set("n", "<leader>cc", ":CodeCompanionChat<CR>")
vim.keymap.set("n", "<leader>cca", ":CodeCompanionActions<CR>")
vim.api.nvim_set_keymap("n", "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })

-- spelling
vim.keymap.set("n", "z=", require("telescope.builtin").spell_suggest)
vim.keymap.set("n", "zg", "zg") -- add word to dictionary
vim.keymap.set("n", "zw", "zw") -- remove word from dictionary
vim.keymap.set("n", "]s", "]s") -- move to next spelling errors
vim.keymap.set("n", "[s", "[s") -- move to previous spelling errors

-- trouble
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>", { silent = true, noremap = true })
vim.keymap.set(
	"n",
	"<leader>cl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
	{ silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", { silent = true, noremap = true })

-- spider
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })

-- silicon
vim.keymap.set({ "v", "x" }, "<leader>sc", "<cmd>'<,'>Silicon<CR>")

-- snacks
vim.keymap.set("n", "<leader>lg", function()
	require("snacks").lazygit()
end)
vim.keymap.set("n", "<leader>llg", function()
	require("snacks").lazygit.log()
end)

vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("Wa", "wa", {})

-- go
vim.keymap.set("n", "<leader>scg", function()
	vim.cmd("!sqlc generate")
end, { desc = "Run sqlc generate" })

-- lsp
vim.keymap.set("n", "<leader><CR>", vim.diagnostic.open_float, { desc = "Show diagnostic message" })

vim.keymap.set("n", "H", "<cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "L", "<cmd>bnext<CR>", { desc = "Next buffer" })
