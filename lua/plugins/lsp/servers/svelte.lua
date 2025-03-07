local M = {}

M.setup = function(lspconfig, on_attach, capabilities)
	lspconfig.svelte.setup({
		on_attach = on_attach,
		capabilites = capabilities,
		init_options = {
			configuration = {
				svelte = {
					plugin = {
						html = {
							hover = {
								documentation = false, -- Matikan dokumentasi hover untuk menghemat memori
							},
						},
						css = {
							completions = false, -- Nonaktifkan auto-complete CSS jika tidak digunakan
						},
					},
				},
			},
		},
		settings = {
			svelte = {
				enable = true,
				languageServer = {
					maxMemory = 512, -- Batasi penggunaan memori ke 512MB
				},
			},
		},
		flags = {
			debounce_text_changes = 300, -- Kurangi frekuensi update text untuk performa
		},
	})
end

return M
