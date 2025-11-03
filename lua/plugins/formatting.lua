-- Conform
MiniDeps.later(function()
  MiniDeps.add {
    source = 'stevearc/conform.nvim',
  }

  -- Run the first available formatter followed by more formatters
  local function first(bufnr, ...)
    local conform = require 'conform'
    for i = 1, select('#', ...) do
      local formatter = select(i, ...)
      if conform.get_formatter_info(formatter, bufnr).available then
        return formatter
      end
    end
    return select(1, ...)
  end

  require('conform').setup {
    formatters_by_ft = {
      lua = { 'stylua' },
      svelte = { 'prettierd' },
      typescript = function(bufnr)
        return { first(bufnr, 'biome', 'prettierd'), 'biome-organize-imports' }
      end,
      javascript = function(bufnr)
        return { first(bufnr, 'biome', 'prettierd'), 'biome-organize-imports' }
      end,
      typescriptreact = { 'biome', 'biome-organize-imports' },
      javascriptreact = { 'biome', 'biome-organize-imports' },
      css = { 'biome' },
      nix = { 'nixfmt' },
      json = { 'biome' },
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
  }

  vim.keymap.set('n', '<leader>fm', "<cmd>lua require('conform').format({ lsp_format = 'fallback', async = true })<cr>", { desc = 'Format with conform' })
end)
