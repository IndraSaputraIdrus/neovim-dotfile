local M = {}

M.setup = function(lspconfig, on_attach, capabilities)
	-- golang
	lspconfig.gopls.setup({
		on_attach = on_attach,
		capabilites = capabilities,
	})
end

return M
