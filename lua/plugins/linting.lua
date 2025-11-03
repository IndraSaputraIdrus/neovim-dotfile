-- Linter
MiniDeps.later(function()
  MiniDeps.add {
    source = 'mfussenegger/nvim-lint',
  }

  local lint = require 'lint'
  lint.linters_by_ft = {
    json = { 'biomejs' },
    javascript = { 'biomejs' },
    typescript = { 'biomejs' },
    svelte = { 'biomejs' },
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
end)
