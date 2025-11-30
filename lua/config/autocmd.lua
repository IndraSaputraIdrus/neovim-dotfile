-- Don't auto-wrap comments and don't insert comment leader after hitting 'o'.
-- Do on `FileType` to always override these changes from filetype plugins.
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Proper "formatoptions"',
  group = vim.api.nvim_create_augroup('formatoptions', { clear = true }),
  callback = function() vim.cmd('setlocal formatoptions-=c formatoptions-=o') end,
})
