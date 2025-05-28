return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' }, -- Lazy load
  config = function()
    local linter = require 'lint'

    linter.linters_by_ft = {
      javascript = { 'eslint_d', 'biomejs' },
      typescript = { 'eslint_d', 'biomejs' },
      javascriptreact = { 'eslint_d', 'biomejs' },
      typescriptreact = { 'eslint_d', 'biomejs' },
      svelte = { 'eslint_d' },
    }

    -- Create autocommand which carries out the actual linting
    -- on the specified events.
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        -- Only run the linter in buffers that you can modify in order to
        -- avoid superfluous noise, notably within the handy LSP pop-ups that
        -- describe the hovered symbol using Markdown.
        if vim.bo.modifiable then
          lint.try_lint()
        end
      end,
    })

    vim.keymap.set('n', '<leader>l', function()
      linter.try_lint()
    end, { desc = 'Trigger linting for current file' })
  end,
}
