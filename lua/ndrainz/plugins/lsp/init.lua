-- local servers = { "lua_ls", "biome", "svelte", "gopls" }
local servers = { 'lua_ls', 'biome', 'svelte' }

return {
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    cmd = 'Mason',
    opts = {},
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependecies = { 'mason.nvim' },
    event = 'BufReadPre', -- Lazy load saat buffer dibuka
    opts = {
      ensure_installed = servers,
      automatic_instalation = true,
    },
  },
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' }, -- Lazy load saat buffer dibaca atau dibuat
    config = function()
      local lspconfig = require 'lspconfig'

      local on_attach = function(_, bufnr)
        local buf_map = function(mode, lhs, rhs, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Keymaps untuk LSP
        buf_map('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
        buf_map('n', 'gD', vim.lsp.buf.definition, { desc = 'Go To Definition' })
        buf_map('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename Symbol' })
        buf_map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
      end

      -- auto completion
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      for _, name in ipairs(servers) do
        require('plugins.lsp.servers.' .. name).setup(lspconfig, on_attach, capabilities)
      end
    end,
  },
}
