local conform = require 'conform'

local setup = {
  formatters_by_ft = {
    lua = { 'stylua' },

    sh = { 'beautysh' },

    ocaml = { 'ocamlformat' },

    rust = { 'rustfmt' },

    java = { 'google-java-format' },

    c = { 'clang-format' },
    cpp = { 'clang-format' },

    html = { 'prettier' },
    yml = { 'prettier' },
    yaml = { 'prettier' },
    css = { 'prettier' },
    json = { 'prettier' },

    tex = { 'latexindent' },
  },

  -- formatters = {
  --   latexindent = {
  --     prepend_args = { '-l', '-w', '-t', '-sl', '-g', 'indent.log'},
  --   },
  -- },
}

conform.setup(setup)
vim.keymap.set({ 'n', 'v' }, '<leader>f', conform.format)
