local map = vim.keymap.set

-- better up/down
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- exit from insert mode
map('i', 'jk', '<esc>', { desc = 'exic insert mode', silent = true })

-- Buffer
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })

-- LSP
map('n', 'grd', vim.lsp.buf.definition)
map('n', 'grD', vim.lsp.buf.declaration)
map('n', 'gri', vim.lsp.buf.implementation)

-- Mini plugins keymap
-- Mini files
map('n', '-', '<cmd>lua MiniFiles.open()<cr>', { desc = 'Open file tree' })

-- Mini picker
map('n', '<leader>ff', '<cmd>:Pick files<cr>', { desc = 'Open file picker' })
map('n', 'grr', '<cmd>lua MiniExtra.pickers.lsp({ scope = "references" })<cr>', { desc = 'LSP buf refenrences' })
map('n', 'grD', '<cmd>lua MiniExtra.pickers.diagnostic()<cr>', { desc = 'LSP buf diagnostic' })
map('n', 'grq', '<cmd>lua MiniExtra.pickers.list({ scope = "quickfix" })<cr>', { desc = 'LSP buf quickfix' })
