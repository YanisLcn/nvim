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

-- Kanagawa.nvim
require('kanagawa').setup {
    theme = 'wave',
}

-- Rosé-Pine.nvim
require('rose-pine').setup {
    variant = 'moon',
}

local function random_theme()
    local available_colorschemes =
        { 'onedark', 'gruvbox', 'tokyodark', 'catppuccin-frappe', 'catppuccin-macchiato', 'catppuccin-mocha', 'kanagawa', 'duskfox', 'rose-pine' }
    return available_colorschemes[math.random(#available_colorschemes)]
end

Session_theme = random_theme()

vim.cmd('colorscheme ' .. Session_theme)
