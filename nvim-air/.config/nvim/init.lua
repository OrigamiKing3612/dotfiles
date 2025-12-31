require("set")

vim.pack.add({
    { src = "https://github.com/catppuccin/nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/christoomey/vim-tmux-navigator" },
    { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
    { src = "https://github.com/williamboman/mason.nvim" },
})

require("mason").setup()
require("mason-lspconfig").setup()

require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    background = {
        dark = "mocha",
    },
    default_integrations = true,
    custom_highlights = function(C)
        local O = require("catppuccin").options
        return {
            ["@tag"] = { fg = C.mauve },                                                    -- Tags like html tag names.
            ["@tag.attribute"] = { fg = C.teal, style = O.styles.miscs or { "italic" } },   -- Tags like html tag names.
            ["@type.builtin"] = { fg = C.yellow, style = O.styles.properties or { "italic" } }, -- For builtin types.
            ["@variable.member"] = { fg = C.lavender },                                     -- For fields.
            ["@property"] = { fg = C.lavender, style = O.styles.properties or {} },         -- Same as TSField.
        }
    end,
})

vim.cmd("colorscheme catppuccin")

vim.lsp.config("lua_ls", {
    filetypes = { "lua" },
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})

vim.lsp.enable({"lua_ls", "bashls", "jsonls", "dockerls","yamlls"})
require("keymaps")
