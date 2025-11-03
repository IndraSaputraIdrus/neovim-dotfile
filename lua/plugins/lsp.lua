-- LSP
MiniDeps.now(function()
  MiniDeps.add {
    source = 'neovim/nvim-lspconfig',
    -- Supply dependencies near target plugin
    depends = { 'williamboman/mason.nvim', 'j-hui/fidget.nvim' },
  }

  require('mason').setup {}
  require('fidget').setup {}

  vim.lsp.enable { 'lua_ls', 'ts_ls', 'biome', 'svelte' }
  vim.lsp.config('lua_ls', {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim', 'MiniDeps' },
        },
      },
    },
  })

  vim.keymap.set('n', 'grd', vim.lsp.buf.definition, { desc = '' })
end)
