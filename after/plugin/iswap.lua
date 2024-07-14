local function swap_interactive()
    vim.cmd 'ISwap'
end

local function swap_node()
    vim.cmd 'ISwapNode'
end

vim.keymap.set({ 'n', 'v' }, '<leader>si', swap_interactive, { desc = 'Swap [I]nteractively' })
vim.keymap.set({ 'n', 'v' }, '<leader>sn', swap_node, { desc = 'Swap [N]ode' })
