local M = {}

M.setup = function(lspconfig, on_attach, capabilities)
	-- typescript
	lspconfig.ts_ls.setup({
		on_attach = on_attach,
		capabilites = capabilities,
		init_options = {
			hostInfo = "neovim",
			maxTsServerMemory = 512, -- 256 , -- Batas memori untuk tsserver
		},
		handlers = {
			-- Matikan fitur format jika Anda menggunakan plugin formatter lain
			["textDocument/formatting"] = function() end,
		},
		settings = {
			completions = {
				completeFunctionCalls = true,
			},
		},
		flags = {
			debounce_text_changes = 150, -- Kurangi frekuensi update text untuk performa
		},
	})
end

return M
