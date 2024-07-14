local function vimtex_cmd()
    vim.cmd 'VimtexCompile'
end

vim.keymap.set({ 'n', 'v' }, '<leader>cc', vimtex_cmd, { desc = 'Compile Tex' })
