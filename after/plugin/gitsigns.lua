local function on_attach(bufnr)
  vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

  local gs = package.loaded.gitsigns

  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    opts.expr = true
    vim.keymap.set(mode, l, r, opts)
  end

  -- don't override the built-in and fugitive keymaps

  local function func_next_hunk()
    if vim.wo.diff then
      return ']c'
    end
    vim.schedule(function()
      gs.next_hunk()
    end)
    return '<Ignore>'
  end
  map({ 'n', 'v' }, ']c', func_next_hunk, { desc = 'Jump to next hunk' })

  local function func_prev_hunk()
    if vim.wo.diff then
      return '[c'
    end
    vim.schedule(function()
      gs.prev_hunk()
    end)
    return '<Ignore>'
  end
  map({ 'n', 'v' }, '[c', func_prev_hunk, { desc = 'Jump to previous hunk' })

  map('n', '<leader>hb', function()
    gs.blame_line { full = true }
  end)
  map({ 'n', 'v' }, '<leader>tb', gs.toggle_current_line_blame, { desc = 'Toggle Current Line [B]lame' })
end

require('gitsigns').setup {
  -- See `:help gitsigns.txt`
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = on_attach,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
}
