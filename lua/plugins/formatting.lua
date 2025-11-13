return {
  'stevearc/conform.nvim',
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>fm',
      function()
        require('conform').format({ lsp_format = 'fallback', timeout_ms = 3000 })
      end,
      mode = { 'n', 'x' },
      desc = 'Format Langs',
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      json = { 'biome' },
      typescript = { 'biome', 'prettierd', 'biome-organize-imports' },
      typescript = { 'biome', 'prettierd', 'biome-organize-imports' },
      go = { 'gofmt' },
    },
    formatters = {
      injected = { options = { ignore_errors = true } },
      biome = {
        require_cwd = true,
      },
      prettierd = {
        require_cwd = true,
      },
      ['biome-organize-imports'] = {
        require_cwd = true,
      },
    },
  },
}
