local M = {}

M.setup = function(lspconfig, on_attach, capabilities)
  lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilites = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" }, -- Hindari error untuk `vim` global
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false, -- Matikan telemetry untuk performa
			},
		},
	},
})
end

return M
