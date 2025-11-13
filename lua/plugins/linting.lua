return {
  'mfussenegger/nvim-lint',
  event = 'LazyFile',
  config = function()
    local lint = require('lint')
    lint.linters_by_ft = {
      json = { 'biomejs' },
      javascript = { 'biomejs' },
      typescript = { 'biomejs' },
      svelte = { 'eslint_d' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePost', {
      group = lint_augroup,
      callback = function()
        if vim.bo.modifiable then
          lint.try_lint()
        end
      end,
    })
  end,
}
