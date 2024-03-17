local configs = require 'nvim-treesitter.configs'

configs.setup {
    ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'html', 'rust' },
    auto_install = true,
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    rainbow = { enable = true },
}
