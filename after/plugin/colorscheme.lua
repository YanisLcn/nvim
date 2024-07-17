-- ============
-- 
-- Colorschemes
--
-- ============

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

-- ============
-- 
-- Utils Functions
--
-- ============

local available_colorschemes =
    { 'onedark', 'gruvbox', 'tokyodark', 'catppuccin-frappe', 'catppuccin-macchiato', 'catppuccin-mocha', 'kanagawa', 'duskfox', 'rose-pine' }

local function random_theme()
    return available_colorschemes[math.random(#available_colorschemes)]
end

local function remove_from_table(list, item)
    for i = #list, 1, -1 do
        if list[i] == item then
            table.remove(list, i)
        end
    end
    return list
end


local function apply_theme(theme)
    vim.cmd('colorscheme ' .. theme)
end

-- ============
-- 
-- Telescope Colorscheme Picker
--
-- ============

local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_set = require 'telescope.actions.set'
local action_state = require 'telescope.actions.state'
local utils = require 'telescope.utils'

local function colorscheme_picker(opts, cs)
    opts = opts or {}
    local before_color = vim.g.colors_name
    local colorschemes = remove_from_table(cs, before_color)
    local need_restore = true
    table.insert(colorschemes, 1, before_color)
    pickers
        .new(opts, {
            prompt_title = 'Change Colorscheme',
            finder = finders.new_table {
                results = colorschemes,
            },
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(bufnr, _)
                actions.select_default:replace(function()
                    actions.close(bufnr)
                    local selection = action_state.get_selected_entry()
                    apply_theme(selection[1])
                end)
                action_set.shift_selection:enhance {
                    post = function()
                        local selection = action_state.get_selected_entry()
                        if selection == nil then
                            utils.__warn_no_selection 'builtin.colorscheme'
                            return
                        end
                        need_restore = true
                        vim.cmd.colorscheme(selection.value)
                    end,
                }
                actions.close:enhance {
                    post = function()
                        if need_restore then
                            vim.cmd.colorscheme(before_color)
                        end
                    end,
                }
                return true
            end,
        })
        :find()
end

local dropdown_list = require('telescope.themes').get_dropdown()

vim.keymap.set('n', '<leader>cs', function()
    colorscheme_picker(dropdown_list, available_colorschemes)
end, { desc = 'Select [C]olor[S]cheme' })

local session_theme = random_theme()
apply_theme(session_theme)
