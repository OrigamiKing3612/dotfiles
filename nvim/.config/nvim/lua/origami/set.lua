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
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.spellfile = os.getenv("HOME") .. "/.nvim/spell/en.utf-8.add"
vim.opt.spelllang = "en_us"
vim.opt.spell = true

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
