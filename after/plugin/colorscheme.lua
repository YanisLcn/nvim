local M = {}

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
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = 'none',
                },
            },
        },
    },
}

-- Rosé-Pine.nvim
require('rose-pine').setup {
    variant = 'moon',
}

local available_colorschemes =
    { 'onedark', 'gruvbox', 'tokyodark', 'catppuccin-frappe', 'catppuccin-macchiato', 'catppuccin-mocha', 'kanagawa', 'duskfox', 'rose-pine' }

function M.random_theme()
    return available_colorschemes[math.random(#available_colorschemes)]
end

M.session_theme = M.random_theme()

function M.apply_theme(theme)
    vim.cmd('colorscheme ' .. theme)
end

M.apply_theme(M.session_theme)

local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

function M.colorscheme_picker(opts)
    opts = opts or {}
    pickers
        .new(opts, {
            finder = finders.new_table {
                results = available_colorschemes,
            },
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(bufnr, _)
                actions.select_default:replace(function()
                    actions.close(bufnr)
                    local selection = action_state.get_selected_entry()
                    M.apply_theme(selection[1])
                end)
                return true
            end,
        })
        :find()
end

vim.keymap.set('n', '<leader>cs', function()
    M.colorscheme_picker {}
end, { desc = 'Select [C]olor[S]cheme' })

return M
