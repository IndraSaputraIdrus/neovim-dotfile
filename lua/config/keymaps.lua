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

  -- LSP
  vim.keymap.set('n', 'grd', vim.lsp.buf.definition)
  vim.keymap.set('n', 'grD', vim.lsp.buf.declaration)
  vim.keymap.set('n', 'gri', vim.lsp.buf.implementation)

  -- Mini plugins keymap
  -- Mini files
  vim.keymap.set('n', '-', '<cmd>lua MiniFiles.open()<cr>', { desc = 'Open file tree' })

  -- Mini picker
  vim.keymap.set('n', '<leader>ff', '<cmd>:Pick files<cr>', { desc = 'Open file picker' })
  vim.keymap.set(
    'n',
    'grr',
    '<cmd>lua MiniExtra.pickers.lsp({ scope = "references" })<cr>',
    { desc = 'LSP buf refenrences' }
  )
  vim.keymap.set('n', 'grD', '<cmd>lua MiniExtra.pickers.diagnostic()<cr>', { desc = 'LSP buf diagnostic' })
  vim.keymap.set(
    'n',
    'grq',
    '<cmd>lua MiniExtra.pickers.list({ scope = "quickfix" })<cr>',
    { desc = 'LSP buf quickfix' }
  )
end)
