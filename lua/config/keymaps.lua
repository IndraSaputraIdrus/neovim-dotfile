vim.schedule(function()
  -- better up/down
  vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
  vim.keymap.set({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
  vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
  vim.keymap.set({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

  -- exit from insert mode
  vim.keymap.set('i', 'jk', '<esc>', { desc = 'exic insert mode', silent = true })

  -- Buffer
  vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
  vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
  vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
  vim.keymap.set('n', '<leader>x', '<cmd>bdelete<cr>', { desc = 'Delete Buffer' })

  -- Disable default map
  -- vim.keymap.set('n', 's', '<Nop>')
  -- vim.keymap.set('n', 'S', '<Nop>')
end)
