local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Color scheme
now(function()
  vim.o.termguicolors = true
  vim.cmd 'colorscheme miniautumn'
end)

-- Mini
now(function()
  require('mini.icons').setup()
  require('mini.statusline').setup()
  require('mini.tabline').setup()
end)

later(function()
  require('mini.ai').setup()
  require('mini.pick').setup()
  require('mini.files').setup()
  require('mini.extra').setup()

  vim.keymap.set('n', '<leader>ff', '<CMD>:Pick files<CR>', { desc = 'Open file picker' })
  vim.keymap.set('n', '-', '<CMD>lua MiniFiles.open()<CR>', { desc = 'Open File Manager' })
  vim.keymap.set('n', 'grr', '<CMD>lua MiniExtra.pickers.lsp({ scope = "references" })<CR>', { desc = 'LSP buf refenrences' })
  vim.keymap.set('n', 'grD', '<CMD>lua MiniExtra.pickers.diagnostic()<CR>', { desc = 'LSP buf diagnostic' })
  vim.keymap.set('n', 'grq', '<CMD>lua MiniExtra.pickers.list({ scope = "quickfix" })<CR>', { desc = 'LSP buf quickfix' })
end)
