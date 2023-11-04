-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

local telescope = require 'telescope'
local telescopeConfig = require 'telescope.config'

-- Starting with the default Telescope configuration
local vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--hidden', '--glob', '!**/.git/*' }

-- I do not want to search in hidden files.
table.insert(vimgrep_arguments, '--hidden')
-- I do not want to search in `.git` directory.
table.insert(vimgrep_arguments, '--glob')
table.insert(vimgrep_arguments, '!**/.git/*')

telescope.setup {
  defaults = {
    vimgrep_arguments = vimgrep_arguments,
    path_display = {
      'smart',
      'truncate',
      'shorten',
      shorten = {
        len = 1,
        exclude = { 1, -2, -1 },
      },
    },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  extension = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
    },
  },
}

local builtin = require 'telescope.builtin'

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
local current_buffer_fuzzy_find = function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>sm', builtin.man_pages, { desc = '[S]earch [M]an pages' })
vim.keymap.set('n', '<leader>cs', builtin.colorscheme, { desc = '[C]olor [S]cheme' })
vim.keymap.set('n', '<leader>vo', builtin.vim_options, { desc = '[V]im [O]ptions' })
vim.keymap.set('n', '<leader>ss', builtin.spell_suggest, { desc = '[S]pell [S]uggest' })
vim.keymap.set('n', '<leader>km', builtin.keymaps, { desc = 'All [K]ey[M]aps' })
vim.keymap.set('n', '<leader>hl', builtin.highlights, { desc = 'Available [H]igh [L]ights' })
