-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require('formatter').setup {
  filetype = {

    lua = {
      require('formatter.filetypes.lua').stylua,
    },

    rust = {
      require('formatter.filetypes.rust').rustfmt,
    },

    python = {
      require('formatter.filetypes.python').black,
    },

    c = {
      require('formatter.filetypes.c').clangformat,
    },

    ['*'] = {
      require('formatter.filetypes.any').remove_trailing_whitespace,
    },
  },
}

vim.keymap.set('n', '<leader>f', '<CMD>FormatWrite<CR>', { desc = '[F]ormat Write' })
