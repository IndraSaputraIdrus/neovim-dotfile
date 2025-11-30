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
    event = 'LazyFile',
    opts = {},
  },
}
