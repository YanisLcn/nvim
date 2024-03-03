-- Gruvbox.nvim
vim.o.background = 'dark'

require('gruvbox').setup {
    overrides = { SignColumn = { bg = '#282828' }, NonText = { fg = '#928374' } },
}

vim.cmd [[colorscheme gruvbox]]
