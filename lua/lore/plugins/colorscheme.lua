-- Gruvbox.nvim
vim.o.background = 'dark'

require('gruvbox').setup {
    overrides = { SignColumn = { bg = '#282828' }, NonText = { fg = '#928374' } },
}

require('onedark').setup {
    style = 'warmer'
}

vim.cmd [[colorscheme onedark]]
