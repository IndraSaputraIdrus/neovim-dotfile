return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'j-hui/fidget.nvim', opts = {} },
    { 'mason-org/mason.nvim', opts = {} },
  },
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

    vim.lsp.enable { 'ts_ls', 'lua_ls', 'svelte' }
    vim.keymap.set('n', 'grd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'grD', vim.lsp.buf.declaration)
    vim.keymap.set('n', 'gri', vim.lsp.buf.implementation)

    vim.diagnostic.config {
      virtual_text = true,
      underline = { severity = vim.diagnostic.severity.ERROR },
    }
  end,
}
