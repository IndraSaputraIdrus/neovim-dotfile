local M = {}

M.setup = function(lspconfig, on_attach, capabilities)
  lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' }, -- Hindari error untuk `vim` global
        },
        telemetry = {
          enable = false, -- Matikan telemetry untuk performa
        },
      },
    },
  }
end

return M
