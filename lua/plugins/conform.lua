return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>fm',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    -- formatters = {
      -- biome = {
      --   require_cwd = true,
      -- },
      -- prettierd = {
      --   require_cwd = true,
      -- },
    -- },
    formatters_by_ft = {
      lua = { 'stylua' },
      svelte = { 'prettierd' },
      typescript = { 'biome', 'biome-organize-imports', 'prettierd' },
      javascript = { 'biome', 'biome-organize-imports', 'prettierd' },
      typescriptreact = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      css = { 'biome' },
      nix = { 'nixfmt' },
      json = { 'biome' },
    },
  },
}
