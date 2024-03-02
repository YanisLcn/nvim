local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "html" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})
