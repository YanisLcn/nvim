--  [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

local telescope = require 'telescope'
local actions = require 'telescope.actions'
local builtins = require 'telescope.builtin'
local action_layout = require 'telescope.actions.layout'

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<M-p>'] = action_layout.toggle_preview,
            },
            n = {
                ['<M-p>'] = action_layout.toggle_preview,
            },
        },
    },
    pickers = {
        buffers = {
            mappings = {
                i = {
                    ['<c-d>'] = actions.delete_buffer + actions.move_to_top,
                },
            },
        },
        colorscheme = {
            previewer = true,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
    },
}

-- Enable telescope fzf native, if installed
pcall(telescope.load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', builtins.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtins.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtins.current_buffer_fuzzy_find(require('telescope.themes').get_ivy {
        winblend = 10,
        previewer = true,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', builtins.git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', builtins.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sa', function()
    builtins.find_files { cwd = '~' }
end, { desc = '[S]earch among [A]ll files' })
vim.keymap.set('n', '<leader>sh', builtins.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtins.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtins.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtins.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtins.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>cs', function()
    builtins.colorscheme {}
end, { desc = 'Select [C]olor[S]cheme' })
