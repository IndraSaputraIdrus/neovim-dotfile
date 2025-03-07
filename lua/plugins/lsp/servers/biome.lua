local M = {}

M.setup = function(lspconfig, on_attach, capabilities)
	-- biome
	lspconfig.biome.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "biome", "lsp-proxy" },
		filetypes = {
			"astro",
			"css",
			"graphql",
			"javascript",
			"javascriptreact",
			"json",
			"jsonc",
			"svelte",
			"typescript",
			"typescript.tsx",
			"typescriptreact",
			"vue",
		},
		root_dir = lspconfig.util.root_pattern("biome.json", "biome.jsonc"),
		single_file_support = false,
	})
end

return M
