return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })

      vim.diagnostic.config({
        virtual_text = true,
        underline = { severity = vim.diagnostic.severity.ERROR },
      })

      vim.keymap.set('n', 'grd', vim.lsp.buf.definition)
      vim.keymap.set('n', 'grD', vim.lsp.buf.declaration)
      vim.keymap.set('n', 'gri', vim.lsp.buf.implementation)

      local servers = {
        'lua_ls',
        'vtsls',
        'svelte',
        'biome',
        'gopls',
      }

      vim.lsp.enable(servers)
    end,
  },
  {
    'j-hui/fidget.nvim',
    opts = {},
  },
}
