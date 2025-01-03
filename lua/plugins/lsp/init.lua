return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		cmd = "Mason",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependecies = { "mason.nvim" },
		event = "BufReadPre", -- Lazy load saat buffer dibuka
		opts = {
			ensure_installed = { "lua_ls", "ts_ls", "svelte" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" }, -- Lazy load saat buffer dibaca atau dibuat
		config = function()
			local lspconfig = require("lspconfig")

			local on_attach = function(_, bufnr)
				local buf_map = function(mode, lhs, rhs, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, lhs, rhs, opts)
				end

				-- Keymaps untuk LSP
				buf_map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
				buf_map("n", "gD", vim.lsp.buf.definition, { desc = "Go To Definition" })
				buf_map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
				buf_map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
			end

			-- auto completion
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- lua ls
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

			-- typescript
			lspconfig.ts_ls.setup({
				on_attach = on_attach,
				capabilites = capabilities,
				init_options = {
					hostInfo = "neovim",
					maxTsServerMemory = 256, -- Batas memori untuk tsserver
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

			-- svelte
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
		end,
	},
}
