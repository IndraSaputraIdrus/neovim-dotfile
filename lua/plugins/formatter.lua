return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	event = { "BufReadPre", "BufNewFile" }, -- Lazy load
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
				print("formatting")
			end,
			mode = { "n", "v" },
			desc = "Format Injected Langs",
		},
	},
	opts = {
		formatters = {
			prettier = {
				require_cwd = true,
			},
			biome = {
				require_cwd = true,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			svelte = { "prettierd" },
			typescript = { "biome", "prettierd" },
			javascript = { "biome", "prettierd" },
			typescriptreact = { "prettierd" },
			javascriptreact = { "prettierd" },
			css = { "biome" },
		},
	},
}
