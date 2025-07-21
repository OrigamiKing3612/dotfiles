vim.g.mapleader = " "
vim.g.maplocalleader = ";"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("config") .. "undodir"
vim.opt.undofile = true

vim.opt.spellfile = vim.fn.stdpath("config") .. "spell/en.utf-8.add"
vim.opt.spelllang = "en_us"
vim.opt.spell = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 300

vim.opt.colorcolumn = ""
vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = false

vim.g.snipmate_snippets_path = vim.fn.stdpath("config") .. "/lua/snippets/snipmate"
vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/lua/snippets/vscode"
vim.g.lua_snippets_path = vim.fn.stdpath("config") .. "/lua/snippets/lua"
