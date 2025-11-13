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

      vim.lsp.enable({
        'lua_ls',
        'ts_ls',
        'svelte',
        'biome',
        'gopls',
      })
    end,
  },
  {
    'j-hui/fidget.nvim',
    event = 'LazyFile',
    opts = {},
  },
  {
    'mason-org/mason.nvim',
    event = 'VeryLazy',
    opts = {},
  },
}
