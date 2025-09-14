vim.g.mapleader = " "
vim.g.maplocalleader = ";"

vim.o.nu = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true

vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath("config") .. "undodir"
vim.o.undofile = true

vim.o.spellfile = vim.fn.stdpath("config") .. "spell/en.utf-8.add"
vim.o.spelllang = "en_us"
vim.o.spell = false

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.o.updatetime = 300

vim.o.colorcolumn = ""
vim.o.termguicolors = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = false

vim.g.snipmate_snippets_path = vim.fn.stdpath("config") .. "/lua/snippets/snipmate"
vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/lua/snippets/vscode"
vim.g.lua_snippets_path = vim.fn.stdpath("config") .. "/lua/snippets/lua"

vim.o.winborder = "rounded"
