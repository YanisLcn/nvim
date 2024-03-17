-- Gruvbox.nvim
require('gruvbox').setup {
    overrides = { SignColumn = { bg = '#282828' }, NonText = { fg = '#928374' } },
}

-- Onedark.nvim
require('onedark').setup {
    style = 'warmer',
}

-- Tokyodark.nvim
require('tokyodark').setup {
    terminal_colors = true,
}

local available_colorschemes = { 'onedark', 'gruvbox', 'tokyodark' }
local cs = available_colorschemes[math.random(#available_colorschemes)]

vim.cmd("colorscheme " .. cs)
